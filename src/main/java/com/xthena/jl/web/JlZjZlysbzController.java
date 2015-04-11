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

import com.xthena.jl.domain.JlZjZlysbz;
import com.xthena.jl.manager.JlZjZlysbzManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlZjZlysbzController {
    private JlZjZlysbzManager jlZjZlysbzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlZjZlysbz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjZlysbzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "jl/jlZjZlysbz-info-list";
    }

    @RequestMapping("jlZjZlysbz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlZjZlysbz jlZjZlysbz = jlZjZlysbzManager.get(id);
            model.addAttribute("model", jlZjZlysbz);
        }

        return "jl/jlZjZlysbz-info-input";
    }

    @RequestMapping("jlZjZlysbz-info-save")
    public String save(@ModelAttribute JlZjZlysbz jlZjZlysbz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlZjZlysbz dest = null;

        Long id = jlZjZlysbz.getFid();

        if (id != null) {
            dest = jlZjZlysbzManager.get(id);
            beanMapper.copy(jlZjZlysbz, dest);
        } else {
            dest = jlZjZlysbz;
        }

        jlZjZlysbzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlZjZlysbz-info-list.do";
    }

    @RequestMapping("jlZjZlysbz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlZjZlysbz> jlZjZlysbzs = jlZjZlysbzManager.findByIds(selectedItem);

        jlZjZlysbzManager.removeAll(jlZjZlysbzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlZjZlysbz-info-list.do";
    }

    @RequestMapping("jlZjZlysbz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlZjZlysbzManager.pagedQuery(page, propertyFilters);

        List<JlZjZlysbz> jlZjZlysbzs = (List<JlZjZlysbz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlZjZlysbz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlZjZlysbzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlZjZlysbzManager(JlZjZlysbzManager jlZjZlysbzManager) {
        this.jlZjZlysbzManager = jlZjZlysbzManager;
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
