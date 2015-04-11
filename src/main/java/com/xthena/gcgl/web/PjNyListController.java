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

import com.xthena.gcgl.domain.PjNyList;
import com.xthena.gcgl.manager.PjNyListManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjNyListController {
    private PjNyListManager pjNyListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjNyList-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjNyList-info-list";
    }

    @RequestMapping("pjNyList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjNyList pjNyList = pjNyListManager.get(id);
            model.addAttribute("model", pjNyList);
        }

        return "gcgl/pjNyList-info-input";
    }

    @RequestMapping("pjNyList-info-save")
    public String save(@ModelAttribute PjNyList pjNyList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjNyList dest = null;

        Long id = pjNyList.getFid();

        if (id != null) {
            dest = pjNyListManager.get(id);
            beanMapper.copy(pjNyList, dest);
        } else {
            dest = pjNyList;
        }

        pjNyListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjNyList-info-list.do";
    }

    @RequestMapping("pjNyList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjNyList> pjNyLists = pjNyListManager.findByIds(selectedItem);

        pjNyListManager.removeAll(pjNyLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjNyList-info-list.do";
    }

    @RequestMapping("pjNyList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjNyListManager.pagedQuery(page, propertyFilters);

        List<PjNyList> pjNyLists = (List<PjNyList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjNyList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjNyLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjNyListManager(PjNyListManager pjNyListManager) {
        this.pjNyListManager = pjNyListManager;
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
