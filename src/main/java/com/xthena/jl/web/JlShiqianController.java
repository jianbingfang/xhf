package  com.xthena.jl.web;

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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.ConstValue;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.SessionUtil;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.domain.JlShiqian;
import com.xthena.jl.domain.JlShiqianArray;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.jl.manager.JlShiqianManager;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlShiqianController {
    private JlShiqianManager jlShiqianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    
    @Autowired
    private JlFujianManager jlFujianManager;

    @RequestMapping("jlShiqian-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShiqianManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlShiqian-info-list";
    }

    @RequestMapping("jlShiqian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlShiqian jlShiqian = jlShiqianManager.get(id);
            model.addAttribute("model", jlShiqian);
        }
        
        return "jl/jlShiqian-info-input";
    }

  

    //工程前期手续
    @RequestMapping("jlShiqian-wenjian-input")
    public String wenjianInput(HttpServletRequest request,
            Model model) {
    	Map<String, Object> parameterMap=new HashMap<String, Object>();
    	parameterMap.put("filter_EQS_ftype", "SHIQIAN_JIANLIWENJIAN");
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	 List<PropertyFilter> propertyFilters = PropertyFilter
                 .buildFromMap(parameterMap);
    	List<JlShiqian> shiqians= jlShiqianManager.find(propertyFilters);
    	HashMap<String, Object> shouxuMap=new HashMap<String, Object>();
       if (!shiqians.isEmpty()) {
           for(JlShiqian jlShiqian:shiqians){
        	   shouxuMap.put(jlShiqian.getFitem(), jlShiqian);
        	   
        		parameterMap=new HashMap<String, Object>();
               	parameterMap.put("filter_EQS_ftablename", "t_jl_shiqian");
               	parameterMap.put("filter_EQL_fmainid", jlShiqian.getFid());
               	propertyFilters = PropertyFilter
                        .buildFromMap(parameterMap);
               	List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
              	if(!jlFujians.isEmpty())
               		shouxuMap.put(jlShiqian.getFitem()+"-FUJIAN", jlFujians.get(0));           }
        }
        model.addAttribute("model", shouxuMap);
        return "jl/jlShiqian-wenjian-input";
    }
    
    //公司资质
    @RequestMapping("jlShiqian-gszi-input")
    public String gsziInput(HttpServletRequest request,
            Model model) {
    	Map<String, Object> parameterMap=new HashMap<String, Object>();
    	parameterMap.put("filter_EQS_ftype", "SHIQIAN_ZIZHIZHENGJIAN");
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	 List<PropertyFilter> propertyFilters = PropertyFilter
                 .buildFromMap(parameterMap);
    	List<JlShiqian> shiqians= jlShiqianManager.find(propertyFilters);
    	HashMap<String, Object> shouxuMap=new HashMap<String, Object>();
       if (!shiqians.isEmpty()) {
           for(JlShiqian jlShiqian:shiqians){
        	   shouxuMap.put(jlShiqian.getFitem(), jlShiqian);
        	   
        		parameterMap=new HashMap<String, Object>();
               	parameterMap.put("filter_EQS_ftablename", "t_jl_shiqian");
               	parameterMap.put("filter_EQL_fmainid", jlShiqian.getFid());
               	propertyFilters = PropertyFilter
                        .buildFromMap(parameterMap);
               	List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
              	if(!jlFujians.isEmpty())
               		shouxuMap.put(jlShiqian.getFitem()+"-FUJIAN", jlFujians.get(0));           }
        }
        model.addAttribute("model", shouxuMap);
        return "jl/jlShiqian-gszi-input";
    }
    
    //工程前期手续
    @RequestMapping("jlShiqian-zl-input")
    public String ziliaoInput(HttpServletRequest request,
            Model model) {
    	Map<String, Object> parameterMap=new HashMap<String, Object>();
    	parameterMap.put("filter_EQS_ftype", "SHIQIAN_ZILIAO");
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	 List<PropertyFilter> propertyFilters = PropertyFilter
                 .buildFromMap(parameterMap);
    	List<JlShiqian> shiqians= jlShiqianManager.find(propertyFilters);
    	HashMap<String, Object> shouxuMap=new HashMap<String, Object>();
       if (!shiqians.isEmpty()) {
           for(JlShiqian jlShiqian:shiqians){
        	   shouxuMap.put(jlShiqian.getFitem(), jlShiqian);
        	   
        	   
        		parameterMap=new HashMap<String, Object>();
               	parameterMap.put("filter_EQS_ftablename", "t_jl_shiqian");
               	parameterMap.put("filter_EQL_fmainid", jlShiqian.getFid());
               	propertyFilters = PropertyFilter
                        .buildFromMap(parameterMap);
               	List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
               	if(!jlFujians.isEmpty())
               		shouxuMap.put(jlShiqian.getFitem()+"-FUJIAN", jlFujians.get(0));
           }
        }
        model.addAttribute("model", shouxuMap);
        return "jl/jlShiqian-zl-input";
    }
    
    //工程前期手续
    @RequestMapping("jlShiqian-jswj-input")
    public String jswjInput(HttpServletRequest request,
            Model model) {
    	Map<String, Object> parameterMap=new HashMap<String, Object>();
    	parameterMap.put("filter_EQS_ftype", "SHIQIAN_JISHUWENJIAN");
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	 List<PropertyFilter> propertyFilters = PropertyFilter
                 .buildFromMap(parameterMap);
    	List<JlShiqian> shiqians= jlShiqianManager.find(propertyFilters);
    	HashMap<String, Object> shouxuMap=new HashMap<String, Object>();
       if (!shiqians.isEmpty()) {
           for(JlShiqian jlShiqian:shiqians){
        	   shouxuMap.put(jlShiqian.getFitem(), jlShiqian);
        	   
        	parameterMap=new HashMap<String, Object>();
           	parameterMap.put("filter_EQS_ftablename", "t_jl_shiqian");
           	parameterMap.put("filter_EQL_fmainid", jlShiqian.getFid());
           	propertyFilters = PropertyFilter
                    .buildFromMap(parameterMap);
           	List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
          	if(!jlFujians.isEmpty())
           		shouxuMap.put(jlShiqian.getFitem()+"-FUJIAN", jlFujians.get(0));           	
           }
        }
        model.addAttribute("model", shouxuMap);
        return "jl/jlShiqian-jswj-input";
    }
    
    
    
    @RequestMapping("saveXcPic")
    public void saveXcPic(@RequestParam("jlFujians") String fujians,HttpServletRequest request,HttpServletResponse response) {
    	JSONArray jsonArray=JSONArray.fromObject(fujians);
    	//保存图片至 附件表，注明业务类型和项目ID
    	for(int i=0;i<jsonArray.size();i++){
    		JlFujian jlFujian=new JlFujian();
    		jlFujian.setFname(jsonArray.getJSONObject(i).getString("fname"));
    		jlFujian.setFurl(jsonArray.getJSONObject(i).getString("furl"));
    		jlFujian.setFxmid(jlDeptManager.getXmId(request));
    		jlFujian.setFuploaddate(new Date());
    		jlFujian.setFuploadry(Long.parseLong(SpringSecurityUtils.getCurrentUserId()));
    		jlFujian.setFbiztype(ConstValue.BASE_XIANCHANG_SHIKUANG);
    		jlFujianManager.save(jlFujian);
    	}
    	
    	JsonResponseUtil.write(response, "ok");
    }
    
    @RequestMapping("editPic")
    public void editPic(@RequestParam("fmemoText") String fmemoText,@RequestParam("picId") Long picId,HttpServletResponse response) {
    	JlFujian jlFujian=jlFujianManager.get(picId);
    	jlFujian.setFinfo(fmemoText);
    	jlFujianManager.save(jlFujian);
    	JsonResponseUtil.write(response, "ok");
    }
    
    @RequestMapping("deletePic")
    public void deletePic(@RequestParam("picId") Long picId,HttpServletResponse response) {
    	jlFujianManager.removeById(picId);
    	JsonResponseUtil.write(response, "ok");
    }
    
    @RequestMapping("listXcShikuang")
    public void listXcShikuang(HttpServletResponse response,HttpServletRequest request) {
    	HashMap<String, Object> paramHashMap=new HashMap<String, Object>();
    	paramHashMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	paramHashMap.put("filter_EQS_fbiztype",ConstValue.BASE_XIANCHANG_SHIKUANG);
    	
    	List<JlFujian> jlFujians=jlFujianManager.find(PropertyFilter.buildFromMap(paramHashMap));
    	
    	JsonResponseUtil.write(response, jlFujians);
    }
    
    
    @RequestMapping("saveJlbPic")
    public void saveJlbPic(@RequestParam("jlFujians") String fujians,HttpServletRequest request,HttpServletResponse response) {
    	JSONArray jsonArray=JSONArray.fromObject(fujians);
    	//保存图片至 附件表，注明业务类型和项目ID
    	for(int i=0;i<jsonArray.size();i++){
    		JlFujian jlFujian=new JlFujian();
    		jlFujian.setFname(jsonArray.getJSONObject(i).getString("fname"));
    		jlFujian.setFurl(jsonArray.getJSONObject(i).getString("furl"));
    		jlFujian.setFxmid(jlDeptManager.getXmId(request));
    		jlFujian.setFuploaddate(new Date());
    		jlFujian.setFuploadry(Long.parseLong(SpringSecurityUtils.getCurrentUserId()));
    		jlFujian.setFbiztype(ConstValue.BASE_JLB_SHIKUANG);
    		jlFujianManager.save(jlFujian);
    	}
    	
    	JsonResponseUtil.write(response, "ok");
    }
    
    @RequestMapping("listJlbShikuang")
    public void listJlbShikuang(HttpServletRequest request,HttpServletResponse response) {
    	HashMap<String, Object> paramHashMap=new HashMap<String, Object>();
    	paramHashMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	paramHashMap.put("filter_EQS_fbiztype",ConstValue.BASE_JLB_SHIKUANG);
    	
    	List<JlFujian> jlFujians=jlFujianManager.find(PropertyFilter.buildFromMap(paramHashMap));
    	
    	JsonResponseUtil.write(response, jlFujians);
    }
    
 
    @RequestMapping("jlShiqian-wenjian-saveMore")
    public String saveShouxuMore(@ModelAttribute JlShiqianArray jlShiqianArray,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	jlShiqianManager.saveMore(jlShiqianArray,userConnector,request);
    	messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                 "保存成功");
        return "redirect:/jl/jlShiqian-wenjian-input.do";
    }
    
    @RequestMapping("jlShiqian-zl-saveMore")
    public String saveZlMore(@ModelAttribute JlShiqianArray jlShiqianArray,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	jlShiqianManager.saveMore(jlShiqianArray,userConnector,request);
    	messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                 "保存成功");
        return "redirect:/jl/jlShiqian-zl-input.do";
    }
    
    @RequestMapping("jlShiqian-jswj-saveMore")
    public String saveJswjMore(@ModelAttribute JlShiqianArray jlShiqianArray,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	jlShiqianManager.saveMore(jlShiqianArray,userConnector,request);
    	messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                 "保存成功");
        return "redirect:/jl/jlShiqian-jswj-input.do";
    }
    
    @RequestMapping("jlShiqian-gszi-saveMore")
    public String saveGsziMore(@ModelAttribute JlShiqianArray jlShiqianArray,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	jlShiqianManager.saveMore(jlShiqianArray,userConnector,request);
    	messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                 "保存成功");
        return "redirect:/jl/jlShiqian-gszi-input.do";
    }
    


    
    @RequestMapping("jlShiqian-info-save")
    public String save(@ModelAttribute JlShiqian jlShiqian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlShiqian dest = null;

        Long id = jlShiqian.getFid();

        if (id != null) {
            dest = jlShiqianManager.get(id);
            beanMapper.copy(jlShiqian, dest);
        } else {
            dest = jlShiqian;
        }

        jlShiqianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlShiqian-info-list.do";
    }

    @RequestMapping("jlShiqian-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlShiqian> jlShiqians = jlShiqianManager.findByIds(selectedItem);

        jlShiqianManager.removeAll(jlShiqians);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlShiqian-info-list.do";
    }

    @RequestMapping("jlShiqian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlShiqianManager.pagedQuery(page, propertyFilters);

        List<JlShiqian> jlShiqians = (List<JlShiqian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlShiqian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlShiqians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlShiqianManager(JlShiqianManager jlShiqianManager) {
        this.jlShiqianManager = jlShiqianManager;
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
