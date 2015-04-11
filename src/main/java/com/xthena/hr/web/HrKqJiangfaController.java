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
import com.xthena.util.CommRyMapUtil;
import com.xthena.hr.domain.HrKqJiangfa;
import com.xthena.hr.manager.HrKqJiangfaManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrKqJiangfaController {
    private HrKqJiangfaManager hrKqJiangfaManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrKqJiangfa-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKqJiangfaManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "hr/hrKqJiangfa-info-list";
    }

    @RequestMapping("hrKqJiangfa-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrKqJiangfa hrKqJiangfa = hrKqJiangfaManager.get(id);
            model.addAttribute("model", hrKqJiangfa);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "hr/hrKqJiangfa-info-input";
    }

    @RequestMapping("hrKqJiangfa-info-save")
    public String save(@ModelAttribute HrKqJiangfa hrKqJiangfa,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrKqJiangfa dest = null;

        Long id = hrKqJiangfa.getFid();

        if (id != null) {
            dest = hrKqJiangfaManager.get(id);
            beanMapper.copy(hrKqJiangfa, dest);
        } else {
            dest = hrKqJiangfa;
        }

        hrKqJiangfaManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrKqJiangfa-info-list.do";
    }

    @RequestMapping("hrKqJiangfa-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrKqJiangfa> hrKqJiangfas = hrKqJiangfaManager.findByIds(selectedItem);

        hrKqJiangfaManager.removeAll(hrKqJiangfas);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrKqJiangfa-info-list.do";
    }

    @RequestMapping("hrKqJiangfa-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKqJiangfaManager.pagedQuery(page, propertyFilters);

        List<HrKqJiangfa> hrKqJiangfas = (List<HrKqJiangfa>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrKqJiangfa info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrKqJiangfas);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrKqJiangfaManager(HrKqJiangfaManager hrKqJiangfaManager) {
        this.hrKqJiangfaManager = hrKqJiangfaManager;
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
