package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.domain.PjFirstCheck;
import com.xthena.gcgl.domain.PjJindian;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjFirstCheckManager;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjFirstCheckController {
    private PjFirstCheckManager pjFirstCheckManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private PjXmManager pjXmManager;

    
    @RequestMapping("pjFirstCheck-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        if(!propertyFilters.isEmpty()){
	    	List<PjXm> pjXms= pjXmManager.find(propertyFilters);
	       List<Long> pjids=new ArrayList<Long>();
	       for(PjXm pjXm:pjXms){
	    	   pjids.add(pjXm.getFid()); 
	       }
	       if(!pjids.isEmpty()){
	    	   Criterion criterion=Restrictions.in("fxmid", pjids);
	    	   page = pjFirstCheckManager.pagedQuery(page.getPageNo(), page.getPageSize(),criterion);
	       }
       }else{
    	   page = pjFirstCheckManager.pagedQuery(page.getPageNo(), page.getPageSize());
       }
        

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "gcgl/pjFirstCheck-info-list";
    }

    @RequestMapping("pjFirstCheck-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
    	
    	model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
    	if (id != null) {
            PjFirstCheck pjFirstCheck = pjFirstCheckManager.get(id);
            model.addAttribute("model", pjFirstCheck);
        }
        
        if(id==null&fxmid!=null){
        	PjFirstCheck pjFirstCheck= pjFirstCheckManager.findUniqueBy("fxmid",fxmid);
       	 
	       	 if(pjFirstCheck==null){
	       		pjFirstCheck =new PjFirstCheck();
	       		pjFirstCheck.setFxmid(fxmid);
	       	 }
            
       	 	model.addAttribute("model", pjFirstCheck);
        }

        return "gcgl/pjFirstCheck-info-input";
    }

    @RequestMapping("pjFirstCheck-info-save")
    public String save(@ModelAttribute PjFirstCheck pjFirstCheck,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjFirstCheck dest = null;

        Long id = pjFirstCheck.getFid();

        if (id != null) {
            dest = pjFirstCheckManager.get(id);
            beanMapper.copy(pjFirstCheck, dest);
        } else {
            dest = pjFirstCheck;
        }

        pjFirstCheckManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjFirstCheck-info-list.do";
    }

    @RequestMapping("pjFirstCheck-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjFirstCheck> pjFirstChecks = pjFirstCheckManager.findByIds(selectedItem);

        pjFirstCheckManager.removeAll(pjFirstChecks);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjFirstCheck-info-list.do";
    }

    @RequestMapping("pjFirstCheck-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjFirstCheckManager.pagedQuery(page, propertyFilters);

        List<PjFirstCheck> pjFirstChecks = (List<PjFirstCheck>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjFirstCheck info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjFirstChecks);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjFirstCheckManager(PjFirstCheckManager pjFirstCheckManager) {
        this.pjFirstCheckManager = pjFirstCheckManager;
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
