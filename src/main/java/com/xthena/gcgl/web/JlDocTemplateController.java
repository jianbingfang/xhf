package  com.xthena.gcgl.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.jl.domain.JlDocTemplate;
import com.xthena.jl.manager.JlDocTemplateManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class JlDocTemplateController {
    private JlDocTemplateManager jlDocTemplateManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlDocTemplate-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlDocTemplateManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/jlDocTemplate-info-list";
    }

    @RequestMapping("jlDocTemplate-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
            Model model) {
        if (id != null) {
            JlDocTemplate jlDocTemplate = jlDocTemplateManager.get(id);
            model.addAttribute("model", jlDocTemplate);
        }
        model.addAttribute("ftype", ftype);
        return "gcgl/jlDocTemplate-info-input";
    }

    @RequestMapping("jlDocTemplate-info-save")
    public String save(@ModelAttribute JlDocTemplate jlDocTemplate,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlDocTemplate dest = null;

        Long id = jlDocTemplate.getFid();

        if (id != null) {
            dest = jlDocTemplateManager.get(id);
            beanMapper.copy(jlDocTemplate, dest);
        } else {
            dest = jlDocTemplate;
        }

        jlDocTemplateManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/jlDocTemplate-info-list.do";
    }

    @RequestMapping("jlDocTemplate-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlDocTemplate> jlDocTemplates = jlDocTemplateManager.findByIds(selectedItem);

        jlDocTemplateManager.removeAll(jlDocTemplates);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/jlDocTemplate-info-list.do";
    }

    @RequestMapping("jlDocTemplate-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlDocTemplateManager.pagedQuery(page, propertyFilters);

        List<JlDocTemplate> jlDocTemplates = (List<JlDocTemplate>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlDocTemplate info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlDocTemplates);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlDocTemplateManager(JlDocTemplateManager jlDocTemplateManager) {
        this.jlDocTemplateManager = jlDocTemplateManager;
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
