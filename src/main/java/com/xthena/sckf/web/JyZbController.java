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

import com.xthena.sckf.domain.JyZb;
import com.xthena.sckf.manager.JyZbManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyZbController {
    private JyZbManager jyZbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyZb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyZb-info-list";
    }

    @RequestMapping("jyZb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyZb jyZb = jyZbManager.get(id);
            model.addAttribute("model", jyZb);
        }

        return "sckf/jyZb-info-input";
    }

    @RequestMapping("jyZb-info-save")
    public String save(@ModelAttribute JyZb jyZb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyZb dest = null;

        Long id = jyZb.getFid();

        if (id != null) {
            dest = jyZbManager.get(id);
            beanMapper.copy(jyZb, dest);
        } else {
            dest = jyZb;
        }

        jyZbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyZb-info-list.do";
    }

    @RequestMapping("jyZb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyZb> jyZbs = jyZbManager.findByIds(selectedItem);

        jyZbManager.removeAll(jyZbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyZb-info-list.do";
    }

    @RequestMapping("jyZb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZbManager.pagedQuery(page, propertyFilters);

        List<JyZb> jyZbs = (List<JyZb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyZb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyZbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyZbManager(JyZbManager jyZbManager) {
        this.jyZbManager = jyZbManager;
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
