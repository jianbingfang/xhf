package com.xthena.sckf.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.sckf.manager.JyXmFbManager;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("sckf")
public class SckfHomeController {

    /**
     * logger.
     */
    private static Logger logger = LoggerFactory
            .getLogger(SckfHomeController.class);

    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private HrGwbmManager hrGwbmManager;

    @Autowired
    private JyXmManager jyXmManager;

    @Autowired
    private CommHtManager commHtManager;

    @Autowired
    private JyXmFbManager jyXmFbManager;

    @RequestMapping("sckf-home")
    public String home(Model model) {

        String hql = "select jyXm from JyXm  jyXm where jyXm.fkbdate>? and jyXm.fkbdate<? order by jyXm.fkbdate";
        Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.DAY_OF_WEEK, 2);
        Date startDate = c.getTime();
        c.add(Calendar.WEEK_OF_YEAR, 1);
        Date endDate = c.getTime();
        model.addAttribute("thisweek", jyXmManager.find(hql, startDate, endDate));

        startDate = endDate;
        c.add(Calendar.WEEK_OF_YEAR, 1);
        endDate = c.getTime();
        model.addAttribute("nextweek", jyXmManager.find(hql, startDate, endDate));

        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        String hqlYearJyxm = "select distinct(year(jyXm.fkbdate)) from JyXm jyXm where jyXm.fkbdate!=''";
        String hqlYearHt = "select distinct(year(ht.fqiandingdate)) from CommHt ht where ht.fqiandingdate!=''";

        String hqlYear = "select year from "
                + "((select distinct(year(jyXm.fkbdate)) as year from JyXm jyXm where jyXm.fkbdate!='') "
                + "union all "
                + "(select distinct(year(ht.fqiandingdate)) as year from CommHt ht where ht.fqiandingdate!=''))"
                + "order by year desc";


        List<Integer> yl1 = jyXmManager.find(hqlYearJyxm);
        List<Integer> yl2 = jyXmManager.find(hqlYearHt);

        yl1.removeAll(yl2);
        yl1.addAll(yl2);

        Collections.sort(yl1, new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o2 - o1;
            }
        });

        if (yl1.isEmpty()) {
            Calendar cal = Calendar.getInstance();
            yl1.add(cal.get(Calendar.YEAR));
        }

        model.addAttribute("yearList", yl1);

        return "sckf/sckf-home";
    }


    @RequestMapping("sckf-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
        long deptId = ConstValue.DEPT_ID_JY;
        hrGwbmManager.find(deptId, model);
        model.addAttribute("model", model);
        return "sckf/sckf-bmze-info";
    }

    @ResponseBody
    @RequestMapping("sckf-tbqk-data")
    public Object getDataTbqk(@RequestParam int year) {

//        int[] bid = {83, 78, 98, 93, 106, 84, 105, 104, 91, 83, 106, 92};
//        int[] win = {48, 38, 39, 41, 47, 48, 59, 59, 52, 65, 59, 51};
//        int[] amount = {32, 41, 64, 22, 14, 51, 85, 48, 34, 72, 65, 58};

        System.out.println("查询投标情况：" + year);

        int[] bid = new int[12];
        int[] win = new int[12];
        int[] amount = new int[12];
        Arrays.fill(bid, 0);
        Arrays.fill(win, 0);
        Arrays.fill(amount, 0);

        String hql = "select jyXm from JyXm  jyXm where jyXm.ftoubiaostatus=1 and jyXm.fkbdate>=? and jyXm.fkbdate<?";

        List<JyXm> list = jyXmManager.find(hql, DateUtil.getYearFirst(year), DateUtil.getYearFirst(year + 1));

        Calendar cal = Calendar.getInstance();
        for (JyXm j : list) {
            cal.setTime(j.getFkbdate());
            int month = cal.get(Calendar.MONTH);
            bid[month]++;
            if ("是".equals(j.getFzbstatus())) {
                win[month]++;
                if (j.getFzbmoney() != null) {
                    amount[month] += j.getFzbmoney();
                }
            }
        }

        int[][] data = {bid, win, amount};

        return data;
    }

    @ResponseBody
    @RequestMapping("sckf-htgl-data")
    public Object getDataHtgl(@RequestParam int year) {

        // 顺序格式：{已签订，谈判中，已起草，未起草}
        double[] count = {4, 1, 3, 5};
        double[] amount = {36, 6, 14, 8};

        System.out.println("查询投标情况：" + year);

        Arrays.fill(count, 0);
        Arrays.fill(amount, 0);

        String hql = "select fqiandingstatus as stat, count(fjianlifei) as cnt, sum(fjianlifei) as amt"
                + " from CommHt ht"
                + " where ht.fqiandingdate>=? and ht.fqiandingdate<?"
                + " group by ht.fqiandingstatus";

        List<Object[]> list = commHtManager.find(hql, DateUtil.getYearFirst(year), DateUtil.getYearFirst(year + 1));

        for (int i = 0; i < list.size(); i++) {
            int type = Integer.parseInt((String) list.get(i)[0]);
            long t_cnt = (long) list.get(i)[1];
            double t_amt = (double) list.get(i)[2];
            switch (type) {
                case 0:
                    // 未起草
                    count[3] += t_cnt;
                    amount[3] += t_amt;
                    break;
                case 1:
                    // 已起草
                    count[2] += t_cnt;
                    amount[2] += t_amt;
                    break;
                case 2:
                    // 谈判中
                    count[1] += t_cnt;
                    amount[1] += t_amt;
                    break;
                case 3:
                case 4:
                case 5:
                    // 已签订
                    count[0] += t_cnt;
                    amount[0] += t_amt;
                    break;
                default:
                    break;
            }
        }

        double[][] data = {count, amount};

        return data;
    }

    @ResponseBody
    @RequestMapping("sckf-fbqk-data")
    public Object getDataFbqk(@RequestParam int year) {

//        List<List> data = new ArrayList<>();

        String sql = "(select (case xm.fzbstatus when '是' then '中标' else '在投' end) as nm, count(case xm.fzbstatus when '是' then '中标' else '在投' end) as cnt " +
                "from t_jy_xm xm " +
                "where YEAR(xm.fkbdate)=" + year + " " +
                "group by case xm.fzbstatus when '是' then '中标' else '在投' end) " +
                "union " +
                "(select '废标', count(*) as cnt from t_jy_fbxm1 fb " +
                "where YEAR(fb.Kaibiao_data)=" + year + ") " +
                "order by nm";

        List data = jyXmManager.getSessionFactory().getCurrentSession().createSQLQuery(sql).list();

        /*hql = "select '废标', count(fb) as cnt " +
                "from JyXmFb fb " +
                "where YEAR(fb.kaibiaoData)='" + year + "'";
        List fb = jyXmFbManager.find(hql);

        data.add(zb);
        data.add(fb);*/

        return data;
    }

    public static void main(String args[]) {

        Calendar cal = Calendar.getInstance();
        int i = (cal.get(Calendar.YEAR));

        System.out.println(i);
    }
}
