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
import com.xthena.common.domain.CommCfilds;
import com.xthena.common.manager.CommCfildsManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("comm")
public class CommCfildsController {
    private CommCfildsManager commcfildsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    

    @RequestMapping("commcfilds-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commcfildsManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commcfilds-info-list";
    }

    
    
    @RequestMapping("commcfilds-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommCfilds commcfilds = commcfildsManager.get(id);
            model.addAttribute("model", commcfilds);
        }

        return "comm/commcfilds-info-input";
    }

    @RequestMapping("commcfilds-info-save")
    public String save(@ModelAttribute CommCfilds commcfilds,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommCfilds dest = null;

        Long id = commcfilds.getFid();

        if (id != null) {
            dest = commcfildsManager.get(id);
            beanMapper.copy(commcfilds, dest);
        } else {
            dest = commcfilds;
        }

        commcfildsManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commcfilds-info-list.do";
    }

    @RequestMapping("commcfilds-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommCfilds> commcfildss = commcfildsManager.findByIds(selectedItem);

        commcfildsManager.removeAll(commcfildss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commcfilds-info-list.do";
    }

    @RequestMapping("commcfilds-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commcfildsManager.pagedQuery(page, propertyFilters);

        List<CommCfilds> commcfildss = (List<CommCfilds>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commcfilds info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commcfildss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommCfildsManager(CommCfildsManager commcfildsManager) {
        this.commcfildsManager = commcfildsManager;
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
