package  com.xthena.jl.web;

import java.util.ArrayList;
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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.jl.domain.JlJindugenzong;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.JlJindugenzongManager;

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
public class JlJindugenzongController {
    private JlJindugenzongManager jljindugenzongManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("jljindugenzong-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, @RequestParam(value = "type", required = false) String type,Model model) {
    	if(type.equals("1")){
    		 return "redirect:/jl/jljindugenzong-info-input.do?type="+1;
    	}
    	parameterMap.put("filter_EQS_ftype", type);
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jljindugenzongManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("type", type);
        return "jl/jljindugenzong-info-list";
    }

    @RequestMapping("jljindugenzong-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "type", required = false) String type,
            Model model,HttpServletRequest request) {
        if (id != null) {
            JlJindugenzong jljindugenzong = jljindugenzongManager.get(id);
            model.addAttribute("model", jljindugenzong);
        }else if(id==null&&type.equals("1")){
        	 JlJindugenzong jljindugenzong=jljindugenzongManager.findUniqueBy("fxmid", jlDeptManager.getXmId(request));
        	 
        	 if(jljindugenzong!=null){
        		 return "redirect:jljindugenzongDetail-info-input.do?fgzid="+jljindugenzong.getFid();
        	 }
        }
        model.addAttribute("ftype", type);
        return "jl/jljindugenzong-info-input";
    }

    @RequestMapping("jljindugenzong-info-save")
    public String save(@ModelAttribute JlJindugenzong jljindugenzong,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlJindugenzong dest = null;

        Long id = jljindugenzong.getFid();

        if (id != null) {
            dest = jljindugenzongManager.get(id);
            beanMapper.copy(jljindugenzong, dest);
        } else {
            dest = jljindugenzong;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        jljindugenzongManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jljindugenzong-info-list.do?type="+dest.getFtype();
    }

    @RequestMapping("jljindugenzong-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlJindugenzong> jljindugenzongs = jljindugenzongManager.findByIds(selectedItem);

        jljindugenzongManager.removeAll(jljindugenzongs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jljindugenzong-info-list.do";
    }

    @RequestMapping("jljindugenzong-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jljindugenzongManager.pagedQuery(page, propertyFilters);

        List<JlJindugenzong> jljindugenzongs = (List<JlJindugenzong>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jljindugenzong info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jljindugenzongs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlJindugenzongManager(JlJindugenzongManager jljindugenzongManager) {
        this.jljindugenzongManager = jljindugenzongManager;
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
