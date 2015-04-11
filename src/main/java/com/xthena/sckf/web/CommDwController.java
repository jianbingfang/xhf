package  com.xthena.sckf.web;

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

import com.xthena.sckf.domain.CommDw;
import com.xthena.sckf.manager.CommDwManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class CommDwController {
    private CommDwManager commDwManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("commDw-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commDwManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/commDw-info-list";
    }

    @RequestMapping("commDw-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommDw commDw = commDwManager.get(id);
            model.addAttribute("model", commDw);
        }

        return "sckf/commDw-info-input";
    }

    @RequestMapping("commDw-info-save")
    public String save(@ModelAttribute CommDw commDw,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommDw dest = null;

        Long id = commDw.getFid();

        if (id != null) {
            dest = commDwManager.get(id);
            beanMapper.copy(commDw, dest);
        } else {
            dest = commDw;
        }

        commDwManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/commDw-info-list.do";
    }

    @RequestMapping("commDw-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommDw> commDws = commDwManager.findByIds(selectedItem);

        commDwManager.removeAll(commDws);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/commDw-info-list.do";
    }

    @RequestMapping("commDw-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commDwManager.pagedQuery(page, propertyFilters);

        List<CommDw> commDws = (List<CommDw>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commDw info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commDws);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommDwManager(CommDwManager commDwManager) {
        this.commDwManager = commDwManager;
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
