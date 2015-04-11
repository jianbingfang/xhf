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
import com.xthena.common.domain.CommRemindLog;
import com.xthena.common.manager.CommRemindLogManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("comm")
public class CommRemindLogController {
    private CommRemindLogManager commRemindLogManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("commRemindLog-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindLogManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commRemindLog-info-list";
    }

    @RequestMapping("commRemindLog-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommRemindLog commRemindLog = commRemindLogManager.get(id);
            model.addAttribute("model", commRemindLog);
        }

        return "comm/commRemindLog-info-input";
    }

    @RequestMapping("commRemindLog-info-save")
    public String save(@ModelAttribute CommRemindLog commRemindLog,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommRemindLog dest = null;

        Long id = commRemindLog.getFid();

        if (id != null) {
            dest = commRemindLogManager.get(id);
            beanMapper.copy(commRemindLog, dest);
        } else {
            dest = commRemindLog;
        }

        commRemindLogManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commRemindLog-info-list.do";
    }

    @RequestMapping("commRemindLog-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommRemindLog> commRemindLogs = commRemindLogManager.findByIds(selectedItem);

        commRemindLogManager.removeAll(commRemindLogs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commRemindLog-info-list.do";
    }

    @RequestMapping("commRemindLog-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindLogManager.pagedQuery(page, propertyFilters);

        List<CommRemindLog> commRemindLogs = (List<CommRemindLog>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commRemindLog info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commRemindLogs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommRemindLogManager(CommRemindLogManager commRemindLogManager) {
        this.commRemindLogManager = commRemindLogManager;
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
