package  com.xthena.common.web;

import java.util.ArrayList;
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

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.common.domain.CommRemindData;
import com.xthena.common.manager.CommRemindDataManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("comm")
public class CommRemindDataController {
    private CommRemindDataManager commRemindDataManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("commRemindData-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindDataManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commRemindData-info-list";
    }

    @RequestMapping("commRemindData-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommRemindData commRemindData = commRemindDataManager.get(id);
            model.addAttribute("model", commRemindData);
        }

        return "comm/commRemindData-info-input";
    }

    @RequestMapping("commRemindData-info-save")
    public String save(@ModelAttribute CommRemindData commRemindData,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommRemindData dest = null;

        Long id = commRemindData.getFid();

        if (id != null) {
            dest = commRemindDataManager.get(id);
            beanMapper.copy(commRemindData, dest);
        } else {
            dest = commRemindData;
        }

        commRemindDataManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commRemindData-info-list.do";
    }

    @RequestMapping("commRemindData-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommRemindData> commRemindDatas = commRemindDataManager.findByIds(selectedItem);

        commRemindDataManager.removeAll(commRemindDatas);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commRemindData-info-list.do";
    }

    @RequestMapping("commRemindData-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindDataManager.pagedQuery(page, propertyFilters);

        List<CommRemindData> commRemindDatas = (List<CommRemindData>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commRemindData info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commRemindDatas);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommRemindDataManager(CommRemindDataManager commRemindDataManager) {
        this.commRemindDataManager = commRemindDataManager;
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
