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

import com.xthena.gcgl.domain.PjWj;
import com.xthena.gcgl.manager.PjWjManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjWjController {
    private PjWjManager pjWjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjWj-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWjManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjWj-info-list";
    }

    @RequestMapping("pjWj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjWj pjWj = pjWjManager.get(id);
            model.addAttribute("model", pjWj);
        }

        return "gcgl/pjWj-info-input";
    }

    @RequestMapping("pjWj-info-save")
    public String save(@ModelAttribute PjWj pjWj,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjWj dest = null;

        Long id = pjWj.getFid();

        if (id != null) {
            dest = pjWjManager.get(id);
            beanMapper.copy(pjWj, dest);
        } else {
            dest = pjWj;
        }

        pjWjManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjWj-info-list.do";
    }

    @RequestMapping("pjWj-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjWj> pjWjs = pjWjManager.findByIds(selectedItem);

        pjWjManager.removeAll(pjWjs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjWj-info-list.do";
    }

    @RequestMapping("pjWj-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjWjManager.pagedQuery(page, propertyFilters);

        List<PjWj> pjWjs = (List<PjWj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjWj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjWjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjWjManager(PjWjManager pjWjManager) {
        this.pjWjManager = pjWjManager;
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
