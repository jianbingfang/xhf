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

import com.xthena.gcgl.domain.PjFirstList;
import com.xthena.gcgl.manager.PjFirstListManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("gcgl")
public class PjFirstListController {
    private PjFirstListManager pjFirstListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("pjFirstList-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjFirstListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjFirstList-info-list";
    }

    @RequestMapping("pjFirstList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            PjFirstList pjFirstList = pjFirstListManager.get(id);
            model.addAttribute("model", pjFirstList);
        }

        return "gcgl/pjFirstList-info-input";
    }

    @RequestMapping("pjFirstList-info-save")
    public String save(@ModelAttribute PjFirstList pjFirstList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        PjFirstList dest = null;

        Long id = pjFirstList.getFid();

        if (id != null) {
            dest = pjFirstListManager.get(id);
            beanMapper.copy(pjFirstList, dest);
        } else {
            dest = pjFirstList;
        }

        pjFirstListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjFirstList-info-list.do";
    }

    @RequestMapping("pjFirstList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<PjFirstList> pjFirstLists = pjFirstListManager.findByIds(selectedItem);

        pjFirstListManager.removeAll(pjFirstLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjFirstList-info-list.do";
    }

    @RequestMapping("pjFirstList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjFirstListManager.pagedQuery(page, propertyFilters);

        List<PjFirstList> pjFirstLists = (List<PjFirstList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjFirstList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjFirstLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjFirstListManager(PjFirstListManager pjFirstListManager) {
        this.pjFirstListManager = pjFirstListManager;
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
