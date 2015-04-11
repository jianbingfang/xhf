package com.xthena.hr.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.common.domain.XhfCommonDoc;
import com.xthena.common.manager.XhfCommonDocManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.util.ConstValue;

@Controller
@RequestMapping("hr")
public class XhfDocController {
   
	private XhfCommonDocManager xhfCommonDocManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    
  // ==============================================================================
    
    @RequestMapping("hr-doc-cbhs-list")
    public String listcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_CBHS);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-cbhs-list";
    }

   @RequestMapping("hr-doc-cbhs-input")
    public String inputcbhs(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-cbhs-input";
    }

    @RequestMapping("hr-doc-cbhs-save")
    public String savecbhs(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-cbhs-list.do";
    }

    @RequestMapping("hr-doc-cbhs-remove")
    public String removecbhs(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-cbhs-list.do";
    }

    @RequestMapping("hr-doc-cbhs-export")
    public void exportcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype",  ConstValue.DOC_CBHS);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工做计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }

    //======================================================================================

    
    @RequestMapping("hr-doc-gzzj-list")
    public String listgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZZJ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-gzzj-list";
    }

   @RequestMapping("hr-doc-gzzj-input")
    public String inputgzzj(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-gzzj-input";
    }

    @RequestMapping("hr-doc-gzzj-save")
    public String savegzzj(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-gzzj-list.do";
    }

    @RequestMapping("hr-doc-gzzj-remove")
    public String removegzzj(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-gzzj-list.do";
    }

    @RequestMapping("hr-doc-gzzj-export")
    public void exportgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype",  ConstValue.DOC_GZZJ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工做计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }


   //======================================================================================
    
    @RequestMapping("hr-doc-glzd-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-glzd-list";
    }

   @RequestMapping("hr-doc-glzd-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-glzd-input";
    }

    @RequestMapping("hr-doc-glzd-save")
    public String save(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-glzd-list.do";
    }

    @RequestMapping("hr-doc-glzd-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-glzd-list.do";
    }

    @RequestMapping("hr-doc-glzd-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工作计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }

    
    @RequestMapping("hr-doc-gzlc-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-gzlc-list";
    }

   @RequestMapping("hr-doc-gzlc-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-gzlc-input";
    }

    @RequestMapping("hr-doc-gzlc-save")
    public String save2(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-gzlc-list.do";
    }

    @RequestMapping("hr-doc-gzlc-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-gzlc-list.do";
    }

    @RequestMapping("hr-doc-gzlc-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工作计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("hr-doc-xctx-list")
    public String list3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 3);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-xctx-list";
    }

   @RequestMapping("hr-doc-xctx-input")
    public String input3(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-xctx-input";
    }

    @RequestMapping("hr-doc-xctx-save")
    public String save3(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-xctx-list.do";
    }

    @RequestMapping("hr-doc-xctx-remove")
    public String remove3(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-xctx-list.do";
    }

    @RequestMapping("hr-doc-xctx-export")
    public void export3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", 3);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工作计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("hr-doc-zplc-list")
    public String list4(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_ZPLC);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-doc-zplc-list";
    }

   @RequestMapping("hr-doc-zplc-input")
    public String input4(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-doc-zplc-input";
    }

    @RequestMapping("hr-doc-zplc-save")
    public String save4(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }

        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-zplc-list.do";
    }

    @RequestMapping("hr-doc-zplc-remove")
    public String remove4(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-zplc-list.do";
    }

    @RequestMapping("hr-doc-zplc-export")
    public void export4(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_ZPLC);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工作计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }
    
    
    @RequestMapping("hr-doc-bmze-list")
    public String bmzelist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "hr/hr-bmze-list";
    }

   @RequestMapping("hr-doc-bmze-input")
    public String bmzeinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "hr/hr-bmze-input";
    }

    @RequestMapping("hr-doc-bmze-save")
    public String bmzesave(@ModelAttribute  XhfCommonDoc xhfCommonDoc,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
    	XhfCommonDoc dest =  null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }
        dest.setFmodule("hr");
        dest.setFtype(ConstValue.DOC_BMZZ);
        xhfCommonDocManager.save(dest);
      
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hr-doc-bmze-list.do";
    }

    @RequestMapping("hr-doc-bmze-remove")
    public String bmzeremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hr-doc-bmze-list.do";
    }

    @RequestMapping("hr-doc-bmze-export")
    public void bmzeexport(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        List<XhfCommonDoc> xhfCommonDocs = (List<XhfCommonDoc>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("工作计划");
        tableModel.addHeaders("fid", "ftitle");
        tableModel.setData(xhfCommonDocs);
        exportor.export(response, tableModel);
    }
    
    @RequestMapping("hr-doc-bmze-info")
    public String mbzrslist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "hr");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        return "hr/hr-bmze-info";
    }
    
    
    // ~ ======================================================================
    @Resource
    public void setxhfCommonDocManager(XhfCommonDocManager xhfCommonDocManager) {
        this.xhfCommonDocManager = xhfCommonDocManager;
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
