package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.domain.PjSubmit;
import com.xthena.gcgl.domain.PjVisit;
import com.xthena.gcgl.manager.PjSubmitManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjSubmitController {
    private PjSubmitManager pjSubmitManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjSubmit-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	if(fxmid!=null){
    		parameterMap.put("filter_EQL_fxmid",fxmid);
    	}
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjSubmitManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
      	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
      	
        return "gcgl/pjSubmit-info-list";
    }

    @RequestMapping("pjSubmit-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            PjSubmit pjSubmit = pjSubmitManager.get(id);
            model.addAttribute("model", pjSubmit);
        }
        

        if(id==null&fxmid!=null){
        	PjSubmit pjSubmit =pjSubmitManager.findUniqueBy("fxmid", fxmid);
        	if(pjSubmit==null){
        		pjSubmit=new PjSubmit();
        		pjSubmit.setFxmid(fxmid);
        	}
   	 		model.addAttribute("model", pjSubmit);
        }
	    
        
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
      	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjSubmit-info-input";
    }

    @RequestMapping("pjSubmit-info-save")
    public String save(@ModelAttribute PjSubmit pjSubmit,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjSubmit dest = null;

        Long id = pjSubmit.getFid();

        if (id != null) {
            dest = pjSubmitManager.get(id);
            beanMapper.copy(pjSubmit, dest);
        } else {
            dest = pjSubmit;
        }

        pjSubmitManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjSubmit-info-list.do";
    }

    @RequestMapping("pjSubmit-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjSubmit> pjSubmits = pjSubmitManager.findByIds(selectedItem);

        pjSubmitManager.removeAll(pjSubmits);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjSubmit-info-list.do";
    }

    @RequestMapping("pjSubmit-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjSubmitManager.pagedQuery(page, propertyFilters);

        List<PjSubmit> pjSubmits = (List<PjSubmit>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjSubmit info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjSubmits);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjSubmitManager(PjSubmitManager pjSubmitManager) {
        this.pjSubmitManager = pjSubmitManager;
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
