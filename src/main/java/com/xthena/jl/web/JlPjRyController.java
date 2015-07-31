package com.xthena.jl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.manager.PjRyManager;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.jl.manager.JlDeptManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("jl")
public class JlPjRyController {
    private PjRyManager pjRyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommRyManager commRyManager;


    @Autowired
    private JlDeptManager jlDeptManager;


    @RequestMapping("jl-pjRy-info-list")
    public String list(@ModelAttribute Page page, HttpServletRequest request,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyManager.pagedQuery(page, propertyFilters);
        List<PjRy> pjRies = (List<PjRy>) page.getResult();
        for (PjRy pjRy : pjRies) {
            Long fryid = pjRy.getFryid();
            if (fryid != null) {
                pjRy.setFry(commRyManager.get(fryid).getFname());
            }
        }

        model.addAttribute("page", page);

        return "jl/pjRy-info-list";
    }

    @RequestMapping("jl-pjRy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            PjRy pjRy = pjRyManager.get(id);
            pjRy.setFry(commRyManager.get(pjRy.getFryid()).getFname());
            model.addAttribute("model", pjRy);
        }

        return "jl/pjRy-info-input";
    }

    @RequestMapping("jl-pjRy-info-save")
    public String save(@ModelAttribute PjRy pjRy, HttpServletRequest request,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        PjRy dest = null;

        Long id = pjRy.getFid();

        if (id != null) {
            dest = pjRyManager.get(id);
            beanMapper.copy(pjRy, dest);
        } else {
            dest = pjRy;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        pjRyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjRy-info-list.do";
    }

    @RequestMapping("jl-pjRy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<PjRy> pjRys = pjRyManager.findByIds(selectedItem);

        pjRyManager.removeAll(pjRys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjRy-info-list.do";
    }

    @RequestMapping("pjRy-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjRyManager.pagedQuery(page, propertyFilters);

        List<PjRy> pjRys = (List<PjRy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjRy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjRys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjRyManager(PjRyManager pjRyManager) {
        this.pjRyManager = pjRyManager;
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
