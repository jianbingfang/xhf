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

import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.manager.JlFujianManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("jl")
public class JlFujianController {
    private JlFujianManager jlFujianManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jlFujian-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlFujianManager.pagedQuery(page, propertyFilters);
        
        model.addAttribute("page", page);

        return "jl/jlFujian-info-list";
    } 

    @RequestMapping("jlFujian-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JlFujian jlFujian = jlFujianManager.get(id);
            model.addAttribute("model", jlFujian);
        }

        return "jl/jlFujian-info-input";
    }

    @RequestMapping("jlFujian-info-save")
    public String save(@ModelAttribute JlFujian jlFujian,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JlFujian dest = null;

        Long id = jlFujian.getFid();

        if (id != null) {
            dest = jlFujianManager.get(id);
            beanMapper.copy(jlFujian, dest);
        } else {
            dest = jlFujian;
        }

        jlFujianManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/jl/jlFujian-info-list.do";
    }

    @RequestMapping("jlFujian-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JlFujian> jlFujians = jlFujianManager.findByIds(selectedItem);

        jlFujianManager.removeAll(jlFujians);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/jl/jlFujian-info-list.do";
    }

    @RequestMapping("jlFujian-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jlFujianManager.pagedQuery(page, propertyFilters);

        List<JlFujian> jlFujians = (List<JlFujian>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jlFujian info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jlFujians);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJlFujianManager(JlFujianManager jlFujianManager) {
        this.jlFujianManager = jlFujianManager;
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
