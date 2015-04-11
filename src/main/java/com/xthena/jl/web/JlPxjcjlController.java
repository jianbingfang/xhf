package  com.xthena.jl.web;

import java.util.ArrayList;
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
import com.xthena.gcgl.domain.PjPxjcjlTemplat;
import com.xthena.gcgl.domain.PjPxjcjlTemplat;
import com.xthena.gcgl.manager.PjPxjcjlTemplatManager;
import com.xthena.gcgl.manager.PjPxjcjlTemplatManager;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.jl.domain.JlPxjcjl;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlPxjcjlManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlPxjcjlController {
    private JlPxjcjlManager jlPxjcjlManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private PjPxjcjlTemplatManager pjPxjcjlTemplatManager;
    
    @Autowired
    private JlDeptManager jlDeptManager;

    @RequestMapping("jlPxjcjl-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlPxjcjlManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlPxjcjl-info-list";
    }
    

    @RequestMapping("jlPxjcjl-info-list-ajax")
    public String listajax(@ModelAttribute Page page,HttpServletResponse response,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlPxjcjlManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlPxjcjl-info-list";
    }
    
    @RequestMapping("jlPxjcjlItem-info-list-ajax")
    public void jlPxjcjlItemlist(@ModelAttribute Page page,HttpServletResponse response,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	List<PjPxjcjlTemplat> pjPxjcjlTemplats = pjPxjcjlTemplatManager.getAll();
        JsonResponseUtil.write(response, pjPxjcjlTemplats);
    }

    
    @RequestMapping("jlPxjcjl-info-input-ajax")
    public void inputajax(@RequestParam(value = "tempId", required = false) Long tempId,HttpServletRequest request,
    		HttpServletResponse response,
            Model model) {
    	 JlPxjcjl jlPxjcjl =null;
        if (tempId != null) {
            jlPxjcjl = jlPxjcjlManager.findUnique("from JlPxjcjl where fxmid=? and fplatid=?", jlDeptManager.getXmId(request),tempId);
            if(jlPxjcjl==null){
	        	jlPxjcjl=new JlPxjcjl();
	        	jlPxjcjl.setFplatid(tempId);
	        	jlPxjcjl.setFxmid(jlDeptManager.getXmId(request));
	        	PjPxjcjlTemplat pjPxjcjlTemplat=pjPxjcjlTemplatManager.get(tempId);
	        	jlPxjcjl.setFcontent(pjPxjcjlTemplat.getFcontent());
            }
        }

        JsonResponseUtil.write(response, jlPxjcjl);
    }
    
    @RequestMapping("jlPxjcjl-info-save-ajax")
    public void ajaxsave(@RequestParam(value = "tempId", required = false) Long tempId,HttpServletRequest request,
    		HttpServletResponse response,@RequestParam(value = "tzData", required = false) String tzData) {
    	JlPxjcjl jlPxjcjl =null;
    	if (tempId != null&&tzData!=null) {
            jlPxjcjl = jlPxjcjlManager.findUnique("from JlPxjcjl where fxmid=? and fplatid=?", jlDeptManager.getXmId(request),tempId);
            if(jlPxjcjl==null){
	        	jlPxjcjl=new JlPxjcjl();
	        	jlPxjcjl.setFplatid(tempId);
	        	jlPxjcjl.setFxmid(jlDeptManager.getXmId(request));
	        	jlPxjcjl.setFcontent(tzData);
            }else{
            	JlPxjcjl newjlPxjcjl=new JlPxjcjl();
            	newjlPxjcjl.setFplatid(tempId);
            	newjlPxjcjl.setFid(jlPxjcjl.getFid());
	        	newjlPxjcjl.setFxmid(jlDeptManager.getXmId(request));
            	jlPxjcjl.setFcontent(tzData);
            }
            
            jlPxjcjlManager.save(jlPxjcjl);
        	JsonResponseUtil.write(response, "保存成功");
        }
    }

    @RequestMapping("jlPxjcjl-info-save")
    public String save(@ModelAttribute JlPxjcjl jlPxjcjl,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlPxjcjl dest = null;

        Long id = jlPxjcjl.getFid();

        if (id != null) {
            dest = jlPxjcjlManager.get(id);
            beanMapper.copy(jlPxjcjl, dest);
        } else {
            dest = jlPxjcjl;
        }

        jlPxjcjlManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlPxjcjl-info-list.do";
    }

    @RequestMapping("jlPxjcjl-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlPxjcjl> jlPxjcjls = jlPxjcjlManager.findByIds(selectedItem);

        jlPxjcjlManager.removeAll(jlPxjcjls);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlPxjcjl-info-list.do";
    }

    @RequestMapping("jlPxjcjl-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlPxjcjlManager.pagedQuery(page, propertyFilters);

        List<JlPxjcjl> jlPxjcjls = (List<JlPxjcjl>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlPxjcjl info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlPxjcjls);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlPxjcjlManager(JlPxjcjlManager jlPxjcjlManager) {
        this.jlPxjcjlManager = jlPxjcjlManager;
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
