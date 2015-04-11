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
import com.xthena.jl.domain.XgdwContact;
import com.xthena.jl.manager.JlDeptManager;
import com.xthena.jl.manager.XgdwContactManager;

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
public class XgdwContactController {
    private XgdwContactManager xgdwContactManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private JlDeptManager jlDeptManager;
    
    @RequestMapping("xgdwContact-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model,HttpServletRequest request) {
    	parameterMap.put("filter_EQL_fxmid", jlDeptManager.getXmId(request));
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xgdwContactManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/xgdwContact-info-list";
    }

    @RequestMapping("xgdwContact-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XgdwContact xgdwContact = xgdwContactManager.get(id);
            model.addAttribute("model", xgdwContact);
        }

        return "jl/xgdwContact-info-input";
    }

    @RequestMapping("xgdwContact-info-save")
    public String save(@ModelAttribute XgdwContact xgdwContact,
            @RequestParam Map<String, Object> parameterMap,HttpServletRequest request,
            RedirectAttributes redirectAttributes) {
        XgdwContact dest = null;

        Long id = xgdwContact.getFid();

        if (id != null) {
            dest = xgdwContactManager.get(id);
            beanMapper.copy(xgdwContact, dest);
        } else {
            dest = xgdwContact;
        	dest.setFxmid(jlDeptManager.getXmId(request));
        }

        xgdwContactManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/xgdwContact-info-list.do";
    }

    @RequestMapping("xgdwContact-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XgdwContact> xgdwContacts = xgdwContactManager.findByIds(selectedItem);

        xgdwContactManager.removeAll(xgdwContacts);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/xgdwContact-info-list.do";
    }

    @RequestMapping("xgdwContact-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xgdwContactManager.pagedQuery(page, propertyFilters);

        List<XgdwContact> xgdwContacts = (List<XgdwContact>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("xgdwContact info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(xgdwContacts);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXgdwContactManager(XgdwContactManager xgdwContactManager) {
        this.xgdwContactManager = xgdwContactManager;
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
