package com.xthena.xz.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.util.ConstValue;
import com.xthena.xz.manager.CommpanyManager;
import com.xthena.xz.manager.XzXhptjManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("xz")
public class XzglHomeController {

    @Autowired
    private HrGwbmManager hrGwbmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommpanyManager commpanyManager;

    @Autowired
    private XzXhptjManager xzxhptjManager;

    @RequestMapping("xz-home")
    public String home(Model model) {
        return "xz/xz-home";
    }

    @RequestMapping("xz-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
        long deptId = ConstValue.DEPT_ID_XZ;
        hrGwbmManager.find(deptId, model);
        model.addAttribute("model", model);
        return "xz/xz-bmze-info";
    }

    @ResponseBody
    @RequestMapping("xz-gsfb-data")
    public Object getDataGsfb() {

        String hql = "select com.faddress, com.fname" +
                " from Commpany com";
        List list = commpanyManager.find(hql);
        return list;

    }

    @ResponseBody
    @RequestMapping("xz-gdzc-data")
    public Object getDataGdzc() {

        String hql = "select wz.fname, count(wz.fname) as cnt" +
                " from WzList wz" +
                " where wz.ftype=1" +
                " group by wz.fname" +
                " order by cnt desc";
        List list = commpanyManager.find(hql);
        return list;

    }

    @ResponseBody
    @RequestMapping("xz-zzxh-data")
    public Object getDataZzxh(@RequestParam int year) {

//        String hql = "select pt.fyuefen, pt.cnt1, bw.cnt2 from " +
//                "(select xh.fyuefen, sum(xh.fxhsl) as cnt1 " +
//                "from XzXhptj xh " +
//                "where xh.fwpname like 'A4%普通%' and xh.fyuefen like '" + year + ".__'" +
//                "group by xh.fyuefen, xh.fwpname) pt " +
//                "full join " +
//                "(select xh.fyuefen, sum(xh.fxhsl) as cnt2 " +
//                "from XzXhptj xh " +
//                "where xh.fwpname like 'A4%百旺%' and xh.fyuefen like '" + year + ".__'" +
//                "group by xh.fyuefen, xh.fwpname) bw " +
//                "with pt.fyuefen = bw.fyuefen";

        String hql1 = "select substring(xh.fyuefen, 6, 2), sum(xh.fxhsl) " +
                "from XzXhptj xh " +
                "where xh.fwpname like 'A4%普通%' and xh.fyuefen like '" + year + ".__'" +
                "group by xh.fyuefen";

        String hql2 = "select substring(xh.fyuefen, 6, 2), sum(xh.fxhsl) " +
                "from XzXhptj xh " +
                "where xh.fwpname like 'A4%百旺%' and xh.fyuefen like '" + year + ".__'" +
                "group by xh.fyuefen";

        List list1 = xzxhptjManager.find(hql1);
        List list2 = xzxhptjManager.find(hql2);
        List list = new ArrayList();
        list.add(list1);
        list.add(list2);
        return list;

    }
}
