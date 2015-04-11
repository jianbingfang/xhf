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

import com.xthena.gcgl.domain.PjCheckdinfe;
import com.xthena.gcgl.manager.PjCheckdinfeManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjCheckdinfeController {
    private PjCheckdinfeManager pjCheckdinfeManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjCheckdinfe-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjCheckdinfeManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjCheckdinfe-info-list";
    }

    @RequestMapping("pjCheckdinfe-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjCheckdinfe pjCheckdinfe = pjCheckdinfeManager.get(id);
            model.addAttribute("model", pjCheckdinfe);
        }

        return "gcgl/pjCheckdinfe-info-input";
    }

    @RequestMapping("pjCheckdinfe-info-save")
    public String save(@ModelAttribute PjCheckdinfe pjCheckdinfe,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjCheckdinfe dest = null;

        Long id = pjCheckdinfe.getFid();

        if (id != null) {
            dest = pjCheckdinfeManager.get(id);
            beanMapper.copy(pjCheckdinfe, dest);
        } else {
            dest = pjCheckdinfe;
        }

        pjCheckdinfeManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjCheckdinfe-info-list.do";
    }

    @RequestMapping("pjCheckdinfe-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjCheckdinfe> pjCheckdinfes = pjCheckdinfeManager.findByIds(selectedItem);

        pjCheckdinfeManager.removeAll(pjCheckdinfes);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjCheckdinfe-info-list.do";
    }

    @RequestMapping("pjCheckdinfe-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjCheckdinfeManager.pagedQuery(page, propertyFilters);

        List<PjCheckdinfe> pjCheckdinfes = (List<PjCheckdinfe>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjCheckdinfe info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjCheckdinfes);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjCheckdinfeManager(PjCheckdinfeManager pjCheckdinfeManager) {
        this.pjCheckdinfeManager = pjCheckdinfeManager;
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
