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
import com.xthena.jl.domain.Dwryzj;
import com.xthena.jl.manager.DwryzjManager;
import com.xthena.jl.manager.JlDeptManager;

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
public class DwryzjController {
    private DwryzjManager dwryzjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("dwryzj-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	parameterMap.put("filter_EQL_fxmid",jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dwryzjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/dwryzj-info-list";
    }

    @RequestMapping("dwryzj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Dwryzj dwryzj = dwryzjManager.get(id);
            model.addAttribute("model", dwryzj);
        }

        return "jl/dwryzj-info-input";
    }

    @RequestMapping("dwryzj-info-save")
    public String save(@ModelAttribute Dwryzj dwryzj,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Dwryzj dest = null;

        Long id = dwryzj.getFid();

        if (id != null) {
            dest = dwryzjManager.get(id);
            beanMapper.copy(dwryzj, dest);
        } else {
            dest = dwryzj;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        dwryzjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/dwryzj-info-list.do";
    }

    @RequestMapping("dwryzj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Dwryzj> dwryzjs = dwryzjManager.findByIds(selectedItem);

        dwryzjManager.removeAll(dwryzjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/dwryzj-info-list.do";
    }

    @RequestMapping("dwryzj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dwryzjManager.pagedQuery(page, propertyFilters);

        List<Dwryzj> dwryzjs = (List<Dwryzj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("dwryzj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(dwryzjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setDwryzjManager(DwryzjManager dwryzjManager) {
        this.dwryzjManager = dwryzjManager;
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
