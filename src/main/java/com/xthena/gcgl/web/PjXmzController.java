package  com.xthena.gcgl.web;

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

import com.xthena.gcgl.domain.PjXmz;
import com.xthena.gcgl.manager.PjXmzManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjXmzController {
    private PjXmzManager pjXmzManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjXmz-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmzManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjXmz-info-list";
    }

    @RequestMapping("pjXmz-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjXmz pjXmz = pjXmzManager.get(id);
            model.addAttribute("model", pjXmz);
        }

        return "gcgl/pjXmz-info-input";
    }

    @RequestMapping("pjXmz-info-save")
    public String save(@ModelAttribute PjXmz pjXmz,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjXmz dest = null;

        Long id = pjXmz.getFid();

        if (id != null) {
            dest = pjXmzManager.get(id);
            beanMapper.copy(pjXmz, dest);
        } else {
            dest = pjXmz;
        }

        pjXmzManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjXmz-info-list.do";
    }

    @RequestMapping("pjXmz-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjXmz> pjXmzs = pjXmzManager.findByIds(selectedItem);

        pjXmzManager.removeAll(pjXmzs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjXmz-info-list.do";
    }

    @RequestMapping("pjXmz-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjXmzManager.pagedQuery(page, propertyFilters);

        List<PjXmz> pjXmzs = (List<PjXmz>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjXmz info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjXmzs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjXmzManager(PjXmzManager pjXmzManager) {
        this.pjXmzManager = pjXmzManager;
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
