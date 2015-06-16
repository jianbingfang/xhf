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
import com.xthena.hr.manager.CommRyManager;
import com.xthena.xz.domain.XzCommHuiyi;
import com.xthena.xz.manager.XzCommHuiyiManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCommHuiyiController {
    private XzCommHuiyiManager xzCommHuiyiManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
    private CommRyManager ryManager;

    @RequestMapping("xzCommHuiyi-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_LIKES_fneiwai", "内");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommHuiyiManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
       // model.addAttribute("userNames", ryManager.getAll());
        return "xz/xzCommHuiyi-info-list";
    }

    @RequestMapping("xzCommHuiyi-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzCommHuiyi xzCommHuiyi = xzCommHuiyiManager.get(id);
            model.addAttribute("model", xzCommHuiyi);
        }
       // model.addAttribute("userNames", ryManager.getAll());
        return "xz/xzCommHuiyi-info-input";
    }

    @RequestMapping("xzCommHuiyi-info-save")
    public String save(@ModelAttribute XzCommHuiyi xzCommHuiyi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCommHuiyi dest = null;

        Long id = xzCommHuiyi.getFid();

        if (id != null) {
            dest = xzCommHuiyiManager.get(id);
            beanMapper.copy(xzCommHuiyi, dest);
        } else {
            dest = xzCommHuiyi;
        }

        xzCommHuiyiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCommHuiyi-info-list.do";
    }

    @RequestMapping("xzCommHuiyi-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCommHuiyi> xzCommHuiyis = xzCommHuiyiManager.findByIds(selectedItem);

        xzCommHuiyiManager.removeAll(xzCommHuiyis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCommHuiyi-info-list.do";
    }

    @RequestMapping("xzCommHuiyi-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommHuiyiManager.pagedQuery(page, propertyFilters);

        List<XzCommHuiyi> xzCommHuiyis = (List<XzCommHuiyi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCommHuiyi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCommHuiyis);
        exportor.export(response, tableModel);
    }
    
    //************************************************************************wb***************************************************************
    @RequestMapping("xzCommHuiyi-wb-info-list")
    public String wblist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_LIKES_fneiwai", "外");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommHuiyiManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        //model.addAttribute("userNames", ryManager.getAll());
        return "xz/xzCommHuiyi-wb-info-list";
    }

    @RequestMapping("xzCommHuiyi-wb-info-input")
    public String wbinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzCommHuiyi xzCommHuiyi = xzCommHuiyiManager.get(id);
            model.addAttribute("model", xzCommHuiyi);
        }
       // model.addAttribute("userNames", ryManager.getAll());
        return "xz/xzCommHuiyi-wb-info-input";
    }

    @RequestMapping("xzCommHuiyi-wb-info-save")
    public String wbsave(@ModelAttribute XzCommHuiyi xzCommHuiyi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCommHuiyi dest = null;

        Long id = xzCommHuiyi.getFid();

        if (id != null) {
            dest = xzCommHuiyiManager.get(id);
            beanMapper.copy(xzCommHuiyi, dest);
        } else {
            dest = xzCommHuiyi;
        }

        xzCommHuiyiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCommHuiyi-wb-info-list.do";
    }

    @RequestMapping("xzCommHuiyi-wb-info-remove")
    public String wbremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCommHuiyi> xzCommHuiyis = xzCommHuiyiManager.findByIds(selectedItem);

        xzCommHuiyiManager.removeAll(xzCommHuiyis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCommHuiyi-wb-info-list.do";
    }

    @RequestMapping("xzCommHuiyi-wb-info-export")
    public void wbexport(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommHuiyiManager.pagedQuery(page, propertyFilters);

        List<XzCommHuiyi> xzCommHuiyis = (List<XzCommHuiyi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCommHuiyi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCommHuiyis);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCommHuiyiManager(XzCommHuiyiManager xzCommHuiyiManager) {
        this.xzCommHuiyiManager = xzCommHuiyiManager;
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
