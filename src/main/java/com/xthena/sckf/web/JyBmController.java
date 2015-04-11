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

import com.xthena.sckf.domain.JyBm;
import com.xthena.sckf.manager.JyBmManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyBmController {
    private JyBmManager jyBmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyBm-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyBmManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyBm-info-list";
    }

    @RequestMapping("jyBm-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyBm jyBm = jyBmManager.get(id);
            model.addAttribute("model", jyBm);
        }

        return "sckf/jyBm-info-input";
    }

    @RequestMapping("jyBm-info-save")
    public String save(@ModelAttribute JyBm jyBm,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyBm dest = null;

        Long id = jyBm.getFid();

        if (id != null) {
            dest = jyBmManager.get(id);
            beanMapper.copy(jyBm, dest);
        } else {
            dest = jyBm;
        }

        jyBmManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyBm-info-list.do";
    }

    @RequestMapping("jyBm-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyBm> jyBms = jyBmManager.findByIds(selectedItem);

        jyBmManager.removeAll(jyBms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyBm-info-list.do";
    }

    @RequestMapping("jyBm-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyBmManager.pagedQuery(page, propertyFilters);

        List<JyBm> jyBms = (List<JyBm>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyBm info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyBms);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyBmManager(JyBmManager jyBmManager) {
        this.jyBmManager = jyBmManager;
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
