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

import com.xthena.gcgl.domain.PjDc;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjDcManager;
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
public class PjDcController {
    private PjDcManager pjDcManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private PjXmManager pjXmManager;

    
    @RequestMapping("pjDc-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	if(fxmid!=null){
    		parameterMap.put("filter_EQL_fid", fxmid);
    	}
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
 	    	   page = pjDcManager.pagedQuery(page.getPageNo(), page.getPageSize(),criterion);
 	       }
        }else{
     	   page = pjDcManager.pagedQuery(page.getPageNo(), page.getPageSize());
        }
         
        model.addAttribute("rmMap", CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("page", page);

        return "gcgl/pjDc-info-list";
    }

    @RequestMapping("pjDc-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            PjDc pjDc = pjDcManager.get(id);
            model.addAttribute("model", pjDc);
        }
        
        if(id==null&&fxmid!=null){
        	 PjDc pjDc =pjDcManager.findUniqueBy("fxmid", fxmid);
        	 if(pjDc==null){
        		 pjDc=new PjDc();
        		 pjDc.setFxmid(fxmid);
        		 model.addAttribute("model", pjDc);
        	 }
        	
        }

        
        model.addAttribute("rmMap", CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "gcgl/pjDc-info-input";
    }

    @RequestMapping("pjDc-info-save")
    public String save(@ModelAttribute PjDc pjDc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjDc dest = null;

        Long id = pjDc.getFid();

        if (id != null) {
            dest = pjDcManager.get(id);
            beanMapper.copy(pjDc, dest);
        } else {
            dest = pjDc;
        }

        pjDcManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjDc-info-list.do";
    }

    @RequestMapping("pjDc-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjDc> pjDcs = pjDcManager.findByIds(selectedItem);

        pjDcManager.removeAll(pjDcs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjDc-info-list.do";
    }

    @RequestMapping("pjDc-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjDcManager.pagedQuery(page, propertyFilters);

        List<PjDc> pjDcs = (List<PjDc>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjDc info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjDcs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjDcManager(PjDcManager pjDcManager) {
        this.pjDcManager = pjDcManager;
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
