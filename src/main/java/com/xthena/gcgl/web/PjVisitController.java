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

import com.xthena.gcgl.domain.PjVisit;
import com.xthena.gcgl.domain.Pjkh;
import com.xthena.gcgl.manager.PjVisitManager;
import com.xthena.gcgl.manager.PjVisitVManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjVisitController {
    private PjVisitManager pjVisitManager;
    private PjVisitVManager pjVisitVManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjVisit-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "fxmid", required = false) Long fxmid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	if(fxmid!=null){
    		parameterMap.put("filter_EQL_fxmid",fxmid);
    	}
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjVisitVManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjVisit-info-list";
    }

    @RequestMapping("pjVisit-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "fxmid", required = false) Long fxmid,
            Model model) {
        if (id != null) {
            PjVisit pjVisit = pjVisitManager.get(id);
            model.addAttribute("model", pjVisit);
        }

        if(id==null&fxmid!=null){
        	PjVisit pjVisit =pjVisitManager.findUniqueBy("fxmid", fxmid);
        	if(pjVisit==null){
        		pjVisit=new PjVisit();
        		pjVisit.setFxmid(fxmid);
        	}
   	 		model.addAttribute("model", pjVisit);
        }
	    
	    model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
	
        return "gcgl/pjVisit-info-input";
    }

    @RequestMapping("pjVisit-info-save")
    public String save(@ModelAttribute PjVisit pjVisit,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjVisit dest = null;

        Long id = pjVisit.getFid();

        if (id != null) {
            dest = pjVisitManager.get(id);
            beanMapper.copy(pjVisit, dest);
        } else {
            dest = pjVisit;
        }

        pjVisitManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjVisit-info-list.do";
    }

    @RequestMapping("pjVisit-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjVisit> pjVisits = pjVisitManager.findByIds(selectedItem);

        pjVisitManager.removeAll(pjVisits);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjVisit-info-list.do";
    }

    @RequestMapping("pjVisit-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjVisitManager.pagedQuery(page, propertyFilters);

        List<PjVisit> pjVisits = (List<PjVisit>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjVisit info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjVisits);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjVisitManager(PjVisitManager pjVisitManager) {
        this.pjVisitManager = pjVisitManager;
    }
    @Resource
    public void setPjVisitVManager(PjVisitVManager pjVisitVManager) {
        this.pjVisitVManager = pjVisitVManager;
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
