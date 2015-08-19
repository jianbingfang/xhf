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
import com.xthena.xz.domain.XzRedTape;
import com.xthena.xz.manager.XzRedTapeManager;
import com.xthena.xz.manager.XzZjDxlistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzRedTapeController {
    private XzRedTapeManager xzRedTapeManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @RequestMapping("xzRedTape-nb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	 parameterMap.put("filter_EQI_ftype", 1);
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzRedTapeManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzRedTape-nb-info-list";
    }

    @RequestMapping("xzRedTape-nb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzRedTape xzRedTape = xzRedTapeManager.get(id);
            model.addAttribute("model", xzRedTape);
        }

        return "xz/xzRedTape-nb-info-input";
    }

    @RequestMapping("xzRedTape-nb-info-save")
    public String save(@ModelAttribute XzRedTape xzRedTape,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzRedTape dest = null;

        Long id = xzRedTape.getFid();

        if (id != null) {
            dest = xzRedTapeManager.get(id);
            beanMapper.copy(xzRedTape, dest);
        } else {
            dest = xzRedTape;
        }
        dest.setFtype(1);
        xzRedTapeManager.mysave(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzRedTape-nb-info-list.do";
    }

    @RequestMapping("xzRedTape-nb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzRedTape> xzRedTapes = xzRedTapeManager.findByIds(selectedItem);

        xzRedTapeManager.removeAll(xzRedTapes);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzRedTape-nb-info-list.do";
    }

    @RequestMapping("xzRedTape-nb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	 parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzRedTapeManager.pagedQuery(page, propertyFilters);

        List<XzRedTape> xzRedTapes = (List<XzRedTape>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzRedTape info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzRedTapes);
        exportor.export(response, tableModel);
    }

    
    
    @RequestMapping("xzRedTape-wb-info-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	 parameterMap.put("filter_EQI_ftype", 2);
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzRedTapeManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/xzRedTape-wb-info-list";
    }

    @RequestMapping("xzRedTape-wb-info-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzRedTape xzRedTape = xzRedTapeManager.get(id);
            model.addAttribute("model", xzRedTape);
        }

        return "xz/xzRedTape-wb-info-input";
    }

    @RequestMapping("xzRedTape-wb-info-save")
    public String save2(@ModelAttribute XzRedTape xzRedTape,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzRedTape dest = null;

        Long id = xzRedTape.getFid();

        if (id != null) {
            dest = xzRedTapeManager.get(id);
            beanMapper.copy(xzRedTape, dest);
        } else {
            dest = xzRedTape;
        }
        dest.setFtype(2);
        xzRedTapeManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzRedTape-wb-info-list.do";
    }

    @RequestMapping("xzRedTape-wb-info-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzRedTape> xzRedTapes = xzRedTapeManager.findByIds(selectedItem);

        xzRedTapeManager.removeAll(xzRedTapes);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzRedTape-wb-info-list.do";
    }

    @RequestMapping("xzRedTape-wb-info-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	 parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzRedTapeManager.pagedQuery(page, propertyFilters);

        List<XzRedTape> xzRedTapes = (List<XzRedTape>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzRedTape info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzRedTapes);
        exportor.export(response, tableModel);
    }
    // ~ ======================================================================
    @Resource
    public void setXzRedTapeManager(XzRedTapeManager xzRedTapeManager) {
        this.xzRedTapeManager = xzRedTapeManager;
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
