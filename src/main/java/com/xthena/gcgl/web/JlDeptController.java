package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.jl.domain.JlDept;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gcgl")
public class JlDeptController {
    private JlDeptManager jlDeptManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjRyManager pjRyManager;


    @Autowired
    private PjXmManager pjXmManager;

    @RequestMapping("jlDept-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {

        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);

        if (!propertyFilters.isEmpty()) {
            List<PjXm> pjXms = pjXmManager.find(propertyFilters);
            List<Long> pjids = new ArrayList<Long>();
            for (PjXm pjXm : pjXms) {
                pjids.add(pjXm.getFid());
            }
            if (!pjids.isEmpty()) {
                Criterion criterion = Restrictions.in("fxmid", pjids);
                page = jlDeptManager.pagedQuery(page.getPageNo(), page.getPageSize(), criterion);
            }
        } else {
            page = jlDeptManager.pagedQuery(page.getPageNo(), page.getPageSize());
        }

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "gcgl/jlDept-info-list";
    }

    @RequestMapping("jlDept-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "fxmid", required = false) Long fxmid,
                        Model model, @ModelAttribute Page page) {

        if (id != null) {
            JlDept jlDept = jlDeptManager.get(id);
            model.addAttribute("model", jlDept);
            fxmid = jlDept.getFxmid();
        }

        if (id == null && fxmid != null) {
            JlDept jlDept = jlDeptManager.findUniqueBy("fxmid", fxmid);
            if (jlDept == null) {
                jlDept = new JlDept();
                jlDept.setFxmid(fxmid);
            }
            model.addAttribute("model", jlDept);
        }

        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("filter_EQL_fxmid", fxmid);

        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/jlDept-info-input";
    }

    @RequestMapping("jlDept-info-save")
    public String save(@ModelAttribute JlDept jlDept,
                       RedirectAttributes redirectAttributes) {

        jlDeptManager.saveUser(jlDept);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/jlDept-info-list.do";
    }

    @RequestMapping("jlDept-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<JlDept> jlDepts = jlDeptManager.findByIds(selectedItem);

        jlDeptManager.removeAll(jlDepts);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/jlDept-info-list.do";
    }

    @RequestMapping("jlDept-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlDeptManager.pagedQuery(page, propertyFilters);

        List<JlDept> jlDepts = (List<JlDept>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlDept info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlDepts);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlDeptManager(JlDeptManager jlDeptManager) {
        this.jlDeptManager = jlDeptManager;
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
