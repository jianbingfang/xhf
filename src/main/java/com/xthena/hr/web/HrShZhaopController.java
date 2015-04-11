package  com.xthena.hr.web;

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
import com.xthena.hr.domain.HrShZhaop;
import com.xthena.hr.manager.HrShZhaopManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrShZhaopController {
    private HrShZhaopManager hrShZhaopManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrShZhaop-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrShZhaopManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrShZhaop-info-list";
    }

    @RequestMapping("hrShZhaop-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrShZhaop hrShZhaop = hrShZhaopManager.get(id);
            model.addAttribute("model", hrShZhaop);
        }

        return "hr/hrShZhaop-info-input";
    }

    @RequestMapping("hrShZhaop-info-save")
    public String save(@ModelAttribute HrShZhaop hrShZhaop,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrShZhaop dest = null;

        Long id = hrShZhaop.getFid();

        if (id != null) {
            dest = hrShZhaopManager.get(id);
            beanMapper.copy(hrShZhaop, dest);
        } else {
            dest = hrShZhaop;
        }

        hrShZhaopManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrShZhaop-info-list.do";
    }

    @RequestMapping("hrShZhaop-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrShZhaop> hrShZhaops = hrShZhaopManager.findByIds(selectedItem);

        hrShZhaopManager.removeAll(hrShZhaops);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrShZhaop-info-list.do";
    }

    @RequestMapping("hrShZhaop-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrShZhaopManager.pagedQuery(page, propertyFilters);

        List<HrShZhaop> hrShZhaops = (List<HrShZhaop>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrShZhaop info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrShZhaops);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrShZhaopManager(HrShZhaopManager hrShZhaopManager) {
        this.hrShZhaopManager = hrShZhaopManager;
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
