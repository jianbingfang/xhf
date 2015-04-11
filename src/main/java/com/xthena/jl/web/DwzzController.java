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
import com.xthena.jl.domain.Dwzz;
import com.xthena.jl.manager.DwzzManager;
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
public class DwzzController {
    private DwzzManager dwzzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("dwzz-info-list")
    public String list(@ModelAttribute Page page,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQL_fxmid",jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dwzzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/dwzz-info-list";
    }

    @RequestMapping("dwzz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Dwzz dwzz = dwzzManager.get(id);
            model.addAttribute("model", dwzz);
        }

        return "jl/dwzz-info-input";
    }

    @RequestMapping("dwzz-info-save")
    public String save(@ModelAttribute Dwzz dwzz,HttpServletRequest request,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Dwzz dest = null;

        Long id = dwzz.getFid();

        if (id != null) {
            dest = dwzzManager.get(id);
            beanMapper.copy(dwzz, dest);
        } else {
            dest = dwzz;
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        dwzzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/dwzz-info-list.do";
    }

    @RequestMapping("dwzz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Dwzz> dwzzs = dwzzManager.findByIds(selectedItem);

        dwzzManager.removeAll(dwzzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/dwzz-info-list.do";
    }

    @RequestMapping("dwzz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = dwzzManager.pagedQuery(page, propertyFilters);

        List<Dwzz> dwzzs = (List<Dwzz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("dwzz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(dwzzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setDwzzManager(DwzzManager dwzzManager) {
        this.dwzzManager = dwzzManager;
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
