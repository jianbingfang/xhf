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

import com.xthena.gcgl.domain.PjFiles;
import com.xthena.gcgl.manager.PjFilesManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjFilesController {
    private PjFilesManager pjFilesManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjFiles-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjFilesManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjFiles-info-list";
    }

    @RequestMapping("pjFiles-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjFiles pjFiles = pjFilesManager.get(id);
            model.addAttribute("model", pjFiles);
        }

        return "gcgl/pjFiles-info-input";
    }

    @RequestMapping("pjFiles-info-save")
    public String save(@ModelAttribute PjFiles pjFiles,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjFiles dest = null;

        Long id = pjFiles.getFid();

        if (id != null) {
            dest = pjFilesManager.get(id);
            beanMapper.copy(pjFiles, dest);
        } else {
            dest = pjFiles;
        }

        pjFilesManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjFiles-info-list.do";
    }

    @RequestMapping("pjFiles-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjFiles> pjFiless = pjFilesManager.findByIds(selectedItem);

        pjFilesManager.removeAll(pjFiless);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjFiles-info-list.do";
    }

    @RequestMapping("pjFiles-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjFilesManager.pagedQuery(page, propertyFilters);

        List<PjFiles> pjFiless = (List<PjFiles>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjFiles info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjFiless);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjFilesManager(PjFilesManager pjFilesManager) {
        this.pjFilesManager = pjFilesManager;
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
