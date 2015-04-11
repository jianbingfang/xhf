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
import com.xthena.xz.domain.XzXhptj;
import com.xthena.xz.manager.XzXhptjManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzXhptjController {
    private XzXhptjManager xzxhptjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzxhptj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxhptjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzxhptj-info-list";
    }

    @RequestMapping("xzxhptj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzXhptj xzxhptj = xzxhptjManager.get(id);
            model.addAttribute("model", xzxhptj);
        }

        return "xz/xzxhptj-info-input";
    }

    @RequestMapping("xzxhptj-info-save")
    public String save(@ModelAttribute XzXhptj xzxhptj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzXhptj dest = null;

        Long id = xzxhptj.getFid();

        if (id != null) {
            dest = xzxhptjManager.get(id);
            beanMapper.copy(xzxhptj, dest);
        } else {
            dest = xzxhptj;
        }

        xzxhptjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzxhptj-info-list.do";
    }

    @RequestMapping("xzxhptj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzXhptj> xzxhptjs = xzxhptjManager.findByIds(selectedItem);

        xzxhptjManager.removeAll(xzxhptjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzxhptj-info-list.do";
    }

    @RequestMapping("xzxhptj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxhptjManager.pagedQuery(page, propertyFilters);

        List<XzXhptj> xzxhptjs = (List<XzXhptj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzxhptj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzxhptjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzXhptjManager(XzXhptjManager xzxhptjManager) {
        this.xzxhptjManager = xzxhptjManager;
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
