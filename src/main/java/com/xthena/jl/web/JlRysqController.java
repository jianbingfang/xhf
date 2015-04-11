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

import com.xthena.jl.domain.JlRysq;
import com.xthena.jl.manager.JlRysqManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlRysqController {
    private JlRysqManager jlRysqManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlRysq-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlRysqManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlRysq-info-list";
    }

    @RequestMapping("jlRysq-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlRysq jlRysq = jlRysqManager.get(id);
            model.addAttribute("model", jlRysq);
        }

        return "jl/jlRysq-info-input";
    }

    @RequestMapping("jlRysq-info-save")
    public String save(@ModelAttribute JlRysq jlRysq,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlRysq dest = null;

        Long id = jlRysq.getFid();

        if (id != null) {
            dest = jlRysqManager.get(id);
            beanMapper.copy(jlRysq, dest);
        } else {
            dest = jlRysq;
        }

        jlRysqManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlRysq-info-list.do";
    }

    @RequestMapping("jlRysq-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlRysq> jlRysqs = jlRysqManager.findByIds(selectedItem);

        jlRysqManager.removeAll(jlRysqs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlRysq-info-list.do";
    }

    @RequestMapping("jlRysq-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlRysqManager.pagedQuery(page, propertyFilters);

        List<JlRysq> jlRysqs = (List<JlRysq>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlRysq info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlRysqs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlRysqManager(JlRysqManager jlRysqManager) {
        this.jlRysqManager = jlRysqManager;
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
