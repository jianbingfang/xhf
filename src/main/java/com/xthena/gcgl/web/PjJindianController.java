package  com.xthena.gcgl.web;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.xthena.gcgl.domain.PjJindian;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjJindianManager;
import com.xthena.gcgl.manager.PjXmManager;
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
public class PjJindianController {
    private PjJindianManager pjJindianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private PjXmManager pjXmManager;

    
    @RequestMapping("pjJindian-info-list")
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
	    	   page = pjJindianManager.pagedQuery(page.getPageNo(), page.getPageSize(),criterion);
	       }
       }else{
    	   page = pjJindianManager.pagedQuery(page.getPageNo(), page.getPageSize());
       }
       
        model.addAttribute("page", page);
       
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());

        return "gcgl/pjJindian-info-list";
    }

    @RequestMapping("pjJindian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
    	
    	model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        if (id != null) {
            PjJindian pjJindian = pjJindianManager.get(id);
            model.addAttribute("model", pjJindian);
        }
        
        if(id==null&fxmid!=null){
        	 PjJindian pjJindian= pjJindianManager.findUniqueBy("fxmid",fxmid);
        	 
        	 if(pjJindian==null){
        		 pjJindian =new PjJindian();
        		 pjJindian.setFxmid(fxmid);
        	 }
             
        	 model.addAttribute("model", pjJindian);
        }
        return "gcgl/pjJindian-info-input";
       
    }

    @RequestMapping("pjJindian-info-save")
    public String save(@ModelAttribute PjJindian pjJindian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjJindian dest = null;

        Long id = pjJindian.getFid();

        if (id != null) {
            dest = pjJindianManager.get(id);
            beanMapper.copy(pjJindian, dest);
        } else {
            dest = pjJindian;
        }

        pjJindianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        

        return "redirect:/gcgl/pjJindian-info-list.do";
    }

    @RequestMapping("pjJindian-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjJindian> pjJindians = pjJindianManager.findByIds(selectedItem);

        pjJindianManager.removeAll(pjJindians);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjJindian-info-list.do";
    }

    @RequestMapping("pjJindian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjJindianManager.pagedQuery(page, propertyFilters);

        List<PjJindian> pjJindians = (List<PjJindian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjJindian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjJindians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjJindianManager(PjJindianManager pjJindianManager) {
        this.pjJindianManager = pjJindianManager;
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
