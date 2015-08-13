package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjYb;
import com.xthena.gcgl.manager.PjYbManager;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.user.persistence.domain.UserBase;
import com.xthena.user.persistence.manager.UserBaseManager;
import com.xthena.util.CommRyMapUtil;
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
@RequestMapping("gcgl")
public class PjYbController {
    private PjYbManager pjYbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    private UserBaseManager userBaseManager;

    @RequestMapping("pjYb-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjYb-info-list";
    }

    @RequestMapping("pjYb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            PjYb pjYb = pjYbManager.get(id);
            model.addAttribute("model", pjYb);
        }

        return "gcgl/pjYb-info-input";
    }

    @RequestMapping("pjYb-info-save")
    public String save(@ModelAttribute PjYb pjYb,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        PjYb dest = null;

        Long id = pjYb.getFid();

        if (id != null) {
            dest = pjYbManager.get(id);
            beanMapper.copy(pjYb, dest);
        } else {
            dest = pjYb;
        }

                                     UserBase ub = userBaseManager.get(Long.valueOf(SpringSecurityUtils.getCurrentUserId()));
    if (ub != null) {
        dest.setFuploadry(ub.getFryid());
    }

    pjYbManager.save(dest);

    messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
            "保存成功");

    return "redirect:/gcgl/pjYb-info-list.do";
}

    @RequestMapping("pjYb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<PjYb> pjYbs = pjYbManager.findByIds(selectedItem);

        pjYbManager.removeAll(pjYbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjYb-info-list.do";
    }

    @RequestMapping("pjYb-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjYbManager.pagedQuery(page, propertyFilters);

        List<PjYb> pjYbs = (List<PjYb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjYb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjYbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjYbManager(PjYbManager pjYbManager) {
        this.pjYbManager = pjYbManager;
    }

    @Resource
    public void setUserBaseManager(UserBaseManager userBaseManager) {
        this.userBaseManager = userBaseManager;
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
