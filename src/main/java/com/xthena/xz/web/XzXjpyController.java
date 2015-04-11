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
import com.xthena.xz.domain.XzXjpy;
import com.xthena.xz.manager.XzXjpyManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzXjpyController {
    private XzXjpyManager xzxjpyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xzxjpy-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_LIKES_ftype", "内");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxjpyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzxjpy-info-list";
    }

    @RequestMapping("xzxjpy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzXjpy xzxjpy = xzxjpyManager.get(id);
            model.addAttribute("model", xzxjpy);
        }

        return "xz/xzxjpy-info-input";
    }

    @RequestMapping("xzxjpy-info-save")
    public String save(@ModelAttribute XzXjpy xzxjpy,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzXjpy dest = null;

        Long id = xzxjpy.getFid();

        if (id != null) {
            dest = xzxjpyManager.get(id);
            beanMapper.copy(xzxjpy, dest);
        } else {
            dest = xzxjpy;
        }

        xzxjpyManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzxjpy-info-list.do";
    }

    @RequestMapping("xzxjpy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzXjpy> xzxjpys = xzxjpyManager.findByIds(selectedItem);

        xzxjpyManager.removeAll(xzxjpys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzxjpy-info-list.do";
    }

    @RequestMapping("xzxjpy-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxjpyManager.pagedQuery(page, propertyFilters);

        List<XzXjpy> xzxjpys = (List<XzXjpy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzxjpy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzxjpys);
        exportor.export(response, tableModel);
    }

    
    //*****************************************************************wb*******************************************************
    
    
    @RequestMapping("xzxjpy-wb-info-list")
    public String wblist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_LIKES_ftype", "外");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxjpyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzxjpy-wb-info-list";
    }

    @RequestMapping("xzxjpy-wb-info-input")
    public String wbinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzXjpy xzxjpy = xzxjpyManager.get(id);
            model.addAttribute("model", xzxjpy);
        }

        return "xz/xzxjpy-wb-info-input";
    }

    @RequestMapping("xzxjpy-wb-info-save")
    public String wbsave(@ModelAttribute XzXjpy xzxjpy,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzXjpy dest = null;

        Long id = xzxjpy.getFid();

        if (id != null) {
            dest = xzxjpyManager.get(id);
            beanMapper.copy(xzxjpy, dest);
        } else {
            dest = xzxjpy;
        }

        xzxjpyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzxjpy-wb-info-list.do";
    }

    @RequestMapping("xzxjpy-wb-info-remove")
    public String wbremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzXjpy> xzxjpys = xzxjpyManager.findByIds(selectedItem);

        xzxjpyManager.removeAll(xzxjpys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzxjpy-wb-info-list.do";
    }

    @RequestMapping("xzxjpy-wb-info-export")
    public void wbexport(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzxjpyManager.pagedQuery(page, propertyFilters);

        List<XzXjpy> xzxjpys = (List<XzXjpy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzxjpy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzxjpys);
        exportor.export(response, tableModel);
    }
    
    // ~ ======================================================================
    @Resource
    public void setXzXjpyManager(XzXjpyManager xzxjpyManager) {
        this.xzxjpyManager = xzxjpyManager;
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
