package  com.xthena.jl.web;

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

import com.xthena.jl.domain.JlXgdw;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.jlXgdwManager;
import com.xthena.util.SessionUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class jlXgdwController {
    private jlXgdwManager jlXgdwManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;


    @Autowired 
    private JlDeptManager jlDeptManager;
    
    
    @RequestMapping("jlXgdw-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
    	if(page.getOrderBy()==null)
    		page.setOrderBy("fdwtype");
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlXgdwManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        

        return "jl/jlXgdw-info-list";
    }

    @RequestMapping("jlXgdw-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlXgdw jlXgdw = jlXgdwManager.get(id);
            model.addAttribute("model", jlXgdw);
            model.addAttribute("fdwtype", jlXgdw.getFdwtype());
        }

        return "jl/jlXgdw-info-input";
    }

    @RequestMapping("jlXgdw-info-save")
    public String save(@ModelAttribute JlXgdw jlXgdw,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        JlXgdw dest = null;

        Long id = jlXgdw.getFid();

        if (id != null) {
            dest = jlXgdwManager.get(id);
            beanMapper.copy(jlXgdw, dest);
        } else {
            dest = jlXgdw;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        jlXgdwManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlXgdw-info-list.do";
    }

    @RequestMapping("jlXgdw-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlXgdw> jlXgdws = jlXgdwManager.findByIds(selectedItem);

        jlXgdwManager.removeAll(jlXgdws);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlXgdw-info-list.do";
    }

    @RequestMapping("jlXgdw-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlXgdwManager.pagedQuery(page, propertyFilters);

        List<JlXgdw> jlXgdws = (List<JlXgdw>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlXgdw info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlXgdws);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setjlXgdwManager(jlXgdwManager jlXgdwManager) {
        this.jlXgdwManager = jlXgdwManager;
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
