package  com.xthena.jl.web;

import java.util.ArrayList;
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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.SessionUtil;
import com.xthena.jl.domain.JlKqRy;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlKqRyManager;

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
public class JlKqRyController {
	
    private JlKqRyManager jlKqRyManager;
    
	private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-kq-saveFmemo")
    public void  saveFmemo(HttpServletResponse response,@RequestParam(value = "fmemo", required = false) String fmemo,
			@RequestParam Map<String, Object> parameterMap) {
    	
    	JlKqRy jlKqRy=jlKqRyManager.get(Long.valueOf(String.valueOf(parameterMap.get("fkqryid"))));
    	jlKqRy.setFmemo(fmemo);
    	
    	jlKqRyManager.save(jlKqRy);
        JsonResponseUtil.write(response,"1");
    }
    
    @RequestMapping("jl-kq-save")
    public void  jlKqSave(HttpServletResponse response,
			@RequestParam Map<String, Object> parameterMap) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        JsonResponseUtil.write(response,jlKqRyManager.saveKq(parameterMap));
    }
   
    
    @RequestMapping("jl-kq-list")
    public void  jlKqList(HttpServletResponse response,HttpServletRequest request,
			@RequestParam Map<String, Object> parameterMap) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        parameterMap.put("fxmid", jlDeptManager.getXmId(request));
        JsonResponseUtil.write(response,jlKqRyManager.listRyKq(parameterMap));
    }
    
    
    @RequestMapping("gc-kq-list")
    public void  gcKqList(HttpServletResponse response,HttpServletRequest request,
			@RequestParam Map<String, Object> parameterMap) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        JsonResponseUtil.write(response,jlKqRyManager.listRyKq(parameterMap));
    }
    
    @RequestMapping("jlKqRy-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlKqRyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlKqRy-info-list";
    }

    @RequestMapping("jlKqRy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlKqRy jlKqRy = jlKqRyManager.get(id);
            model.addAttribute("model", jlKqRy);
        }

        return "jl/jlKqRy-info-input";
    }

    @RequestMapping("jlKqRy-info-save")
    public String save(@ModelAttribute JlKqRy jlKqRy,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlKqRy dest = null;

        Long id = jlKqRy.getFid();

        if (id != null) {
            dest = jlKqRyManager.get(id);
            beanMapper.copy(jlKqRy, dest);
        } else {
            dest = jlKqRy;
        }

        jlKqRyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlKqRy-info-list.do";
    }

    @RequestMapping("jlKqRy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlKqRy> jlKqRys = jlKqRyManager.findByIds(selectedItem);

        jlKqRyManager.removeAll(jlKqRys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlKqRy-info-list.do";
    }

    @RequestMapping("jlKqRy-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlKqRyManager.pagedQuery(page, propertyFilters);

        List<JlKqRy> jlKqRys = (List<JlKqRy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlKqRy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlKqRys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlKqRyManager(JlKqRyManager jlKqRyManager) {
        this.jlKqRyManager = jlKqRyManager;
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
