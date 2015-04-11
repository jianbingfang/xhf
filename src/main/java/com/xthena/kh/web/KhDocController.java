package com.xthena.kh.web;

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
@RequestMapping("kh")
public class KhDocController {
   
	private XhfCommonDocManager xhfCommonDocManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    
  // ==============================================================================
    
    @RequestMapping("kh-doc-cbhs-list")
    public String listcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_CBHS);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "kh/kh-doc-cbhs-list";
    }

   @RequestMapping("kh-doc-cbhs-input")
    public String inputcbhs(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-doc-cbhs-input";
    }

    @RequestMapping("kh-doc-cbhs-save")
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

        return "redirect:/kh/kh-doc-cbhs-list.do";
    }

    @RequestMapping("kh-doc-cbhs-remove")
    public String removecbhs(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-cbhs-list.do";
    }

    @RequestMapping("kh-doc-cbhs-export")
    public void exportcbhs(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
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
    
    @RequestMapping("kh-doc-gzzj-list")
    public String listgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZZJ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "kh/kh-doc-gzzj-list";
    }

   @RequestMapping("kh-doc-gzzj-input")
    public String inputgzzj(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-doc-gzzj-input";
    }

    @RequestMapping("kh-doc-gzzj-save")
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

        return "redirect:/kh/kh-doc-gzzj-list.do";
    }

    @RequestMapping("kh-doc-gzzj-remove")
    public String removegzzj(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-gzzj-list.do";
    }

    @RequestMapping("kh-doc-gzzj-export")
    public void exportgzzj(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
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
    
    @RequestMapping("kh-doc-glzd-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "kh/kh-doc-glzd-list";
    }

   @RequestMapping("kh-doc-glzd-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-doc-glzd-input";
    }

    @RequestMapping("kh-doc-glzd-save")
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

        return "redirect:/kh/kh-doc-glzd-list.do";
    }

    @RequestMapping("kh-doc-glzd-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-glzd-list.do";
    }

    @RequestMapping("kh-doc-glzd-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 1);
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


    
    @RequestMapping("kh-doc-bmze-info")
    public String mbzrslist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        return "kh/kh-bmze-info";
    }
    
    @RequestMapping("kh-doc-bmze-list")
    public String bmzelist(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "kh/kh-bmze-list";
    }
    
    
    
    @RequestMapping("kh-doc-bmze-input")
    public String bmzeinput(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-bmze-input";
    }

    @RequestMapping("kh-doc-bmze-save")
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
        dest.setFmodule("kh");
        dest.setFtype(ConstValue.DOC_BMZZ);
        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/kh/kh-doc-bmze-list.do";
    }

    @RequestMapping("kh-doc-bmze-remove")
    public String bmzeremove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-bmze-list.do";
    }

    
    @RequestMapping("kh-doc-gzlc-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<XhfCommonDoc> xhfCommonDocs=xhfCommonDocManager.find(propertyFilters);
        if(!xhfCommonDocs.isEmpty()){
        	model.addAttribute("modal", xhfCommonDocs.get(0));
        }
        return "kh/kh-doc-gzlc-list";
    }

   @RequestMapping("kh-doc-gzlc-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-doc-gzlc-input";
    }

    @RequestMapping("kh-doc-gzlc-save")
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

        return "redirect:/kh/kh-doc-gzlc-list.do";
    }

    @RequestMapping("kh-doc-gzlc-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-gzlc-list.do";
    }

    @RequestMapping("kh-doc-gzlc-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 2);
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
    
    
    
    @RequestMapping("kh-doc-khbf-list")
    public String list5(@ModelAttribute Page page,@RequestParam(value = "khtype", required = false) String khtype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_KHBF);
    	parameterMap.put("filter_EQS_fmemo2", khtype);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<XhfCommonDoc> xhfCommonDocs=xhfCommonDocManager.find(propertyFilters);
        if(!xhfCommonDocs.isEmpty()){
        	model.addAttribute("modal", xhfCommonDocs.get(0));
        }
        model.addAttribute("khtype", khtype);
        return "kh/kh-doc-khbf-list";
    }

   @RequestMapping("kh-doc-khbf-input")
    public String input5(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "khtype", required = false) String khtype,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }
        model.addAttribute("khtype", khtype);
        return "kh/kh-doc-khbf-input";
    }

    @RequestMapping("kh-doc-khbf-save")
    public String save5(@ModelAttribute  XhfCommonDoc xhfCommonDoc,@RequestParam(value = "khtype", required = false) String khtype,
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
        dest.setFmemo2(khtype);
        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/kh/kh-doc-khbf-list.do?khtype="+khtype;
    }

    @RequestMapping("kh-doc-khbf-remove")
    public String remove5(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-khbf-list.do";
    }

    @RequestMapping("kh-doc-khbf-export")
    public void export5(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 2);
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
    
    
    
    
    
    
    
    
    
    @RequestMapping("kh-doc-jlzd-list")
    public String listjlzd(@ModelAttribute Page page,@RequestParam(value = "khtype", required = false) String khtype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", ConstValue.DOC_JLZD);
    	parameterMap.put("filter_EQS_fmemo2", khtype);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<XhfCommonDoc> xhfCommonDocs=xhfCommonDocManager.find(propertyFilters);
        if(!xhfCommonDocs.isEmpty()){
        	model.addAttribute("modal", xhfCommonDocs.get(0));
        }
        model.addAttribute("khtype", khtype);
        return "kh/kh-doc-jlzd-list";
    }

   @RequestMapping("kh-doc-jlzd-input")
    public String inputjlzd(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "khtype", required = false) String khtype,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }
        model.addAttribute("khtype", khtype);
        return "kh/kh-doc-jlzd-input";
    }

    @RequestMapping("kh-doc-jlzd-save")
    public String savejlzd(@ModelAttribute  XhfCommonDoc xhfCommonDoc,@RequestParam(value = "khtype", required = false) String khtype,
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
        dest.setFmemo2(khtype);
        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/kh/kh-doc-jlzd-list.do?khtype="+khtype;
    }

    @RequestMapping("kh-doc-jlzd-remove")
    public String removejlzd(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-jlzd-list.do";
    }

    @RequestMapping("kh-doc-jlzd-export")
    public void exportjlzd(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 12);
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @RequestMapping("kh-doc-xctx-list")
    public String list3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	parameterMap.put("filter_EQS_fmodule", "kh");
    	parameterMap.put("filter_EQI_ftype", 3);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);
        return "kh/kh-doc-xctx-list";
    }

   @RequestMapping("kh-doc-xctx-input")
    public String input3(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
        	XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "kh/kh-doc-xctx-input";
    }

    @RequestMapping("kh-doc-xctx-save")
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

        return "redirect:/kh/kh-doc-xctx-list.do";
    }

    @RequestMapping("kh-doc-xctx-remove")
    public String remove3(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/kh/kh-doc-xctx-list.do";
    }

    @RequestMapping("kh-doc-xctx-export")
    public void export3(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
    	parameterMap.put("filter_EQS_fmodule", "kh");
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
