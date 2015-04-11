package  com.xthena.cw.web;

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
import com.xthena.cw.domain.CwXmhslist;
import com.xthena.cw.manager.CwXmhsManager;
import com.xthena.cw.manager.CwXmhslistManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwXmhslistController {
    private CwXmhslistManager cwXmhslistManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
    private CwXmhsManager cwXmhsManager;

    @RequestMapping("cwXmhslist-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwXmhslistManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "cw/cwXmhslist-info-list";
    }

    @RequestMapping("cwXmhslist-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CwXmhslist cwXmhslist = cwXmhslistManager.get(id);
            model.addAttribute("model", cwXmhslist);
        }

        return "cw/cwXmhslist-info-input";
    }

    @RequestMapping("cwXmhslist-info-save")
    public String save(@ModelAttribute CwXmhslist cwXmhslist,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CwXmhslist dest = null;

        Long id = cwXmhslist.getFid();

        if (id != null) {
            dest = cwXmhslistManager.get(id);
            beanMapper.copy(cwXmhslist, dest);
        } else {
            dest = cwXmhslist;
        }
        cwXmhslistManager.save(dest);
        
        
       redirectAttributes =  cwXmhsManager.newList(dest,redirectAttributes);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "报表初始化成功");
        return "redirect:/cw/cwXmhslist-info-list.do";
    }

    @RequestMapping("cwXmhslist-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CwXmhslist> cwXmhslists = cwXmhslistManager.findByIds(selectedItem);

        cwXmhslistManager.removeAll(cwXmhslists);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cwXmhslist-info-list.do";
    }

    @RequestMapping("cwXmhslist-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwXmhslistManager.pagedQuery(page, propertyFilters);

        List<CwXmhslist> cwXmhslists = (List<CwXmhslist>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("cwXmhslist info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(cwXmhslists);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCwXmhslistManager(CwXmhslistManager cwXmhslistManager) {
        this.cwXmhslistManager = cwXmhslistManager;
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
