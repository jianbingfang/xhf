package  com.xthena.sckf.web;

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

import com.xthena.sckf.domain.JyKb;
import com.xthena.sckf.manager.JyKbManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyKbController {
    private JyKbManager jyKbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyKb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyKbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyKb-info-list";
    }

    @RequestMapping("jyKb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyKb jyKb = jyKbManager.get(id);
            model.addAttribute("model", jyKb);
        }

        return "sckf/jyKb-info-input";
    }

    @RequestMapping("jyKb-info-save")
    public String save(@ModelAttribute JyKb jyKb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyKb dest = null;

        Long id = jyKb.getFid();

        if (id != null) {
            dest = jyKbManager.get(id);
            beanMapper.copy(jyKb, dest);
        } else {
            dest = jyKb;
        }

        jyKbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyKb-info-list.do";
    }

    @RequestMapping("jyKb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyKb> jyKbs = jyKbManager.findByIds(selectedItem);

        jyKbManager.removeAll(jyKbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyKb-info-list.do";
    }

    @RequestMapping("jyKb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyKbManager.pagedQuery(page, propertyFilters);

        List<JyKb> jyKbs = (List<JyKb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyKb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyKbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyKbManager(JyKbManager jyKbManager) {
        this.jyKbManager = jyKbManager;
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
