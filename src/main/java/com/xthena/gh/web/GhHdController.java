package com.xthena.gh.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.dzb.domain.Hd;
import com.xthena.dzb.manager.HdManager;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("gh")
public class GhHdController {
    @Autowired
    private HdManager hdManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("gh-hd-info-list")
    public String list(@ModelAttribute Page page, @RequestParam(value = "ftype", required = false) String ftype,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fmemo2", ftype);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hdManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        switch (ftype) {
            case "1":
                return "gh/hd-info-list";
            case "2":
                return "gh/hd-ghfl-info-list";
            case "3":
                return "gh/hd-wthd-info-list";
            case "4":
                return "gh/hd-knzgyz-info-list";
            default:
                break;
        }

        return "gh/hd-info-list";
    }

    @RequestMapping("gh-hd-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "ftype", required = false) String ftype,
                        Model model) {
        if (id != null) {
            Hd hd = hdManager.get(id);
            model.addAttribute("model", hd);
        }
        switch (ftype) {
            case "1":
                return "gh/hd-info-input";
            case "2":
                return "gh/hd-ghfl-info-input";
            case "3":
                return "gh/hd-wthd-info-input";
            case "4":
                return "gh/hd-knzgyz-info-input";
            default:
                break;
        }
        return "gh/hd-info-input";
    }

    @RequestMapping("gh-hd-info-save")
    public String save(@ModelAttribute Hd hd, @RequestParam(value = "ftype", required = false) String ftype,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        Hd dest = null;

        Long id = hd.getFid();

        if (id != null) {
            dest = hdManager.get(id);
            beanMapper.copy(hd, dest);
        } else {
            dest = hd;
        }

        hdManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gh/gh-hd-info-list.do?ftype=" + ftype;
    }

    @RequestMapping("gh-hd-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem, @RequestParam(value = "ftype", required = false) String ftype,
                         RedirectAttributes redirectAttributes) {
        List<Hd> hds = hdManager.findByIds(selectedItem);

        hdManager.removeAll(hds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gh/gh-hd-info-list.do?ftype=" + ftype;
    }

    @RequestMapping("gh-hd-info-export")
    public void export(@ModelAttribute Page page, @RequestParam(value = "ftype", required = false) String ftype,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hdManager.pagedQuery(page, propertyFilters);

        List<Hd> hds = (List<Hd>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hd info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hds);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHdManager(HdManager hdManager) {
        this.hdManager = hdManager;
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
