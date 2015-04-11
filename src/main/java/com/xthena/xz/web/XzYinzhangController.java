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
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.xz.domain.XzYinzhang;
import com.xthena.xz.manager.XzYinzhangManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzYinzhangController {
    private XzYinzhangManager xzYinzhangManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzYinzhang-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzYinzhangManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzYinzhang-info-list";
    }

    @RequestMapping("xzYinzhang-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzYinzhang xzYinzhang = xzYinzhangManager.get(id);
            model.addAttribute("model", xzYinzhang);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "xz/xzYinzhang-info-input";
    }

    @RequestMapping("xzYinzhang-info-save")
    public String save(@ModelAttribute XzYinzhang xzYinzhang,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzYinzhang dest = null;

        Long id = xzYinzhang.getFid();

        if (id != null) {
            dest = xzYinzhangManager.get(id);
            beanMapper.copy(xzYinzhang, dest);
        } else {
            dest = xzYinzhang;
        }

        xzYinzhangManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzYinzhang-info-list.do";
    }

    @RequestMapping("xzYinzhang-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzYinzhang> xzYinzhangs = xzYinzhangManager.findByIds(selectedItem);

        xzYinzhangManager.removeAll(xzYinzhangs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzYinzhang-info-list.do";
    }

    @RequestMapping("xzYinzhang-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzYinzhangManager.pagedQuery(page, propertyFilters);

        List<XzYinzhang> xzYinzhangs = (List<XzYinzhang>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzYinzhang info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzYinzhangs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzYinzhangManager(XzYinzhangManager xzYinzhangManager) {
        this.xzYinzhangManager = xzYinzhangManager;
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
