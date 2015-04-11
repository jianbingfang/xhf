package  com.xthena.jl.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.PjXmMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.jl.domain.PjXmJd;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.PjXmJdManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class PjXmJdController {
    private PjXmJdManager pjXmJdManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @Autowired
    private PjXmManager pjXmManager;

    @RequestMapping("pjXmJd-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmJdManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/pjXmJd-info-list";
    }

    @RequestMapping("pjXmJd-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjXmJd pjXmJd = pjXmJdManager.get(id);
            model.addAttribute("model", pjXmJd);
        }

        return "jl/pjXmJd-info-input";
    }

    @RequestMapping("pjXmJd-info-save")
    public String save(@ModelAttribute PjXmJd pjXmJd,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXmJd dest = null;

        Long id = pjXmJd.getFid();

        if (id != null) {
            dest = pjXmJdManager.get(id);
            beanMapper.copy(pjXmJd, dest);
        } else {
            dest = pjXmJd;
        }

        pjXmJdManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/pjXmJd-info-list.do";
    }

    @RequestMapping("pjXmJd-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXmJd> pjXmJds = pjXmJdManager.findByIds(selectedItem);

        pjXmJdManager.removeAll(pjXmJds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/pjXmJd-info-list.do";
    }

    @RequestMapping("pjXmJd-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmJdManager.pagedQuery(page, propertyFilters);

        List<PjXmJd> pjXmJds = (List<PjXmJd>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjXmJd info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjXmJds);
        exportor.export(response, tableModel);
    }

    
    
    @RequestMapping("jl-sz-jdgl-save")
    public String jdglSave(@ModelAttribute PjXmJd pjXmJd,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
       
    	PjXmJd dest = null;

        Long id = pjXmJd.getFid();

        if (id != null) {
            dest = pjXmJdManager.get(id);
            beanMapper.copy(pjXmJd, dest);
        } else {
            dest = pjXmJd;
            dest.setFdate(new Date());
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        pjXmJdManager.saveJd(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
       
        return "redirect:/jl/jl-sz-jdgl-input.do";
    }
    
    
    @RequestMapping("jl-sz-jdgl-input")
    public String jdglEdit(Model model,HttpServletRequest request,@ModelAttribute Page page) {
    	
    	Map<String, Object> parameterMap=new HashMap<String, Object>() ;
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrder("DESC");
        page.setOrderBy("fdate");
        page = pjXmJdManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
       
        return "jl/jl-sz-jdgl-input";
    }
    
    // ~ ======================================================================
    @Resource
    public void setPjXmJdManager(PjXmJdManager pjXmJdManager) {
        this.pjXmJdManager = pjXmJdManager;
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
