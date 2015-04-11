package  com.xthena.common.web;

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

import com.xthena.common.domain.CommCfildsType;
import com.xthena.common.manager.CommCfildsTypeManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("comm")
public class CommCfildsTypeController {
    private CommCfildsTypeManager commcfildsTypeManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("commcfildsType-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commcfildsTypeManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commcfildsType-info-list";
    }

    @RequestMapping("commcfildsType-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommCfildsType commcfildsType = commcfildsTypeManager.get(id);
            model.addAttribute("model", commcfildsType);
        }

        return "comm/commcfildsType-info-input";
    }

    @RequestMapping("commcfildsType-info-save")
    public String save(@ModelAttribute CommCfildsType commcfildsType,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommCfildsType dest = null;

        Long id = commcfildsType.getFid();

        if (id != null) {
            dest = commcfildsTypeManager.get(id);
            beanMapper.copy(commcfildsType, dest);
        } else {
            dest = commcfildsType;
        }

        commcfildsTypeManager.saveAndInit(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commcfildsType-info-list.do";
    }

    @RequestMapping("commcfildsType-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommCfildsType> commcfildsTypes = commcfildsTypeManager.findByIds(selectedItem);

        commcfildsTypeManager.removeAll(commcfildsTypes);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commcfildsType-info-list.do";
    }

    @RequestMapping("commcfildsType-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commcfildsTypeManager.pagedQuery(page, propertyFilters);

        List<CommCfildsType> commcfildsTypes = (List<CommCfildsType>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commcfildsType info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commcfildsTypes);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommCfildsTypeManager(CommCfildsTypeManager commcfildsTypeManager) {
        this.commcfildsTypeManager = commcfildsTypeManager;
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
