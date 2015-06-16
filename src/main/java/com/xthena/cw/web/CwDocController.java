package com.xthena.cw.web;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("cw")
public class CwDocController {

    private XhfCommonDocManager xhfCommonDocManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("cw-doc-bmze-info")
    public String mbzrslist(@ModelAttribute Page page,
                            @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        return "cw/cw-bmze-info";
    }

    @RequestMapping("cw-doc-bmze-list")
    public String bmzelist(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-bmze-list";
    }

    @RequestMapping("cw-doc-bmze-input")
    public String bmzeinput(@RequestParam(value = "id", required = false) Long id,
                            Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-bmze-input";
    }

    @RequestMapping("cw-doc-bmze-save")
    public String bmzesave(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                           @RequestParam Map<String, Object> parameterMap,
                           RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

        Long id = xhfCommonDoc.getFid();

        if (id != null) {
            dest = xhfCommonDocManager.get(id);
            beanMapper.copy(xhfCommonDoc, dest);
        } else {
            dest = xhfCommonDoc;
        }
        dest.setFtype(ConstValue.DOC_BMZZ);
        dest.setFmodule("cw");
        xhfCommonDocManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cw-doc-bmze-list.do";
    }

    @RequestMapping("cw-doc-bmze-remove")
    public String bmzeremove(@RequestParam("selectedItem") List<Long> selectedItem,
                             RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-bmze-list.do";
    }

    @RequestMapping("cw-doc-bmze-export")
    public void bmzeexport(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap,
                           HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_BMZZ);
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


    @RequestMapping("cw-doc-glzd-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", 1);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-doc-glzd-list";
    }

    @RequestMapping("cw-doc-glzd-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-doc-glzd-input";
    }

    @RequestMapping("cw-doc-glzd-save")
    public String save(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

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

        return "redirect:/cw/cw-doc-glzd-list.do";
    }

    @RequestMapping("cw-doc-glzd-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-glzd-list.do";
    }

    @RequestMapping("cw-doc-glzd-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
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


    // ==============================================================================

    @RequestMapping("cw-doc-cbhs-list")
    public String listcbhs(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_CBHS);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-doc-cbhs-list";
    }

    @RequestMapping("cw-doc-cbhs-input")
    public String inputcbhs(@RequestParam(value = "id", required = false) Long id,
                            Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-doc-cbhs-input";
    }

    @RequestMapping("cw-doc-cbhs-save")
    public String savecbhs(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                           @RequestParam Map<String, Object> parameterMap,
                           RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

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

        return "redirect:/cw/cw-doc-cbhs-list.do";
    }

    @RequestMapping("cw-doc-cbhs-remove")
    public String removecbhs(@RequestParam("selectedItem") List<Long> selectedItem,
                             RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-cbhs-list.do";
    }

    @RequestMapping("cw-doc-cbhs-export")
    public void exportcbhs(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap,
                           HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_CBHS);
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


    // ==============================================================================

    @RequestMapping("cw-doc-gzzj-list")
    public String listgzzj(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZZJ);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-doc-gzzj-list";
    }

    @RequestMapping("cw-doc-gzzj-input")
    public String inputgzzj(@RequestParam(value = "id", required = false) Long id,
                            Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-doc-gzzj-input";
    }

    @RequestMapping("cw-doc-gzzj-save")
    public String savegzzj(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                           @RequestParam Map<String, Object> parameterMap,
                           RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

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

        return "redirect:/cw/cw-doc-gzzj-list.do";
    }

    @RequestMapping("cw-doc-gzzj-remove")
    public String removegzzj(@RequestParam("selectedItem") List<Long> selectedItem,
                             RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-gzzj-list.do";
    }

    @RequestMapping("cw-doc-gzzj-export")
    public void exportgzzj(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap,
                           HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", ConstValue.DOC_GZZJ);
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


    @RequestMapping("cw-doc-gzlc-list")
    public String list2(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", 2);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-doc-gzlc-list";
    }

    @RequestMapping("cw-doc-gzlc-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
                         Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-doc-gzlc-input";
    }

    @RequestMapping("cw-doc-gzlc-save")
    public String save2(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                        @RequestParam Map<String, Object> parameterMap,
                        RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

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

        return "redirect:/cw/cw-doc-gzlc-list.do";
    }

    @RequestMapping("cw-doc-gzlc-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
                          RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-gzlc-list.do";
    }

    @RequestMapping("cw-doc-gzlc-export")
    public void export2(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap,
                        HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
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

    @RequestMapping("cw-doc-xctx-list")
    public String list3(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmodule", "cw");
        parameterMap.put("filter_EQI_ftype", 3);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xhfCommonDocManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        return "cw/cw-doc-xctx-list";
    }

    @RequestMapping("cw-doc-xctx-input")
    public String input3(@RequestParam(value = "id", required = false) Long id,
                         Model model) {
        if (id != null) {
            XhfCommonDoc xhfCommonPlain = xhfCommonDocManager.get(id);
            model.addAttribute("model", xhfCommonPlain);
        }

        return "cw/cw-doc-xctx-input";
    }

    @RequestMapping("cw-doc-xctx-save")
    public String save3(@ModelAttribute XhfCommonDoc xhfCommonDoc,
                        @RequestParam Map<String, Object> parameterMap,
                        RedirectAttributes redirectAttributes) {
        XhfCommonDoc dest = null;

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

        return "redirect:/cw/cw-doc-xctx-list.do";
    }

    @RequestMapping("cw-doc-xctx-remove")
    public String remove3(@RequestParam("selectedItem") List<Long> selectedItem,
                          RedirectAttributes redirectAttributes) {
        List<XhfCommonDoc> xhfCommonDocs = xhfCommonDocManager.findByIds(selectedItem);

        xhfCommonDocManager.removeAll(xhfCommonDocs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-doc-xctx-list.do";
    }

    @RequestMapping("cw-doc-xctx-export")
    public void export3(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap,
                        HttpServletResponse response) throws Exception {
        parameterMap.put("filter_EQS_fmodule", "cw");
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
