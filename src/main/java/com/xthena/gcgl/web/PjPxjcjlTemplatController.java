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
import com.xthena.gcgl.domain.PjPxjcjlTemplat;
import com.xthena.gcgl.manager.PjPxjcjlTemplatManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjPxjcjlTemplatController {
    private PjPxjcjlTemplatManager pjPxjcjlTemplatManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjPxjcjlTemplat-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjPxjcjlTemplatManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjPxjcjlTemplat-info-list";
    }

    @RequestMapping("pjPxjcjlTemplat-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjPxjcjlTemplat pjPxjcjlTemplat = pjPxjcjlTemplatManager.get(id);
            model.addAttribute("model", pjPxjcjlTemplat);
        }

        return "gcgl/pjPxjcjlTemplat-info-input";
    }

    @RequestMapping("pjPxjcjlTemplat-info-save")
    public String save(@ModelAttribute PjPxjcjlTemplat pjPxjcjlTemplat,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjPxjcjlTemplat dest = null;

        Long id = pjPxjcjlTemplat.getFid();

        if (id != null) {
            dest = pjPxjcjlTemplatManager.get(id);
            beanMapper.copy(pjPxjcjlTemplat, dest);
        } else {
            dest = pjPxjcjlTemplat;
        }

        pjPxjcjlTemplatManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjPxjcjlTemplat-info-list.do";
    }

    @RequestMapping("pjPxjcjlTemplat-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjPxjcjlTemplat> pjPxjcjlTemplats = pjPxjcjlTemplatManager.findByIds(selectedItem);

        pjPxjcjlTemplatManager.removeAll(pjPxjcjlTemplats);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjPxjcjlTemplat-info-list.do";
    }

    @RequestMapping("pjPxjcjlTemplat-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjPxjcjlTemplatManager.pagedQuery(page, propertyFilters);

        List<PjPxjcjlTemplat> pjPxjcjlTemplats = (List<PjPxjcjlTemplat>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjPxjcjlTemplat info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjPxjcjlTemplats);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjPxjcjlTemplatManager(PjPxjcjlTemplatManager pjPxjcjlTemplatManager) {
        this.pjPxjcjlTemplatManager = pjPxjcjlTemplatManager;
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
