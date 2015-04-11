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

import com.xthena.jl.domain.JlZjSgfasb;
import com.xthena.jl.manager.JlZjSgfasbManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjSgfasbController {
    private JlZjSgfasbManager jlZjSgfasbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlZjSgfasb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjSgfasbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjSgfasb-info-list";
    }

    @RequestMapping("jlZjSgfasb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjSgfasb jlZjSgfasb = jlZjSgfasbManager.get(id);
            model.addAttribute("model", jlZjSgfasb);
        }

        return "jl/jlZjSgfasb-info-input";
    }

    @RequestMapping("jlZjSgfasb-info-save")
    public String save(@ModelAttribute JlZjSgfasb jlZjSgfasb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlZjSgfasb dest = null;

        Long id = jlZjSgfasb.getFid();

        if (id != null) {
            dest = jlZjSgfasbManager.get(id);
            beanMapper.copy(jlZjSgfasb, dest);
        } else {
            dest = jlZjSgfasb;
        }

        jlZjSgfasbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjSgfasb-info-list.do";
    }

    @RequestMapping("jlZjSgfasb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjSgfasb> jlZjSgfasbs = jlZjSgfasbManager.findByIds(selectedItem);

        jlZjSgfasbManager.removeAll(jlZjSgfasbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjSgfasb-info-list.do";
    }

    @RequestMapping("jlZjSgfasb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjSgfasbManager.pagedQuery(page, propertyFilters);

        List<JlZjSgfasb> jlZjSgfasbs = (List<JlZjSgfasb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjSgfasb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjSgfasbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjSgfasbManager(JlZjSgfasbManager jlZjSgfasbManager) {
        this.jlZjSgfasbManager = jlZjSgfasbManager;
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
