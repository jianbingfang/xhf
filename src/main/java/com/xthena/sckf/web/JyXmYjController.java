package com.xthena.sckf.web;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.domain.JyXmYj;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.sckf.manager.JyXmYjManager;
import com.xthena.user.persistence.manager.UserBaseManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JyXmMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyXmYjController {
    private JyXmYjManager jyXmYjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JyXmManager jyXmManager;

    @Autowired
    private UserBaseManager userBaseManager;

    @PostConstruct
    public void intRmMap() {
        JyXmMapUtil.initRyMap(jyXmManager);
    }

    @RequestMapping("jyXmYj-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmYjManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXmYj-info-list";
    }


    @RequestMapping("jyXmYj-info-input")
    public String saveXmYj(@ModelAttribute JyXm jyXm, Model model, @RequestParam(value = "id", required = false) Long
            id, @RequestParam(value ="xmid", required = false) Long xmid, @RequestParam(value = "taskId", required = false) String taskId) {

        // 取得所有的需要展现的元素
//        String fxmid = request.getParameter("fxmid"); // 项目编号
//        String fname = request.getParameter("fname"); //项目名称
//        String fjsdw = request.getParameter("fjsdw");  // 业主单位
//        String fzj = request.getParameter("fzj"); //总监员工号
//        String ftze = request.getParameter("ftze"); // 投资额
//        String fscale = request.getParameter("fscale"); //规模
//        String fprovince = request.getParameter("fprovince"); //省地址
//        String fcity = request.getParameter("fcity"); // 城市地址
//        String fyijiaostatus = request.getParameter("fyijiaostatus");//项目移交状态

        if(taskId==null) {
            JyXmYj jyXmYj = null;
            JyXm dest = null; // 存储JyXm 对象

            if (id != null && xmid != null) { // 从点击编辑出返回
                jyXmYj = jyXmYjManager.get(id);
                dest = jyXmManager.get(xmid);
                model.addAttribute("xm", dest);   //添加项目信息；
                model.addAttribute("model", jyXmYj);
                model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
            } else {
                if (id != null) {   //移交项目存在
                    jyXmYj = jyXmYjManager.get(id);
                } else {   // 移交项目不存在
                    jyXmYj = new JyXmYj();
                }

                if (xmid != null) {   // 项目存在
                    dest = jyXmManager.get(xmid);
                    beanMapper.copy(jyXm, dest);
                } else {              //项目不存在
                    dest = jyXm;
                }
                //保存对象
                jyXmManager.save(dest);
                JyXmMapUtil.refreshRyMap(dest);
                model.addAttribute("xm", jyXm);   //添加项目信息；
                model.addAttribute("model", jyXmYj);
                model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
            }
            return "sckf/jyXmYj-info-input";
        }
        else
        {
            //同时发起流程
            JyXmYj jyXmYj = jyXmYjManager.loadJyXmyj(taskId);
            xmid= jyXmYj.getFxmid();
            jyXm=jyXmManager.get(xmid);
            model.addAttribute("model",jyXmYj);
            model.addAttribute("taskId",taskId);
            model.addAttribute("xm",jyXm);
            model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
            return "sckf/jyXmYj-info-input";   // 有待改动
        }

}

//    @RequestMapping("jyXmYj-info-input")
//    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "xmid", required = false) Long xmid,
//            Model model) {
//        if (id != null) {
//            JyXmYj jyXmYj = jyXmYjManager.get(id);
//            model.addAttribute("model", jyXmYj);
//        }
//        if(xmid!=null) {
//            model.addAttribute("xm", jyXmManager.get(xmid));
//        }
//        else{
//
//        }
//        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
//        return "sckf/jyXmYj-info-input";
//    }

    @RequestMapping("jyXmYj-info-save")
    public String save(@ModelAttribute JyXmYj jyXmYj,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        JyXmYj dest = null;
        Long id = jyXmYj.getFid();
        if (id != null) {
            dest = jyXmYjManager.get(id);
            beanMapper.copy(jyXmYj, dest);
        } else {
            dest = jyXmYj;
            //同时发起流程
//            dest.setFoprator(userBaseManager.findUniqueBy("ref", SpringSecurityUtils.getCurrentUserId()).getFryid());
//            dest.setFcreatedate(new Date());
//            jyXmYjManager.newXmyj(dest);

        }
        jyXmYjManager.saveForYj(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyXmYj-info-list.do";
    }

    @RequestMapping("jyXmYj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<JyXmYj> jyXmYjs = jyXmYjManager.findByIds(selectedItem);

        jyXmYjManager.removeAll(jyXmYjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyXmYj-info-list.do";
    }

    @RequestMapping("jyXmYj-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmYjManager.pagedQuery(page, propertyFilters);

        List<JyXmYj> jyXmYjs = (List<JyXmYj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyXmYj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyXmYjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyXmYjManager(JyXmYjManager jyXmYjManager) {
        this.jyXmYjManager = jyXmYjManager;
    }

    @Resource
    public void setExportor(Exportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
