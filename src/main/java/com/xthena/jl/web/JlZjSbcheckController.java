package  com.xthena.jl.web;

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

import com.xthena.jl.domain.JlZjSbcheck;
import com.xthena.jl.manager.JlZjSbcheckManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjSbcheckController {
    private JlZjSbcheckManager jlZjSbcheckManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlZjSbcheck-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjSbcheckManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjSbcheck-info-list";
    }

    @RequestMapping("jlZjSbcheck-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjSbcheck jlZjSbcheck = jlZjSbcheckManager.get(id);
            model.addAttribute("model", jlZjSbcheck);
        }

        return "jl/jlZjSbcheck-info-input";
    }

    @RequestMapping("jlZjSbcheck-info-save")
    public String save(@ModelAttribute JlZjSbcheck jlZjSbcheck,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlZjSbcheck dest = null;

        Long id = jlZjSbcheck.getFid();

        if (id != null) {
            dest = jlZjSbcheckManager.get(id);
            beanMapper.copy(jlZjSbcheck, dest);
        } else {
            dest = jlZjSbcheck;
        }

        jlZjSbcheckManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjSbcheck-info-list.do";
    }

    @RequestMapping("jlZjSbcheck-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjSbcheck> jlZjSbchecks = jlZjSbcheckManager.findByIds(selectedItem);

        jlZjSbcheckManager.removeAll(jlZjSbchecks);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjSbcheck-info-list.do";
    }

    @RequestMapping("jlZjSbcheck-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjSbcheckManager.pagedQuery(page, propertyFilters);

        List<JlZjSbcheck> jlZjSbchecks = (List<JlZjSbcheck>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjSbcheck info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjSbchecks);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjSbcheckManager(JlZjSbcheckManager jlZjSbcheckManager) {
        this.jlZjSbcheckManager = jlZjSbcheckManager;
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
