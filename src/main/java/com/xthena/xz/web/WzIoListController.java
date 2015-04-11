package  com.xthena.xz.web;

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

import com.xthena.xz.domain.WzIoList;
import com.xthena.xz.manager.WzIoListManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class WzIoListController {
    private WzIoListManager wzIoListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("wzIoList-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzIoListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/wzIoList-info-list";
    }

    @RequestMapping("wzIoList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            WzIoList wzIoList = wzIoListManager.get(id);
            model.addAttribute("model", wzIoList);
        }

        return "xz/wzIoList-info-input";
    }

    @RequestMapping("wzIoList-info-save")
    public String save(@ModelAttribute WzIoList wzIoList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        WzIoList dest = null;

        Long id = wzIoList.getFid();

        if (id != null) {
            dest = wzIoListManager.get(id);
            beanMapper.copy(wzIoList, dest);
        } else {
            dest = wzIoList;
        }

        wzIoListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzIoList-info-list.do";
    }

    @RequestMapping("wzIoList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<WzIoList> wzIoLists = wzIoListManager.findByIds(selectedItem);

        wzIoListManager.removeAll(wzIoLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzIoList-info-list.do";
    }

    @RequestMapping("wzIoList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzIoListManager.pagedQuery(page, propertyFilters);

        List<WzIoList> wzIoLists = (List<WzIoList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("wzIoList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(wzIoLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzIoListManager(WzIoListManager wzIoListManager) {
        this.wzIoListManager = wzIoListManager;
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
