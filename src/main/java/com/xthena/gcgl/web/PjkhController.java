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
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.domain.Pjkh;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.gcgl.manager.PjkhManager;
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
public class PjkhController {
    private PjkhManager pjkhManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private PjXmManager pjXmManager;
    
    @RequestMapping("pjkh-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	if(fxmid!=null){
    		parameterMap.put("filter_EQL_fxmid",fxmid);
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
		    	   page = pjkhManager.pagedQuery(page.getPageNo(), page.getPageSize(),criterion);
		       }
	       }else{
	    	   page = pjkhManager.pagedQuery(page.getPageNo(), page.getPageSize());
	       }
        
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gcgl/pjkh-info-list";
    }

    @RequestMapping("pjkh-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            Pjkh pjkh = pjkhManager.get(id);
            model.addAttribute("model", pjkh);
        }
        
        if(id==null&fxmid!=null){
	       		Pjkh pjkh =new Pjkh();
	       		pjkh.setFxmid(fxmid);
       	 	model.addAttribute("model", pjkh);
        }
        
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
    	
        return "gcgl/pjkh-info-input";
    }

    @RequestMapping("pjkh-info-save")
    public String save(@ModelAttribute Pjkh pjkh,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Pjkh dest = null;

        Long id = pjkh.getFid();

        if (id != null) {
            dest = pjkhManager.get(id);
            beanMapper.copy(pjkh, dest);
        } else {
            dest = pjkh;
        }

        pjkhManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjkh-info-list.do";
    }

    @RequestMapping("pjkh-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Pjkh> pjkhs = pjkhManager.findByIds(selectedItem);

        pjkhManager.removeAll(pjkhs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjkh-info-list.do";
    }

    @RequestMapping("pjkh-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjkhManager.pagedQuery(page, propertyFilters);

        List<Pjkh> pjkhs = (List<Pjkh>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjkh info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjkhs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjkhManager(PjkhManager pjkhManager) {
        this.pjkhManager = pjkhManager;
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
