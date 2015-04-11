package  com.xthena.hr.web;

import java.util.Date;
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
import com.xthena.hr.domain.HrKq;
import com.xthena.hr.manager.HrKqManager;
import com.xthena.util.CommRyMapUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrKqController {
    private HrKqManager hrKqManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrKq-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKqManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrKq-info-list";
    }

    @RequestMapping("hrKq-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrKq hrKq = hrKqManager.get(id);
            model.addAttribute("model", hrKq);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "hr/hrKq-info-input";
    }

    @RequestMapping("hrKq-info-save")
    public String save(@ModelAttribute HrKq hrKq,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrKq dest = null;

        Long id = hrKq.getFid();

        if (id != null) {
            dest = hrKqManager.get(id);
            beanMapper.copy(hrKq, dest);
        } else {
        	hrKq.setFupdatedate(new Date());
            dest = hrKq;
        }

        hrKqManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrKq-info-list.do";
    }

    @RequestMapping("hrKq-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrKq> hrKqs = hrKqManager.findByIds(selectedItem);

        hrKqManager.removeAll(hrKqs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrKq-info-list.do";
    }

    @RequestMapping("hrKq-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKqManager.pagedQuery(page, propertyFilters);

        List<HrKq> hrKqs = (List<HrKq>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrKq info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrKqs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrKqManager(HrKqManager hrKqManager) {
        this.hrKqManager = hrKqManager;
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
