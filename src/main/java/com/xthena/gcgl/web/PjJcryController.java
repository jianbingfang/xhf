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

import com.xthena.gcgl.domain.PjJcry;
import com.xthena.gcgl.manager.PjJcryManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjJcryController {
    private PjJcryManager pjJcryManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjJcry-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjJcryManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjJcry-info-list";
    }

    @RequestMapping("pjJcry-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjJcry pjJcry = pjJcryManager.get(id);
            model.addAttribute("model", pjJcry);
        }

        return "gcgl/pjJcry-info-input";
    }

    @RequestMapping("pjJcry-info-save")
    public String save(@ModelAttribute PjJcry pjJcry,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjJcry dest = null;

        Long id = pjJcry.getFid();

        if (id != null) {
            dest = pjJcryManager.get(id);
            beanMapper.copy(pjJcry, dest);
        } else {
            dest = pjJcry;
        }

        pjJcryManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjJcry-info-list.do";
    }

    @RequestMapping("pjJcry-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjJcry> pjJcrys = pjJcryManager.findByIds(selectedItem);

        pjJcryManager.removeAll(pjJcrys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjJcry-info-list.do";
    }

    @RequestMapping("pjJcry-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjJcryManager.pagedQuery(page, propertyFilters);

        List<PjJcry> pjJcrys = (List<PjJcry>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjJcry info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjJcrys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjJcryManager(PjJcryManager pjJcryManager) {
        this.pjJcryManager = pjJcryManager;
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
