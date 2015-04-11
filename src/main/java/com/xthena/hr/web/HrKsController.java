package  com.xthena.hr.web;

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
import com.xthena.hr.domain.HrKs;
import com.xthena.hr.manager.HrKsManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrKsController {
    private HrKsManager hrKsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrKs-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKsManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrKs-info-list";
    }

    @RequestMapping("hrKs-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrKs hrKs = hrKsManager.get(id);
            model.addAttribute("model", hrKs);
        }

        return "hr/hrKs-info-input";
    }

    @RequestMapping("hrKs-info-save")
    public String save(@ModelAttribute HrKs hrKs,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrKs dest = null;

        Long id = hrKs.getFid();

        if (id != null) {
            dest = hrKsManager.get(id);
            beanMapper.copy(hrKs, dest);
        } else {
            dest = hrKs;
        }

        hrKsManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrKs-info-list.do";
    }

    @RequestMapping("hrKs-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrKs> hrKss = hrKsManager.findByIds(selectedItem);

        hrKsManager.removeAll(hrKss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrKs-info-list.do";
    }

    @RequestMapping("hrKs-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKsManager.pagedQuery(page, propertyFilters);

        List<HrKs> hrKss = (List<HrKs>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrKs info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrKss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrKsManager(HrKsManager hrKsManager) {
        this.hrKsManager = hrKsManager;
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
