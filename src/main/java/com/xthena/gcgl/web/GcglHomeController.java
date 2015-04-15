package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.gcgl.manager.PjkhManager;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.ConstValue;
import com.xthena.util.DateUtil;
import com.xthena.util.SessionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gcgl")
public class GcglHomeController {

    private static Logger logger = LoggerFactory
            .getLogger(GcglHomeController.class);

    @Autowired
    private HrGwbmManager hrGwbmManager;

    @Autowired
    private PjkhManager pjkhManager;

    @Autowired
    private PjXmManager pjXmManager;

    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommHtManager commHtManager;

    @RequestMapping("gcgl-home")
    public String home(Model model) {
        int onlineProject = 10;
        int newProject = 10;
        int endProject = 10;

        String hql = "";

        List res = pjXmManager.find(hql);

        model.addAttribute("onlineProject", onlineProject);
        model.addAttribute("newProject", newProject);
        model.addAttribute("endProject", endProject);
        return "gcgl/gcgl-home";
    }


    @RequestMapping("gcgl-bmze-info")
    public String list(@RequestParam Map<String, Object> parameterMap, Model model) {
        long deptId = ConstValue.DEPT_ID_GCGL;
        hrGwbmManager.find(deptId, model);
        model.addAttribute("model", model);
        return "gcgl/gcgl-bmze-info";
    }

    //项目管理和技术这次
    @RequestMapping("xmsj-info-input")
    public String xmSjInput(Model model) {
        return "gcgl/xmsj-info-input";
    }

    //项目撤点
    @RequestMapping("xmcd-info-input")
    public String xmcdInput(Model model) {
        return "gcgl/xmcd-info-input";
    }

    //项目内业
    @RequestMapping("xmny-info-input")
    public String xmnyInput(Model model) {
        return "gcgl/xmny-info-input";
    }
    
 /*   //合同
    @RequestMapping("gcgl-commHt-info-input")
    public String commHtInput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        CommHt commHt = commHtManager.get(id);
        model.addAttribute("model", commHt);
        return "gcgl/commHt-info-input";
    }*/

    //合同
    @RequestMapping("jl-home")
    public String goJlHome(@RequestParam(value = "id", required = false) Long id,
                           Model model) {
        SessionUtil.setXmId(userConnector);
        return "redirect:/jl/jl-home.do";
    }


    @ResponseBody
    @RequestMapping("gcgl-project-type-data")
    public Object getDataProjectType() {

        logger.info("gcgl-project-type-data");

        String hql = "select xm.fxmstatus, count(*) as cnt" +
                " from PjXm xm" +
                " group by xm.fxmstatus";
        List list = pjXmManager.find(hql);

        return list;
    }

    @ResponseBody
    @RequestMapping("gcgl-project-onbuilding-data")
    public Object getDataProjectOnbuilding(@RequestParam int year) {

        logger.info("gcgl-project-onbuilding-data: " + year);

        String hql = "select xm.fxmtype, count(*) as cnt" +
                " from PjXm xm" +
                " where xm.fxmstatus='在建'" +
                " group by xm.fxmtype" +
                " order by cnt desc";
        List list = pjXmManager.find(hql);

        return list;
    }

    @ResponseBody
    @RequestMapping("gcgl-jxkh-data")
    public Object getDataJxkh(@RequestParam int year) {

        logger.info("gcgl-jxkh-data: " + year);

        String hql = "select" +
                "  sum(case when kh.fkhscore >= 90 then 1 else 0 end) as a" +
                " ,sum(case when kh.fkhscore < 90 then 1 else 0 end) as b" +
                " ,sum(case when kh.fkhscore < 75 then 1 else 0 end) as c" +
                " ,sum(case when kh.fkhscore = '' then 1 else 0 end) as d" +
                " from Pjkh kh where kh.fkhdate >= ? and kh.fkhdate < ?";

        List list = pjkhManager.find(hql, DateUtil.getYearFirst(year), DateUtil.getYearFirst(year + 1));

        Object[] res = (Object[]) list.get(0);

        if (res[0] == null) {
            return null;
        } else {
            long[] data = new long[res.length];
            for (int i = 0; i < res.length; i++) {
                data[i] = (long) res[i];
            }
            return data;
        }

    }
}
