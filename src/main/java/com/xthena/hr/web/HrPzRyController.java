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
import com.xthena.hr.domain.HrPzRy;
import com.xthena.hr.manager.HrPzRyManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrPzRyController {
    private HrPzRyManager hrPzRyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrPzRy-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrPzRyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrPzRy-info-list";
    }

    @RequestMapping("hrPzRy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrPzRy hrPzRy = hrPzRyManager.get(id);
            model.addAttribute("model", hrPzRy);
        }

        return "hr/hrPzRy-info-input";
    }

    @RequestMapping("hrPzRy-info-save")
    public String save(@ModelAttribute HrPzRy hrPzRy,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrPzRy dest = null;

        Long id = hrPzRy.getFid();

        if (id != null) {
            dest = hrPzRyManager.get(id);
            beanMapper.copy(hrPzRy, dest);
        } else {
            dest = hrPzRy;
        }

        hrPzRyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrPzRy-info-list.do";
    }

    @RequestMapping("hrPzRy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrPzRy> hrPzRys = hrPzRyManager.findByIds(selectedItem);

        hrPzRyManager.removeAll(hrPzRys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrPzRy-info-list.do";
    }

    @RequestMapping("hrPzRy-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrPzRyManager.pagedQuery(page, propertyFilters);

        List<HrPzRy> hrPzRys = (List<HrPzRy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrPzRy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrPzRys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrPzRyManager(HrPzRyManager hrPzRyManager) {
        this.hrPzRyManager = hrPzRyManager;
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
