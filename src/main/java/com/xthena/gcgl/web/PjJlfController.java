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
import com.xthena.util.PjXmMapUtil;
import com.xthena.gcgl.domain.PjJlf;
import com.xthena.gcgl.manager.PjJlfManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjJlfController {
    private PjJlfManager pjJlfManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjJlf-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjJlfManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "gcgl/pjJlf-info-list";
    }

    @RequestMapping("pjJlf-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjJlf pjJlf = pjJlfManager.get(id);
            model.addAttribute("model", pjJlf);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "gcgl/pjJlf-info-input";
    }

    @RequestMapping("pjJlf-info-save")
    public String save(@ModelAttribute PjJlf pjJlf,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjJlf dest = null;

        Long id = pjJlf.getFid();

        if (id != null) {
            dest = pjJlfManager.get(id);
            beanMapper.copy(pjJlf, dest);
        } else {
            dest = pjJlf;
        }

        pjJlfManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjJlf-info-list.do";
    }

    @RequestMapping("pjJlf-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjJlf> pjJlfs = pjJlfManager.findByIds(selectedItem);

        pjJlfManager.removeAll(pjJlfs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjJlf-info-list.do";
    }

    @RequestMapping("pjJlf-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjJlfManager.pagedQuery(page, propertyFilters);

        List<PjJlf> pjJlfs = (List<PjJlf>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjJlf info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjJlfs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjJlfManager(PjJlfManager pjJlfManager) {
        this.pjJlfManager = pjJlfManager;
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
