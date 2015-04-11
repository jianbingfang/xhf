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

import com.xthena.sckf.domain.JyTb;
import com.xthena.sckf.manager.JyTbManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyTbController {
    private JyTbManager jyTbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyTb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyTbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyTb-info-list";
    }

    @RequestMapping("jyTb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyTb jyTb = jyTbManager.get(id);
            model.addAttribute("model", jyTb);
        }

        return "sckf/jyTb-info-input";
    }

    @RequestMapping("jyTb-info-save")
    public String save(@ModelAttribute JyTb jyTb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyTb dest = null;

        Long id = jyTb.getFid();

        if (id != null) {
            dest = jyTbManager.get(id);
            beanMapper.copy(jyTb, dest);
        } else {
            dest = jyTb;
        }

        jyTbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyTb-info-list.do";
    }

    @RequestMapping("jyTb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyTb> jyTbs = jyTbManager.findByIds(selectedItem);

        jyTbManager.removeAll(jyTbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyTb-info-list.do";
    }

    @RequestMapping("jyTb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyTbManager.pagedQuery(page, propertyFilters);

        List<JyTb> jyTbs = (List<JyTb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyTb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyTbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyTbManager(JyTbManager jyTbManager) {
        this.jyTbManager = jyTbManager;
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
