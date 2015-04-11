package  com.xthena.xz.web;

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

import com.xthena.xz.domain.Xzzz;
import com.xthena.xz.manager.XzzzManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzzzController {
	
    private XzzzManager xzzzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzzz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzzzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzzz-info-list";
    }

    @RequestMapping("xzzz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Xzzz xzzz = xzzzManager.get(id);
            model.addAttribute("model", xzzz);
        }

        return "xz/xzzz-info-input";
    }

    @RequestMapping("xzzz-info-save")
    public String save(@ModelAttribute Xzzz xzzz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Xzzz dest = null;

        Long id = xzzz.getFid();

        if (id != null) {
            dest = xzzzManager.get(id);
            beanMapper.copy(xzzz, dest);
        } else {
            dest = xzzz;
        }

        xzzzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzzz-info-list.do";
    }

    @RequestMapping("xzzz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Xzzz> xzzzs = xzzzManager.findByIds(selectedItem);

        xzzzManager.removeAll(xzzzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzzz-info-list.do";
    }

    @RequestMapping("xzzz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzzzManager.pagedQuery(page, propertyFilters);

        List<Xzzz> xzzzs = (List<Xzzz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzzz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzzzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzzzManager(XzzzManager xzzzManager) {
        this.xzzzManager = xzzzManager;
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
