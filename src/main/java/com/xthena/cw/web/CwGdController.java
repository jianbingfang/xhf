package  com.xthena.cw.web;

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
import com.xthena.util.PjXmMapUtil;
import com.xthena.cw.domain.CwGd;
import com.xthena.cw.manager.CwGdManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("cw")
public class CwGdController {
    private CwGdManager cwGdManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("cwGd-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwGdManager.pagedQuery(page, propertyFilters);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("page", page);

        return "cw/cwGd-info-list";
    }

    @RequestMapping("cwGd-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CwGd cwGd = cwGdManager.get(id);
            model.addAttribute("model", cwGd);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        return "cw/cwGd-info-input";
    }

    @RequestMapping("cwGd-info-save")
    public String save(@ModelAttribute CwGd cwGd,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CwGd dest = null;

        Long id = cwGd.getFid();

        if (id != null) {
            dest = cwGdManager.get(id);
            beanMapper.copy(cwGd, dest);
        } else {
            dest = cwGd;
        }

        cwGdManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cwGd-info-list.do";
    }

    @RequestMapping("cwGd-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CwGd> cwGds = cwGdManager.findByIds(selectedItem);

        cwGdManager.removeAll(cwGds);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cwGd-info-list.do";
    }

    @RequestMapping("cwGd-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = cwGdManager.pagedQuery(page, propertyFilters);

        List<CwGd> cwGds = (List<CwGd>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("cwGd info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(cwGds);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCwGdManager(CwGdManager cwGdManager) {
        this.cwGdManager = cwGdManager;
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
