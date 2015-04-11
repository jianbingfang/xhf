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

import com.xthena.gcgl.domain.PjYqcheck;
import com.xthena.gcgl.manager.PjYqcheckManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjYqcheckController {
    private PjYqcheckManager pjYqcheckManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjYqcheck-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYqcheckManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjYqcheck-info-list";
    }

    @RequestMapping("pjYqcheck-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjYqcheck pjYqcheck = pjYqcheckManager.get(id);
            model.addAttribute("model", pjYqcheck);
        }

        return "gcgl/pjYqcheck-info-input";
    }

    @RequestMapping("pjYqcheck-info-save")
    public String save(@ModelAttribute PjYqcheck pjYqcheck,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjYqcheck dest = null;

        Long id = pjYqcheck.getFid();

        if (id != null) {
            dest = pjYqcheckManager.get(id);
            beanMapper.copy(pjYqcheck, dest);
        } else {
            dest = pjYqcheck;
        }

        pjYqcheckManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjYqcheck-info-list.do";
    }

    @RequestMapping("pjYqcheck-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjYqcheck> pjYqchecks = pjYqcheckManager.findByIds(selectedItem);

        pjYqcheckManager.removeAll(pjYqchecks);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjYqcheck-info-list.do";
    }

    @RequestMapping("pjYqcheck-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYqcheckManager.pagedQuery(page, propertyFilters);

        List<PjYqcheck> pjYqchecks = (List<PjYqcheck>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjYqcheck info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjYqchecks);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjYqcheckManager(PjYqcheckManager pjYqcheckManager) {
        this.pjYqcheckManager = pjYqcheckManager;
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
