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

import com.xthena.gcgl.domain.PjTemplate;
import com.xthena.gcgl.manager.PjTemplateManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjTemplateController {
    private PjTemplateManager pjTemplateManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjTemplate-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjTemplateManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjTemplate-info-list";
    }

    @RequestMapping("pjTemplate-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjTemplate pjTemplate = pjTemplateManager.get(id);
            model.addAttribute("model", pjTemplate);
        }

        return "gcgl/pjTemplate-info-input";
    }

    @RequestMapping("pjTemplate-info-save")
    public String save(@ModelAttribute PjTemplate pjTemplate,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjTemplate dest = null;

        Long id = pjTemplate.getFid();

        if (id != null) {
            dest = pjTemplateManager.get(id);
            beanMapper.copy(pjTemplate, dest);
        } else {
            dest = pjTemplate;
        }

        pjTemplateManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjTemplate-info-list.do";
    }

    @RequestMapping("pjTemplate-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjTemplate> pjTemplates = pjTemplateManager.findByIds(selectedItem);

        pjTemplateManager.removeAll(pjTemplates);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjTemplate-info-list.do";
    }

    @RequestMapping("pjTemplate-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjTemplateManager.pagedQuery(page, propertyFilters);

        List<PjTemplate> pjTemplates = (List<PjTemplate>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjTemplate info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjTemplates);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjTemplateManager(PjTemplateManager pjTemplateManager) {
        this.pjTemplateManager = pjTemplateManager;
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
