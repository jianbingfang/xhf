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
import com.xthena.hr.domain.HrGwXq;
import com.xthena.hr.manager.HrGwXqManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrGwXqController {
    private HrGwXqManager hrGwXqManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrGwXq-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrGwXqManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrGwXq-info-list";
    }

    @RequestMapping("hrGwXq-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrGwXq hrGwXq = hrGwXqManager.get(id);
            model.addAttribute("model", hrGwXq);
        }

        return "hr/hrGwXq-info-input";
    }

    @RequestMapping("hrGwXq-info-save")
    public String save(@ModelAttribute HrGwXq hrGwXq,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrGwXq dest = null;

        Long id = hrGwXq.getFid();

        if (id != null) {
            dest = hrGwXqManager.get(id);
            beanMapper.copy(hrGwXq, dest);
        } else {
            dest = hrGwXq;
        }

        hrGwXqManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrGwXq-info-list.do";
    }

    @RequestMapping("hrGwXq-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrGwXq> hrGwXqs = hrGwXqManager.findByIds(selectedItem);

        hrGwXqManager.removeAll(hrGwXqs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrGwXq-info-list.do";
    }

    @RequestMapping("hrGwXq-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrGwXqManager.pagedQuery(page, propertyFilters);

        List<HrGwXq> hrGwXqs = (List<HrGwXq>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrGwXq info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrGwXqs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrGwXqManager(HrGwXqManager hrGwXqManager) {
        this.hrGwXqManager = hrGwXqManager;
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
