package  com.xthena.gcgl.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.gcgl.domain.PjMbzrs;
import com.xthena.gcgl.manager.PjMbzrsManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjMbzrsController {
    private PjMbzrsManager pjMbzrsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjMbzrs-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjMbzrsManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjMbzrs-info-list";
    }

    @RequestMapping("pjMbzrs-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjMbzrs pjMbzrs = pjMbzrsManager.get(id);
            model.addAttribute("model", pjMbzrs);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
    	model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "gcgl/pjMbzrs-info-input";
    }

    @RequestMapping("pjMbzrs-info-save")
    public String save(@ModelAttribute PjMbzrs pjMbzrs,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjMbzrs dest = null;

        Long id = pjMbzrs.getFid();

        if (id != null) {
            dest = pjMbzrsManager.get(id);
            beanMapper.copy(pjMbzrs, dest);
        } else {
            dest = pjMbzrs;
        }

        pjMbzrsManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjMbzrs-info-list.do";
    }

    @RequestMapping("pjMbzrs-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjMbzrs> pjMbzrss = pjMbzrsManager.findByIds(selectedItem);

        pjMbzrsManager.removeAll(pjMbzrss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjMbzrs-info-list.do";
    }

    @RequestMapping("pjMbzrs-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjMbzrsManager.pagedQuery(page, propertyFilters);

        List<PjMbzrs> pjMbzrss = (List<PjMbzrs>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjMbzrs info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjMbzrss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjMbzrsManager(PjMbzrsManager pjMbzrsManager) {
        this.pjMbzrsManager = pjMbzrsManager;
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
