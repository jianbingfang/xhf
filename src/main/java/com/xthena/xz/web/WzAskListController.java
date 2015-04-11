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

import com.xthena.xz.domain.WzAskList;
import com.xthena.xz.manager.WzAskListManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("xz")
public class WzAskListController {
    private WzAskListManager wzAskListManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("wzAskList-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzAskListManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "xz/wzAskList-info-list";
    }

    @RequestMapping("wzAskList-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            WzAskList wzAskList = wzAskListManager.get(id);
            model.addAttribute("model", wzAskList);
        }

        return "xz/wzAskList-info-input";
    }

    @RequestMapping("wzAskList-info-save")
    public String save(@ModelAttribute WzAskList wzAskList,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        WzAskList dest = null;

        Long id = wzAskList.getFid();

        if (id != null) {
            dest = wzAskListManager.get(id);
            beanMapper.copy(wzAskList, dest);
        } else {
            dest = wzAskList;
        }

        wzAskListManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/wzAskList-info-list.do";
    }

    @RequestMapping("wzAskList-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<WzAskList> wzAskLists = wzAskListManager.findByIds(selectedItem);

        wzAskListManager.removeAll(wzAskLists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/wzAskList-info-list.do";
    }

    @RequestMapping("wzAskList-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = wzAskListManager.pagedQuery(page, propertyFilters);

        List<WzAskList> wzAskLists = (List<WzAskList>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("wzAskList info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(wzAskLists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setWzAskListManager(WzAskListManager wzAskListManager) {
        this.wzAskListManager = wzAskListManager;
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
