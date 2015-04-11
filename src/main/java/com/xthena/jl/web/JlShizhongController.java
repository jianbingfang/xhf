package  com.xthena.jl.web;

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
import com.xthena.jl.domain.JlDocTemplate;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.domain.JlShiZhongAndFujianArray;
import com.xthena.jl.domain.JlShizhong;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlDocTemplateManager;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.jl.manager.JlShizhongManager;
import com.xthena.util.JsonResponseUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlShizhongController {
    private JlShizhongManager jlShizhongManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private JlDocTemplateManager jlDocTemplateManager;
    
    @Autowired
    private JlFujianManager jlFujianManager;
    
    @Autowired
    private JlDeptManager jlDeptManager;
    

    @RequestMapping("jlShizhong-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fszleix", required = false) String fszleix,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fszleix", fszleix);
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShizhongManager.pagedQuery(page, propertyFilters);
       
        model.addAttribute("page", page);

        return "jl/jlShizhong-info-list";
    }

    @RequestMapping("jlShizhong-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fszleix", required = false) String fszleix,
            Model model) {
        if (id != null) {
            JlShizhong jlShizhong = jlShizhongManager.get(id);
            model.addAttribute("model", jlShizhong);
            
           List<JlFujian> jlFujians= jlFujianManager.find("select fujian from JlFujian fujian where fmainid=? and ftablename=?", id,"t_jl_shizhong");
           model.addAttribute("fujians",jlFujians);
        }

        
       List<JlDocTemplate> docTemplates= jlDocTemplateManager.findBy("fcode", fszleix);
       if(!docTemplates.isEmpty()){
    	   model.addAttribute("docTemp",docTemplates.get(0).getFcontent());
       }
        
        return "jl/jlShizhong-info-input";
    }
    
    
    @RequestMapping("jlShizhong-info-docTemplate-ajax")
    public void docTemplateAjax(@RequestParam(value = "id", required = false) Long id
    		,@RequestParam(value = "fszleix", required = false) String fszleix
    		,HttpServletResponse response,
            Model model) {
       List<JlDocTemplate> docTemplates= jlDocTemplateManager.findBy("fcode", fszleix);
       if(!docTemplates.isEmpty()){
    	   JsonResponseUtil.write(response, docTemplates.get(0).getFcontent());
       }else{
    	   JsonResponseUtil.write(response, "error");
       }
       
    }

    
    @RequestMapping("jlShizhong-info-deleteFujian")
    public String deleteFujian(@RequestParam(value = "fujianid", required = false) Long fujianid,@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (fujianid != null) {
          jlFujianManager.removeById(fujianid);
	        JlShizhong jlShizhong = jlShizhongManager.get(id);
	        model.addAttribute("model", jlShizhong);
	        
	       List<JlFujian> jlFujians= jlFujianManager.find("select fujian from JlFujian fujian where fmainid=? and ftablename=?", id,"t_jl_shizhong");
	       model.addAttribute("fujians",jlFujians);
        }

        return "jl/jlShizhong-info-input";
    }
    
    
    @RequestMapping("jlShizhong-info-deleteFujian-ajax")
    public void deleteFujian(@RequestParam(value = "fujianid", required = false) Long fujianid,@RequestParam(value = "id", required = false) Long id,
    		HttpServletRequest request,HttpServletResponse response) {
        if (fujianid != null) {
          jlFujianManager.removeById(fujianid);
        }
        JsonResponseUtil.write(response, "删除成功！");
    }
    
    
    
    
    @RequestMapping("jlShizhong-info-save")
    public String save(@ModelAttribute JlShiZhongAndFujianArray jlShiZhongAndFujianArray,@RequestParam(value = "style", required = false) String style,
    		
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
    	jlShizhongManager.saveJlShizhongAndFujian(jlShiZhongAndFujianArray,request);
    	  messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                   "保存成功");
        return "redirect:/jl/jlShizhong-info-input.do?fszleix="+jlShiZhongAndFujianArray.getJlShizhong().getFszleix()+"&style="+style+"&id="+jlShiZhongAndFujianArray.getJlShizhong().getFid();
    }
    
    
    
    @RequestMapping("jlShizhong-info-save-ajax")
    public void saveAjax(@ModelAttribute JlShiZhongAndFujianArray jlShiZhongAndFujianArray,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,HttpServletResponse response,
            RedirectAttributes redirectAttributes) {
    	jlShizhongManager.saveJlShizhongAndFujian(jlShiZhongAndFujianArray,request);

       JsonResponseUtil.write(response, "保存成功！");
    }
    
    @RequestMapping("jlShizhong-file-list-ajax")
    public void fileList(@RequestParam(value = "szid", required = false) Long szid,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,HttpServletResponse response,
            RedirectAttributes redirectAttributes) {
    	
    	parameterMap.put("filter_EQS_ftablename", "t_jl_shizhong");
    	parameterMap.put("filter_EQL_fmainid", szid);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
    
        jlFujianManager.find(propertyFilters);
    	

       JsonResponseUtil.write(response, jlFujianManager.find(propertyFilters));
    }
    
    
    @InitBinder("jlShizhong.")
    public void setBinderShizhong(WebDataBinder webDataBinder){
    	webDataBinder.setFieldDefaultPrefix("jlShizhong.");
    }
    
    @InitBinder("jlFujian.")
    public void setBinderFujian(WebDataBinder webDataBinder){
    	webDataBinder.setFieldDefaultPrefix("jlFujian.");
    }
    
    
    @RequestMapping("jlShizhong-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlShizhong> jlShizhongs = jlShizhongManager.findByIds(selectedItem);

        jlShizhongManager.removeAll(jlShizhongs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        //能同时删除的应该为同一类型，切类型不会为空
        return "redirect:/jl/jlShizhong-info-list.do?fszleix="+jlShizhongs.get(0).getFszleix();
    }

    @RequestMapping("jlShizhong-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShizhongManager.pagedQuery(page, propertyFilters);

        List<JlShizhong> jlShizhongs = (List<JlShizhong>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlShizhong info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlShizhongs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlShizhongManager(JlShizhongManager jlShizhongManager) {
        this.jlShizhongManager = jlShizhongManager;
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
