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
import com.xthena.util.CommRyMapUtil;
import com.xthena.xz.domain.XzYzDj;
import com.xthena.xz.manager.XzYzDjManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzYzDjController {
    private XzYzDjManager xzYzDjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzYzDj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzYzDjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzYzDj-info-list";
    }

    @RequestMapping("xzYzDj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzYzDj xzYzDj = xzYzDjManager.get(id);
            model.addAttribute("model", xzYzDj);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzYzDj-info-input";
    }

    @RequestMapping("xzYzDj-info-save")
    public String save(@ModelAttribute XzYzDj xzYzDj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzYzDj dest = null;

        Long id = xzYzDj.getFid();

        if (id != null) {
            dest = xzYzDjManager.get(id);
            beanMapper.copy(xzYzDj, dest);
        } else {
            dest = xzYzDj;
        }

        xzYzDjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzYzDj-info-list.do";
    }

    @RequestMapping("xzYzDj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzYzDj> xzYzDjs = xzYzDjManager.findByIds(selectedItem);

        xzYzDjManager.removeAll(xzYzDjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzYzDj-info-list.do";
    }

    @RequestMapping("xzYzDj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzYzDjManager.pagedQuery(page, propertyFilters);

        List<XzYzDj> xzYzDjs = (List<XzYzDj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzYzDj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzYzDjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzYzDjManager(XzYzDjManager xzYzDjManager) {
        this.xzYzDjManager = xzYzDjManager;
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
