package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjYdkh;
import com.xthena.gcgl.manager.PjYdkhManager;
import com.xthena.gcgl.manager.PjYdkhVManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gcgl")
public class PjYdkhController {
    private PjYdkhManager pjYdkhManager;
    private PjYdkhVManager pjYdkhVManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjYdkh-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYdkhVManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjYdkh-info-list";
    }

    @RequestMapping("pjYdkh-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            PjYdkh pjYdkh = pjYdkhManager.get(id);
            model.addAttribute("model", pjYdkh);
        }

        return "gcgl/pjYdkh-info-input";
    }

    @RequestMapping("pjYdkh-info-save")
    public String save(@ModelAttribute PjYdkh pjYdkh,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {

        PjYdkh dest;

        Long id = pjYdkh.getFid();

        if (id != null) {
            dest = pjYdkhManager.get(id);
            beanMapper.copy(pjYdkh, dest);
        } else {
            dest = pjYdkh;
        }

        pjYdkhManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjYdkh-info-list.do";
    }

    @RequestMapping("pjYdkh-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<PjYdkh> pjYdkhs = pjYdkhManager.findByIds(selectedItem);

        pjYdkhManager.removeAll(pjYdkhs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjYdkh-info-list.do";
    }

    @RequestMapping("pjYdkh-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYdkhManager.pagedQuery(page, propertyFilters);

        List<PjYdkh> pjYdkhs = (List<PjYdkh>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjYdkh info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjYdkhs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjYdkhManager(PjYdkhManager pjYdkhManager) {
        this.pjYdkhManager = pjYdkhManager;
    }

    @Resource
    public void setPjYdkhVManager(PjYdkhVManager pjYdkhVManager) {
        this.pjYdkhVManager = pjYdkhVManager;
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
