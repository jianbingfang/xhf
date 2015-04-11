package  com.xthena.cw.web;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
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
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.jl.manager.JlDeptManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwXmController {
    private PjXmManager pjXmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    
    @Autowired
    private JlDeptManager jlDeptManager;
    
/*    @PostConstruct
    public void intRmMap(){
    	PjXmMapUtil.initRyMap(pjXmManager);
    }
    */
/*    
    @RequestMapping("cwXm-manager-list")
    public String listXmForManager(@ModelAttribute Page page,@RequestParam(value = "fstatus", required = false) Long fstatus,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	
    	parameterMap.put("filter_EQS_fonline","1");//1代表在线
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
       
        return "gcgl/pjXm-manager-list";
    }
    
    @RequestMapping("gc-jl-home")
    public String gcjlhome(Model model,HttpServletRequest request,@RequestParam(value = "fxmid", required = false) Long fxmid) {
    	jlDeptManager.setXmId(request, fxmid);
        return "jl/jl-home";
    }
    */
    

    @RequestMapping("cwXm-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fstatus", required = false) Long fstatus,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
       
    	if(fstatus!= null&&fstatus==1){
    		parameterMap.put("filter_EQS_fxmstatus","在建");
    	}else if(fstatus!= null&&fstatus==2){
    		parameterMap.put("filter_EQS_fxmstatus","完工");
    	}else if(fstatus!= null&&fstatus==3){
    		parameterMap.put("filter_EQS_fxmstatus","竣工");
    	}
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = pjXmManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "cw/cwXm-info-list";
    }

    @RequestMapping("cwXm-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "type", required = false) String type,
            Model model) {
        if (id != null) {
            PjXm pjXm = pjXmManager.get(id);
            model.addAttribute("model", pjXm);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "cw/cwXm-info-input";
    }
    
    
    @RequestMapping("cwXm-manager-input")
    public String managerinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjXm pjXm = pjXmManager.get(id);
            model.addAttribute("model", pjXm);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "cw/cwXm-manager-input";
    }

    
    @RequestMapping("cwXm-manager-save")
    public String managersave(@ModelAttribute PjXm pjXm,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXm dest = null;

        Long id = pjXm.getFid();

        if (id != null) {
            dest = pjXmManager.get(id);
            beanMapper.copy(pjXm, dest);
        } else {
            dest = pjXm;
            dest.setFonline("1");
        }
        
        pjXmManager.save(dest);
        PjXmMapUtil.refreshRyMap(dest);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        
        return "redirect:/cw/cwXm-manager-list.do";
    }
    

    @RequestMapping("cwXm-info-save")
    public String save(@ModelAttribute PjXm pjXm,@RequestParam(value = "type", required = false) String type,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXm dest = null;

        Long id = pjXm.getFid();

        if (id != null) {
            dest = pjXmManager.get(id);
            beanMapper.copy(pjXm, dest);
        } else {
            dest = pjXm;
        }
        
        pjXmManager.save(dest);
        PjXmMapUtil.refreshRyMap(dest);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
       
        return "redirect:/cw/cw-commHt-info-list.do";
    }
    
    
    

    @RequestMapping("cwXm-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXm> pjXms = pjXmManager.findByIds(selectedItem);

        pjXmManager.removeAll(pjXms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cwXm-info-list.do";
    }
    

    @RequestMapping("cwXm-mamager-remove")
    public String mamagerremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXm> pjXms = pjXmManager.findByIds(selectedItem);

        pjXmManager.removeAll(pjXms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cwXm-mamager-list.do";
    }

    @RequestMapping("cwXm-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(page, propertyFilters);

        List<PjXm> pjXms = (List<PjXm>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjXm info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjXms);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("cwXm-simple-list")
    public void listXm(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,HttpServletResponse response) {
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response,page);
    }
    //根据项目编号 项目名称查询项目信息
    @RequestMapping("commRy-info-findUser")
    public void listBm(HttpServletResponse response,@RequestParam Map<String, Object> parameterMap) {
    	List<PropertyFilter> propertyFilters = PropertyFilter
              .buildFromMap(parameterMap);
    	List<PjXm> commRies=pjXmManager.find(propertyFilters);
    	JsonResponseUtil.write(response,commRies);
    }
    // ~ ======================================================================
    @Resource
    public void setPjXmManager(PjXmManager pjXmManager) {
        this.pjXmManager = pjXmManager;
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
