package com.xthena.cw.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.cw.manager.CwYingShouManager;
import com.xthena.ext.export.Exportor;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.util.ConstValue;
import com.xthena.util.DateUtil;
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
@RequestMapping("cw")
public class CwHomeController {

    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private HrGwbmManager hrGwbmManager;

    @Autowired
    private CwYingShouManager cwYingShouManager;

    @RequestMapping("cw-home")
    public String home(Model model) {
        int[] yl = {2015, 2014, 2013, 2012, 2011};
        model.addAttribute("yearList", yl);
        model.addAttribute("locale", "zh_CN");
        return "cw/cw-home";
    }

    @RequestMapping("cw-report")
    public String reportHome(Model model) {
        return "cw/cw-report";
    }

    @RequestMapping("cw-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
        long deptId = ConstValue.DEPT_ID_CW;
        hrGwbmManager.find(deptId, model);
        model.addAttribute("model", model);
        return "cw/cw-bmze-info";
    }

    @ResponseBody
    @RequestMapping("cw-jlf-data")
    public Object getDataJlf(@RequestParam int year) {

        String hql = "select MONTH(ys.fdzdate), sum(ys.fdebit), sum(ys.fcreditor)" +
                " from CwYingShou ys" +
                " where ys.fdzdate >= ? and ys.fdzdate < ?" +
                " group by MONTH(ys.fdzdate)" +
                " order by MONTH(ys.fdzdate)";

        List list = cwYingShouManager.find(hql, DateUtil.getYearFirst(year), DateUtil.getYearFirst(year + 1));

        return list;
    }

    @ResponseBody
    @RequestMapping("cw-tbbzj-data")
    public Object getDataTbbzj(@RequestParam int year, @RequestParam int month) {
        List<Long> ids = new ArrayList<>();
        for (long i = 4; i < 11; i++) {
            ids.add(i);
        }
        int[] data = {97};
        return data;
    }

    @ResponseBody
    @RequestMapping("cw-lybzj-data")
    public Object getDataLybzj(@RequestParam int year, @RequestParam int month) {
        List<Long> ids = new ArrayList<>();
        for (long i = 4; i < 11; i++) {
            ids.add(i);
        }
        int[] data = {97};
        return data;
    }
}
