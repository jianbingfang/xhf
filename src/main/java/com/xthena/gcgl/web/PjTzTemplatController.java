package  com.xthena.gcgl.web;

import java.util.ArrayList;
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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.gcgl.domain.PjTzTemplat;
import com.xthena.gcgl.manager.PjTzTemplatManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjTzTemplatController {
    private PjTzTemplatManager pjTzTemplatManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjTzTemplat-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjTzTemplatManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjTzTemplat-info-list";
    }

    @RequestMapping("pjTzTemplat-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjTzTemplat pjTzTemplat = pjTzTemplatManager.get(id);
            model.addAttribute("model", pjTzTemplat);
        }

        return "gcgl/pjTzTemplat-info-input";
    }

    @RequestMapping("pjTzTemplat-info-save")
    public String save(@ModelAttribute PjTzTemplat pjTzTemplat,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjTzTemplat dest = null;

        Long id = pjTzTemplat.getFid();

        if (id != null) {
            dest = pjTzTemplatManager.get(id);
            beanMapper.copy(pjTzTemplat, dest);
        } else {
            dest = pjTzTemplat;
        }

        pjTzTemplatManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjTzTemplat-info-list.do";
    }

    @RequestMapping("pjTzTemplat-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjTzTemplat> pjTzTemplats = pjTzTemplatManager.findByIds(selectedItem);

        pjTzTemplatManager.removeAll(pjTzTemplats);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjTzTemplat-info-list.do";
    }

    @RequestMapping("pjTzTemplat-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjTzTemplatManager.pagedQuery(page, propertyFilters);

        List<PjTzTemplat> pjTzTemplats = (List<PjTzTemplat>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjTzTemplat info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjTzTemplats);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjTzTemplatManager(PjTzTemplatManager pjTzTemplatManager) {
        this.pjTzTemplatManager = pjTzTemplatManager;
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
