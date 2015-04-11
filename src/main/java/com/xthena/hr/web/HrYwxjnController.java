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
import com.xthena.hr.domain.HrYwxjn;
import com.xthena.hr.manager.HrYwxjnManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrYwxjnController {
    private HrYwxjnManager hrYwxjnManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrYwxjn-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrYwxjnManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrYwxjn-info-list";
    }

    @RequestMapping("hrYwxjn-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrYwxjn hrYwxjn = hrYwxjnManager.get(id);
            model.addAttribute("model", hrYwxjn);
        }

        return "hr/hrYwxjn-info-input";
    }

    @RequestMapping("hrYwxjn-info-save")
    public String save(@ModelAttribute HrYwxjn hrYwxjn,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrYwxjn dest = null;

        Long id = hrYwxjn.getFid();

        if (id != null) {
            dest = hrYwxjnManager.get(id);
            beanMapper.copy(hrYwxjn, dest);
        } else {
            dest = hrYwxjn;
        }

        hrYwxjnManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrYwxjn-info-list.do";
    }

    @RequestMapping("hrYwxjn-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrYwxjn> hrYwxjns = hrYwxjnManager.findByIds(selectedItem);

        hrYwxjnManager.removeAll(hrYwxjns);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrYwxjn-info-list.do";
    }

    @RequestMapping("hrYwxjn-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrYwxjnManager.pagedQuery(page, propertyFilters);

        List<HrYwxjn> hrYwxjns = (List<HrYwxjn>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrYwxjn info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrYwxjns);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrYwxjnManager(HrYwxjnManager hrYwxjnManager) {
        this.hrYwxjnManager = hrYwxjnManager;
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
