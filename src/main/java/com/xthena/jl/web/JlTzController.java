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
import com.xthena.gcgl.domain.PjTzTemplat;
import com.xthena.gcgl.manager.PjTzTemplatManager;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.jl.domain.JlTz;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlTzManager;

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
public class JlTzController {
    private JlTzManager jlTzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    @Autowired
    private PjTzTemplatManager pjTzTemplatManager;
    
    @Autowired
    private JlDeptManager jlDeptManager;

    @RequestMapping("jlTz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlTzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlTz-info-list";
    }
    

    @RequestMapping("jlTz-info-list-ajax")
    public String listajax(@ModelAttribute Page page,HttpServletResponse response,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlTzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlTz-info-list";
    }
    
    @RequestMapping("jlTzItem-info-list-ajax")
    public void jlTzItemlist(@ModelAttribute Page page,HttpServletResponse response,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	List<PjTzTemplat> pjTzTemplats = pjTzTemplatManager.getAll();
        JsonResponseUtil.write(response, pjTzTemplats);
    }

    
    @RequestMapping("jlTz-info-input-ajax")
    public void inputajax(@RequestParam(value = "tempId", required = false) Long tempId,HttpServletRequest request,
    		HttpServletResponse response,
            Model model) {
    	 JlTz jlTz =null;
        if (tempId != null) {
            jlTz = jlTzManager.findUnique("from JlTz where fxmid=? and fplatid=?", jlDeptManager.getXmId(request),tempId);
            if(jlTz==null){
	        	jlTz=new JlTz();
	        	jlTz.setFplatid(tempId);
	        	jlTz.setFxmid(jlDeptManager.getXmId(request));
	        	PjTzTemplat pjTzTemplat=pjTzTemplatManager.get(tempId);
	        	jlTz.setFcontent(pjTzTemplat.getFcontent());
            }
        }

        JsonResponseUtil.write(response, jlTz);
    }
    
    @RequestMapping("jlTz-info-save-ajax")
    public void ajaxsave(@RequestParam(value = "tempId", required = false) Long tempId,HttpServletRequest request,
    		HttpServletResponse response,@RequestParam(value = "tzData", required = false) String tzData) {
    	JlTz jlTz =null;
    	if (tempId != null&&tzData!=null) {
            jlTz = jlTzManager.findUnique("from JlTz where fxmid=? and fplatid=?", jlDeptManager.getXmId(request),tempId);
            if(jlTz==null){
	        	jlTz=new JlTz();
	        	jlTz.setFplatid(tempId);
	        	jlTz.setFxmid(jlDeptManager.getXmId(request));
	        	jlTz.setFcontent(tzData);
            }else{
            	JlTz newjlTz=new JlTz();
            	newjlTz.setFplatid(tempId);
            	newjlTz.setFid(jlTz.getFid());
	        	newjlTz.setFxmid(jlDeptManager.getXmId(request));
            	jlTz.setFcontent(tzData);
            }
            
            jlTzManager.save(jlTz);
        	JsonResponseUtil.write(response, "保存成功");
        }
    }

    @RequestMapping("jlTz-info-save")
    public String save(@ModelAttribute JlTz jlTz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlTz dest = null;

        Long id = jlTz.getFid();

        if (id != null) {
            dest = jlTzManager.get(id);
            beanMapper.copy(jlTz, dest);
        } else {
            dest = jlTz;
        }

        jlTzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlTz-info-list.do";
    }

    @RequestMapping("jlTz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlTz> jlTzs = jlTzManager.findByIds(selectedItem);

        jlTzManager.removeAll(jlTzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlTz-info-list.do";
    }

    @RequestMapping("jlTz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlTzManager.pagedQuery(page, propertyFilters);

        List<JlTz> jlTzs = (List<JlTz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlTz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlTzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlTzManager(JlTzManager jlTzManager) {
        this.jlTzManager = jlTzManager;
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
