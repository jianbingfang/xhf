package com.xthena.hr.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrRyZjManager;
import com.xthena.util.ConstValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("hr")
public class HrHomeController {

    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private HrGwbmManager hrGwbmManager;

    @Autowired
    private CommRyManager commRyManager;

    @Autowired
    private HrRyZjManager hrRyZjManager;

    @RequestMapping("hr-home")
    public String home(Model model) {
        return "hr/hr-home";
    }

    @RequestMapping("hr-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
        long deptId = ConstValue.DEPT_ID_HR;
        hrGwbmManager.find(deptId, model);
        model.addAttribute("model", model);
        return "hr/hr-bmze-info";
    }

    @RequestMapping("ldjl-input")
    public String ldjlinput() {
        return "hr/ldjl-input";
    }

    @RequestMapping("xzjiegou-input")
    public String xzjiegouinput() {
        return "hr/xzjiegou-input";
    }

    @RequestMapping("hrrstj-list")
    public String hrrstjlist(@RequestParam Map<String, Object> parameterMap, Model model) throws ParseException {

        HashMap<String, HashMap<String, Integer>> resultMap = new HashMap<String, HashMap<String, Integer>>();

        String hql = "select count(*) ,date_format(commRy.frzdate,'%Y-%m')  from CommRy commRy " +
                " group by date_format(commRy.frzdate,'%Y-%m')  ";

        List rzlist = commRyManager.find(hql);


        HashMap<String, Integer> rzMap = new HashMap<String, Integer>();
        for (Object obj : rzlist) {
            Object[] rz = (Object[]) obj;
            rzMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }

        hql = "select count(*) ,date_format(commRy.flzdate,'%Y-%m')  from CommRy commRy " +
                " group by date_format(commRy.flzdate,'%Y-%m')  ";

        List lzlist = commRyManager.find(hql);

        HashMap<String, Integer> lzMap = new HashMap<String, Integer>();
        for (Object obj : lzlist) {
            Object[] lz = (Object[]) obj;
            lzMap.put(String.valueOf(lz[1]), Integer.parseInt(String.valueOf(lz[0])));
        }

        Calendar cEnd = Calendar.getInstance();


        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
        if (parameterMap.get("end_date") != null && !parameterMap.get("end_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("end_date")));
            cEnd.setTime(date);
        }


        Calendar cstart = Calendar.getInstance();
        cstart.add(Calendar.YEAR, -1);

        if (parameterMap.get("start_date") != null && !parameterMap.get("start_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("start_date")));
            cstart.setTime(date);
        }

        List<String> yearMonthList = new ArrayList<String>();
        yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));

        while (cEnd.compareTo(cstart) > 0) {
            cEnd.add(Calendar.MONTH, -1);
            yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));
        }

        model.addAttribute("rzMap", rzMap);
        model.addAttribute("lzMap", lzMap);
        model.addAttribute("yearMonthList", yearMonthList);

        return "hr/hrrstj-list";
    }


    @RequestMapping("hrhtbxtj-list")
    public String htbxtjlist(@RequestParam Map<String, Object> parameterMap, Model model) throws ParseException {

        HashMap<String, HashMap<String, Integer>> resultMap = new HashMap<String, HashMap<String, Integer>>();

        String hql = " select count(*),date_format(hrShtc.fcreatedate,'%Y-%m'),ftype  from HrShtc hrShtc " +
                " group by date_format(hrShtc.fcreatedate,'%Y-%m'),ftype ";

        List tclist = commRyManager.find(hql);

        HashMap<String, Integer> newMap = new HashMap<String, Integer>();
        HashMap<String, Integer> zhuanruMap = new HashMap<String, Integer>();
        for (Object obj : tclist) {
            HashMap<String, Integer> tcMap = new HashMap<String, Integer>();
            Object[] rz = (Object[]) obj;
            if (String.valueOf(rz[2]).equals("新增")) {
                newMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
            } else {
                zhuanruMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
            }
        }

        hql = "select count(*),date_format(hrLdht.fcreatedate,'%Y-%m')  from HrLdht hrLdht " +
                " group by date_format(hrLdht.fcreatedate,'%Y-%m') ";
        List ldht = commRyManager.find(hql);
        HashMap<String, Integer> ldhtMap = new HashMap<String, Integer>();
        for (Object obj : ldht) {
            Object[] rz = (Object[]) obj;
            ldhtMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }


        hql = "select count(*),date_format(hrShtc.flastdate,'%Y-%m')  from HrShtc hrShtc " +
                " group by date_format(hrShtc.flastdate,'%Y-%m') ";
        List banting = commRyManager.find(hql);
        HashMap<String, Integer> bantingMap = new HashMap<String, Integer>();
        for (Object obj : banting) {
            Object[] rz = (Object[]) obj;
            bantingMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }


        hql = "select count(*),date_format(hrShtc.flastdateyw,'%Y-%m') from HrShtc hrShtc where not exists(select 1 from " +
                " HrYwxTihuan hrYwxTihuan where hrShtc.fryid=hrYwxTihuan.fryid)" +
                " group by date_format(hrShtc.flastdateyw,'%Y-%m') ";

        List ywbant = commRyManager.find(hql);
        HashMap<String, Integer> ywbantMap = new HashMap<String, Integer>();
        for (Object obj : banting) {
            Object[] rz = (Object[]) obj;
            ywbantMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }

        hql = "select count(*),date_format(hrShtc.fstartdateyw,'%Y-%m') from HrShtc hrShtc where not exists(select 1 from " +
                " HrYwxTihuan hrYwxTihuan where hrShtc.fryid=hrYwxTihuan.fnewryid)" +
                " group by date_format(hrShtc.fstartdateyw,'%Y-%m')  ";

        List ywnew = commRyManager.find(hql);
        HashMap<String, Integer> ywnewMap = new HashMap<String, Integer>();
        for (Object obj : banting) {
            Object[] rz = (Object[]) obj;
            ywnewMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }

        hql = "select count(*),date_format(hrYwxTihuan.frdate,'%Y-%m') from HrYwxTihuan hrYwxTihuan " +
                " group by date_format(hrYwxTihuan.frdate,'%Y-%m')  ";

        List ywtihuan = commRyManager.find(hql);
        HashMap<String, Integer> tihuanMap = new HashMap<String, Integer>();
        for (Object obj : banting) {
            Object[] rz = (Object[]) obj;
            tihuanMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }

        Calendar cEnd = Calendar.getInstance();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
        if (parameterMap.get("end_date") != null && !parameterMap.get("end_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("end_date")));
            cEnd.setTime(date);
        }


        Calendar cstart = Calendar.getInstance();
        cstart.add(Calendar.YEAR, -1);

        if (parameterMap.get("start_date") != null && !parameterMap.get("start_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("start_date")));
            cstart.setTime(date);
        }

        List<String> yearMonthList = new ArrayList<String>();
        yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));

        while (cEnd.compareTo(cstart) > 0) {
            cEnd.add(Calendar.MONTH, -1);
            yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));
        }
        model.addAttribute("ywbantMap", ywbantMap);
        model.addAttribute("bantingMap", bantingMap);
        model.addAttribute("ywnewMap", ywnewMap);
        model.addAttribute("tihuanMap", tihuanMap);
        model.addAttribute("newMap", newMap);
        model.addAttribute("zhuanruMap", zhuanruMap);
        model.addAttribute("yearMonthList", yearMonthList);
        model.addAttribute("ldhtMap", ldhtMap);
        return "hr/hrhtbxtj-list";
    }

    @RequestMapping("hrpxtj-list")
    public String pxtjlist(@RequestParam Map<String, Object> parameterMap, Model model) throws ParseException {

        HashMap<String, HashMap<String, Integer>> resultMap = new HashMap<String, HashMap<String, Integer>>();

        String hql = "select count(*) ,date_format(hrPx.fdate,'%Y-%m')  from HrPx hrPx " +
                " group by date_format(hrPx.fdate,'%Y-%m')  ";

        List rzlist = commRyManager.find(hql);

        HashMap<String, Integer> rzMap = new HashMap<String, Integer>();
        for (Object obj : rzlist) {
            Object[] rz = (Object[]) obj;
            rzMap.put(String.valueOf(rz[1]), Integer.parseInt(String.valueOf(rz[0])));
        }


        Calendar cEnd = Calendar.getInstance();


        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
        if (parameterMap.get("end_date") != null && !parameterMap.get("end_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("end_date")));
            cEnd.setTime(date);
        }


        Calendar cstart = Calendar.getInstance();
        cstart.add(Calendar.YEAR, -1);

        if (parameterMap.get("start_date") != null && !parameterMap.get("start_date").equals("")) {
            Date date = simpleDateFormat.parse(String.valueOf(parameterMap.get("start_date")));
            cstart.setTime(date);
        }

        List<String> yearMonthList = new ArrayList<String>();
        yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));

        while (cEnd.compareTo(cstart) > 0) {
            cEnd.add(Calendar.MONTH, -1);
            yearMonthList.add(simpleDateFormat.format(cEnd.getTime()));
        }

        model.addAttribute("rzMap", rzMap);
        model.addAttribute("yearMonthList", yearMonthList);

        return "hr/hrpxtj-list";
    }

    @ResponseBody
    @RequestMapping("hr-czqk-data")
    public Object getDataCzqk() {

        List<List<Object>> res = new ArrayList<>();

        String sql = "select count(*) from " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '监理工程师注册%' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '一级建造师%' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname = '造价师注册证' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '设计师%'";
        List<Object> list = hrRyZjManager.getSession().createSQLQuery(sql).list();
        res.add(list);

        sql = "select count(*) from " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '专业监理工程师%' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '监理员%' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '见证员%' " +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '安全员%'" +
                "union " +
                "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t " +
                "where t.fname like '资料员%'";
        list = hrRyZjManager.getSession().createSQLQuery(sql).list();

        for (Object i : list) {
            List tl = new LinkedList();
            tl.add(i);
            res.add(tl);
        }

        sql = "select count(*) from  " +
                "(select zj.userid, zj.fname " +
                "from t_hr_ry_zj zj " +
                "group by zj.userid, zj.fname) t ";
        list = hrRyZjManager.getSession().createSQLQuery(sql).list();
        res.add(list);

        return res;
    }

    @ResponseBody
    @RequestMapping("hr-zcqk-data")
    public Object getDataZcqk() {

        String hql = "select " +
                "case zj.fname " +
                "when '初级工程师职称证' then '初级工程师' " +
                "when '中级工程师职称证' then '中级工程师' " +
                "when '高级工程师职称证' then '高级工程师' " +
                "end " +
                ", count(zj.fname) as cnt " +
                "from HrRyZj zj " +
                "where zj.fname in ('初级工程师职称证', '中级工程师职称证',  '高级工程师职称证') " +
                "group by zj.fname " +
                "order by cnt desc";

        List list = hrRyZjManager.find(hql);

        return list;
    }

    @ResponseBody
    @RequestMapping("hr-rybd-data")
    public Object getDataRybd(@RequestParam int year) {

        String sql = "select count(*) " +
                "from v_commry_order_name v left join t_hr_lz lz on v.fid = lz.fry " +
                "where YEAR(v.frzdate) < '" + year + "' and (v.fgyxz != '4' or YEAR(lz.fstartdate) = '" + year + "')";

        String lzHql = "select MONTH(lz.fstartdate) as m, count(v.fid) " +
                "from CommRy v, HrLz lz " +
                "where v.fgyxz='4' and v.fid = lz.fry and YEAR(lz.fstartdate)='" + year + "' " +
                "group by MONTH(lz.fstartdate) " +
                "order by m";

        String rzHql = "select MONTH(v.frzdate) as m, count(*) " +
                "from CommRy v " +
                "where YEAR(v.frzdate) = '" + year + "' " +
                "group by MONTH(v.frzdate) " +
                "order by m";

//        int zzNum = commRyManager.getCount(zzHql);

        List zzNum = commRyManager.getSession().createSQLQuery(sql).list();

        List lzList = commRyManager.find(lzHql);
        List rzList = commRyManager.find(rzHql);

        Map data = new HashMap();
        if (zzNum != null && !zzNum.isEmpty()) {
            data.put("num", zzNum.get(0));
        }

        data.put("lzList", lzList);
        data.put("rzList", rzList);

        return data;
    }
}
