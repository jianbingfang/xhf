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
import com.xthena.xz.domain.XzZjOrderList;
import com.xthena.xz.manager.XzZjOrderListManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzZjOrderListController {
    private XzZjOrderListManager xzZjOrderListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzZjOrderList-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzZjOrderListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzZjOrderList-info-list";
    }

    @RequestMapping("xzZjOrderList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzZjOrderList xzZjOrderList = xzZjOrderListManager.get(id);
            model.addAttribute("model", xzZjOrderList);
        }

        return "xz/xzZjOrderList-info-input";
    }

    @RequestMapping("xzZjOrderList-info-save")
    public String save(@ModelAttribute XzZjOrderList xzZjOrderList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzZjOrderList dest = null;

        Long id = xzZjOrderList.getFid();

        if (id != null) {
            dest = xzZjOrderListManager.get(id);
            beanMapper.copy(xzZjOrderList, dest);
        } else {
            dest = xzZjOrderList;
        }

        xzZjOrderListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzZjOrderList-info-list.do";
    }

    @RequestMapping("xzZjOrderList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzZjOrderList> xzZjOrderLists = xzZjOrderListManager.findByIds(selectedItem);

        xzZjOrderListManager.removeAll(xzZjOrderLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzZjOrderList-info-list.do";
    }

    @RequestMapping("xzZjOrderList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzZjOrderListManager.pagedQuery(page, propertyFilters);

        List<XzZjOrderList> xzZjOrderLists = (List<XzZjOrderList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzZjOrderList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzZjOrderLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzZjOrderListManager(XzZjOrderListManager xzZjOrderListManager) {
        this.xzZjOrderListManager = xzZjOrderListManager;
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
