package  com.xthena.jl.web;

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

import com.xthena.util.CommRyMapUtil;
import com.xthena.util.SessionUtil;
import com.xthena.gcgl.domain.PjNy;
import com.xthena.gcgl.manager.PjNyListManager;
import com.xthena.gcgl.manager.PjNyManager;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.jl.manager.JlDeptManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPjNyController {
    private PjNyManager pjNyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private PjNyListManager pjNyListManager;
    
    @Autowired
    private CommRyManager commRyManager;
    

    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jl-pjNy-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/pjNy-info-list";
    }

    @RequestMapping("jl-pjNy-info-input")
    public String input(@ModelAttribute Page page,HttpServletRequest request,
            Model model) {
    	
            PjNy pjNy = pjNyManager.findUniqueBy("fxmid",jlDeptManager.getXmId(request));
            
            if(pjNy!=null){
	            model.addAttribute("model", pjNy);
	            model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
	            
	            Map<String, Object> parameterMap=new HashMap<String, Object>();
	            parameterMap.put("filter_EQL_fnyid",pjNy.getFid());
	            List<PropertyFilter> propertyFilters = PropertyFilter
	                    .buildFromMap(parameterMap);
	            page = pjNyListManager.pagedQuery(page, propertyFilters);
	
	            model.addAttribute("page", page);
            
            }

        return "jl/pjNy-info-input";
    }

    @RequestMapping("jl-pjNy-info-save")
    public String save(@ModelAttribute PjNy pjNy,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjNy dest = null;

        Long id = pjNy.getFid();

        if (id != null) {
            dest = pjNyManager.get(id);
            beanMapper.copy(pjNy, dest);
        } else {
            dest = pjNy;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        pjNyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jl-pjNy-info-list.do";
    }

    @RequestMapping("jl-pjNy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjNy> pjNys = pjNyManager.findByIds(selectedItem);

        pjNyManager.removeAll(pjNys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jl-pjNy-info-list.do";
    }

    @RequestMapping("jl-pjNy-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyManager.pagedQuery(page, propertyFilters);

        List<PjNy> pjNys = (List<PjNy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjNy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjNys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjNyManager(PjNyManager pjNyManager) {
        this.pjNyManager = pjNyManager;
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
