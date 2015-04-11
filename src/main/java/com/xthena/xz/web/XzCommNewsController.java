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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.xz.domain.XzCommNews;
import com.xthena.xz.manager.XzCommNewsManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class XzCommNewsController {
    private XzCommNewsManager xzCommNewsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;

    @RequestMapping("xzCommNews-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	 parameterMap.put("filter_EQS_flanmu", "上级新闻");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommNewsManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        return "xz/xzCommNews-info-list";
    }

    @RequestMapping("xzCommNews-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzCommNews xzCommNews = xzCommNewsManager.get(id);
            model.addAttribute("model", xzCommNews);
        }
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        return "xz/xzCommNews-info-input";
    }

    @RequestMapping("xzCommNews-info-save")
    public String save(@ModelAttribute XzCommNews xzCommNews,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCommNews dest = null;

        Long id = xzCommNews.getFid();

        if (id != null) {
            dest = xzCommNewsManager.get(id);
            beanMapper.copy(xzCommNews, dest);
        } else {
            dest = xzCommNews;
        }
        dest.setFlanmu("上级新闻");
        xzCommNewsManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCommNews-info-list.do";
    }
    
 

    @RequestMapping("xzCommNews-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCommNews> xzCommNewss = xzCommNewsManager.findByIds(selectedItem);

        xzCommNewsManager.removeAll(xzCommNewss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCommNews-info-list.do";
    }

    @RequestMapping("xzCommNews-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_flanmu", "上级新闻");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommNewsManager.pagedQuery(page, propertyFilters);

        List<XzCommNews> xzCommNewss = (List<XzCommNews>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCommNews info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCommNewss);
        exportor.export(response, tableModel);
    }
    
    
    
    

    @RequestMapping("xzCommNews-nb-info-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_flanmu", "公司内部新闻");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xzCommNewsManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        return "xz/xzCommNews-nb-info-list";
    }

    @RequestMapping("xzCommNews-nb-info-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XzCommNews xzCommNews = xzCommNewsManager.get(id);
            model.addAttribute("model", xzCommNews);
        }
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        return "xz/xzCommNews-nb-info-input";
    }

    @RequestMapping("xzCommNews-nb-info-save")
    public String save2(@ModelAttribute XzCommNews xzCommNews,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        XzCommNews dest = null;

        Long id = xzCommNews.getFid();

        if (id != null) {
            dest = xzCommNewsManager.get(id);
            beanMapper.copy(xzCommNews, dest);
        } else {
            dest = xzCommNews;
        }
        dest.setFlanmu("公司内部新闻");
        parameterMap.put("filter_EQS_flanmu", "公司内部新闻");
        xzCommNewsManager.save(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzCommNews-nb-info-list.do";
    }

    @RequestMapping("xzCommNews-nb-info-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XzCommNews> xzCommNewss = xzCommNewsManager.findByIds(selectedItem);

        xzCommNewsManager.removeAll(xzCommNewss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzCommNews-nb-info-list.do";
    }

    @RequestMapping("xzCommNews-nb-info-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_flanmu", "公司内部新闻");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzCommNewsManager.pagedQuery(page, propertyFilters);
        List<XzCommNews> xzCommNewss = (List<XzCommNews>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xzCommNews info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xzCommNewss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzCommNewsManager(XzCommNewsManager xzCommNewsManager) {
        this.xzCommNewsManager = xzCommNewsManager;
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
