package com.xthena.dzb.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.common.domain.XhfCommonPlain;
import com.xthena.common.manager.XhfCommonPlainManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.manager.CodeGenManager;

@Controller
@RequestMapping("dzb")
public class DzbCommonPlainController {
	@Autowired
	private CodeGenManager codeGenManager;
	private XhfCommonPlainManager xhfCommonPlainManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("dzb-plain-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodulecode", "dzb");
    	parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonPlainManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "dzb/dzb-plain-info-list";
    }

    @RequestMapping("dzb-plain-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XhfCommonPlain xhfCommonPlain = xhfCommonPlainManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "dzb/dzb-plain-info-input";
    }

    @RequestMapping("dzb-plain-info-save")
    public String save(@ModelAttribute  XhfCommonPlain xhfCommonPlain,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	 XhfCommonPlain dest =  null;

        Long id = xhfCommonPlain.getFid();

        if (id != null) {
            dest = xhfCommonPlainManager.get(id);
            beanMapper.copy(xhfCommonPlain, dest);
        } else {
            dest = xhfCommonPlain;
            dest.setFcode(CodeUtil.getSysMothCode(ConstValue.SYS_CODE_PLAIN, 4, codeGenManager));
            dest.setFsubdate(new Timestamp(new Date().getTime()));
            dest.setFuserid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        }

        xhfCommonPlainManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/dzb/dzb-plain-info-list.do";
    }

    @RequestMapping("dzb-plain-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonPlain> xhfCommonPlains = xhfCommonPlainManager.findByIds(selectedItem);

        xhfCommonPlainManager.removeAll(xhfCommonPlains);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/dzb/dzb-plain-info-list.do";
    }

    @RequestMapping("dzb-plain-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodulecode", "dzb");
    	parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonPlainManager.pagedQuery(page, propertyFilters);

        List<XhfCommonPlain> xhfCommonPlains = (List<XhfCommonPlain>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工做计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonPlains);
        exportor.export(response, tableModel);
    }

    
    @RequestMapping("dzb-week-plain-info-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodulecode", "dzb");
    	parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonPlainManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "dzb/dzb-week-plain-info-list";
    }

    @RequestMapping("dzb-week-plain-info-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            XhfCommonPlain xhfCommonPlain = xhfCommonPlainManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "dzb/dzb-week-plain-info-input";
    }

    @RequestMapping("dzb-week-plain-info-save")
    public String save2(@ModelAttribute  XhfCommonPlain xhfCommonPlain,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	 XhfCommonPlain dest =  null;

        Long id = xhfCommonPlain.getFid();

        if (id != null) {
            dest = xhfCommonPlainManager.get(id);
            beanMapper.copy(xhfCommonPlain, dest);
        } else {
            dest = xhfCommonPlain;
            dest.setFcode(CodeUtil.getSysMothCode(ConstValue.SYS_CODE_PLAIN, 4, codeGenManager));
            dest.setFsubdate(new Timestamp(new Date().getTime()));
            dest.setFuserid(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
        }

        xhfCommonPlainManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/dzb/dzb-week-plain-info-list.do";
    }

    @RequestMapping("dzb-week-plain-info-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonPlain> xhfCommonPlains = xhfCommonPlainManager.findByIds(selectedItem);

        xhfCommonPlainManager.removeAll(xhfCommonPlains);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/dzb/dzb-week-plain-info-list.do";
    }

    @RequestMapping("dzb-week-plain-info-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodulecode", "dzb");
    	parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonPlainManager.pagedQuery(page, propertyFilters);

        List<XhfCommonPlain> xhfCommonPlains = (List<XhfCommonPlain>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工做计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonPlains);
        exportor.export(response, tableModel);
    }
    // ~ ======================================================================
    @Resource
    public void setxhfCommonPlainManager(XhfCommonPlainManager xhfCommonPlainManager) {
        this.xhfCommonPlainManager = xhfCommonPlainManager;
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
