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

import com.xthena.jl.domain.JlZjPay;
import com.xthena.jl.manager.JlZjPayManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjPayController {
    private JlZjPayManager jlZjPayManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlZjPay-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjPayManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjPay-info-list";
    }

    @RequestMapping("jlZjPay-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjPay jlZjPay = jlZjPayManager.get(id);
            model.addAttribute("model", jlZjPay);
        }

        return "jl/jlZjPay-info-input";
    }

    @RequestMapping("jlZjPay-info-save")
    public String save(@ModelAttribute JlZjPay jlZjPay,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlZjPay dest = null;

        Long id = jlZjPay.getFid();

        if (id != null) {
            dest = jlZjPayManager.get(id);
            beanMapper.copy(jlZjPay, dest);
        } else {
            dest = jlZjPay;
        }

        jlZjPayManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjPay-info-list.do";
    }

    @RequestMapping("jlZjPay-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjPay> jlZjPays = jlZjPayManager.findByIds(selectedItem);

        jlZjPayManager.removeAll(jlZjPays);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjPay-info-list.do";
    }

    @RequestMapping("jlZjPay-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjPayManager.pagedQuery(page, propertyFilters);

        List<JlZjPay> jlZjPays = (List<JlZjPay>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjPay info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjPays);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjPayManager(JlZjPayManager jlZjPayManager) {
        this.jlZjPayManager = jlZjPayManager;
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
