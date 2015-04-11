package  com.xthena.xz.web;

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
import com.xthena.xz.domain.XzDsj;
import com.xthena.xz.manager.XzDsjManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzDsjController {
    private XzDsjManager xzDsjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzDsj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzDsjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzDsj-info-list";
    }

    @RequestMapping("xzDsj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzDsj xzDsj = xzDsjManager.get(id);
            model.addAttribute("model", xzDsj);
        }

        return "xz/xzDsj-info-input";
    }

    @RequestMapping("xzDsj-info-save")
    public String save(@ModelAttribute XzDsj xzDsj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzDsj dest = null;

        Long id = xzDsj.getFid();

        if (id != null) {
            dest = xzDsjManager.get(id);
            beanMapper.copy(xzDsj, dest);
        } else {
            dest = xzDsj;
        }

        xzDsjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzDsj-info-list.do";
    }

    @RequestMapping("xzDsj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzDsj> xzDsjs = xzDsjManager.findByIds(selectedItem);

        xzDsjManager.removeAll(xzDsjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzDsj-info-list.do";
    }

    @RequestMapping("xzDsj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzDsjManager.pagedQuery(page, propertyFilters);

        List<XzDsj> xzDsjs = (List<XzDsj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzDsj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzDsjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzDsjManager(XzDsjManager xzDsjManager) {
        this.xzDsjManager = xzDsjManager;
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
