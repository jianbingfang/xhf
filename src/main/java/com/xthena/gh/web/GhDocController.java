package com.xthena.gh.web;

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
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.ConstValue;

@Controller
@RequestMapping("gh")
public class GhDocController {
   
	private XhfCommonDocManager xhfCommonDocManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    
  // ==============================================================================
    
    @RequestMapping("gh-doc-cbhs-list")
    public String listcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_CBHS);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "gh/gh-doc-cbhs-list";
    }

   @RequestMapping("gh-doc-cbhs-input")
    public String inputcbhs(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "gh/gh-doc-cbhs-input";
    }

    @RequestMapping("gh-doc-cbhs-save")
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

        return "redirect:/gh/gh-doc-cbhs-list.do";
    }

    @RequestMapping("gh-doc-cbhs-remove")
    public String removecbhs(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-cbhs-list.do";
    }

    @RequestMapping("gh-doc-cbhs-export")
    public void exportcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
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
    @RequestMapping("gh-doc-gzzj-list")
    public String listgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZZJ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "gh/gh-doc-gzzj-list";
    }

   @RequestMapping("gh-doc-gzzj-input")
    public String inputgzzj(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "gh/gh-doc-gzzj-input";
    }

    @RequestMapping("gh-doc-gzzj-save")
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

        return "redirect:/gh/gh-doc-gzzj-list.do";
    }

    @RequestMapping("gh-doc-gzzj-remove")
    public String removegzzj(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-gzzj-list.do";
    }

    @RequestMapping("gh-doc-gzzj-export")
    public void exportgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
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
    
    @RequestMapping("gh-doc-glzd-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GLZD);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "gh/gh-doc-glzd-list";
    }

   @RequestMapping("gh-doc-glzd-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "gh/gh-doc-glzd-input";
    }

    @RequestMapping("gh-doc-glzd-save")
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

        return "redirect:/gh/gh-doc-glzd-list.do";
    }

    @RequestMapping("gh-doc-glzd-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-glzd-list.do";
    }

    @RequestMapping("gh-doc-glzd-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype",ConstValue.DOC_GLZD);
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

    
    @RequestMapping("gh-doc-gzlc-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZLC);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);
        return "gh/gh-doc-gzlc-list";
    }

   @RequestMapping("gh-doc-gzlc-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "gh/gh-doc-gzlc-input";
    }

    @RequestMapping("gh-doc-gzlc-save")
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
        dest.setFmodule("gh");
        dest.setFtype(ConstValue.DOC_GZLC);
        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gh/gh-doc-gzlc-list.do";
    }

    @RequestMapping("gh-doc-gzlc-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-gzlc-list.do";
    }

    @RequestMapping("gh-doc-gzlc-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZLC);
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
    
    @RequestMapping("gh-doc-xctx-list")
    public String list3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", 3);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "gh/gh-doc-xctx-list";
    }

   @RequestMapping("gh-doc-xctx-input")
    public String input3(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "gh/gh-doc-xctx-input";
    }

    @RequestMapping("gh-doc-xctx-save")
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

        return "redirect:/gh/gh-doc-xctx-list.do";
    }

    @RequestMapping("gh-doc-xctx-remove")
    public String remove3(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-xctx-list.do";
    }

    @RequestMapping("gh-doc-xctx-export")
    public void export3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", 3);
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
    
    
    @RequestMapping("gh-doc-bmze-list")
    public String bmzelist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "gh/gh-bmze-list";
    }

   @RequestMapping("gh-doc-bmze-input")
    public String bmzeinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "gh/gh-bmze-input";
    }

    @RequestMapping("gh-doc-bmze-save")
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
        dest.setFmodule("gh");
        dest.setFtype(ConstValue.DOC_BMZZ);
        xhfCommonDocManager.save(dest);
      
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gh/gh-doc-bmze-list.do";
    }

    @RequestMapping("gh-doc-bmze-remove")
    public String bmzeremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-doc-bmze-list.do";
    }

    @RequestMapping("gh-doc-bmze-export")
    public void bmzeexport(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "gh");
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
    
    @RequestMapping("gh-doc-bmze-info")
    public String mbzrslist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "gh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        return "gh/gh-bmze-info";
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
