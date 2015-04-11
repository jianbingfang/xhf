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
import com.xthena.hr.domain.HrKsRy;
import com.xthena.hr.manager.HrKsRyManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrKsRyController {
    private HrKsRyManager hrKsRyManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrKsRy-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, @RequestParam(value = "ksid", required = false) Long ksid,Model model) {
        if(ksid!=null){
        	parameterMap.put("filter_EQI_fksid", ksid);
        }
    	List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKsRyManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrKsRy-info-list";
    }

    @RequestMapping("hrKsRy-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrKsRy hrKsRy = hrKsRyManager.get(id);
            model.addAttribute("model", hrKsRy);
        }

        return "hr/hrKsRy-info-input";
    }

    @RequestMapping("hrKsRy-info-save")
    public String save(@ModelAttribute HrKsRy hrKsRy,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrKsRy dest = null;

        Long id = hrKsRy.getFid();

        if (id != null) {
            dest = hrKsRyManager.get(id);
            beanMapper.copy(hrKsRy, dest);
        } else {
            dest = hrKsRy;
        }

        hrKsRyManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrKsRy-info-list.do";
    }

    @RequestMapping("hrKsRy-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrKsRy> hrKsRys = hrKsRyManager.findByIds(selectedItem);

        hrKsRyManager.removeAll(hrKsRys);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrKsRy-info-list.do";
    }

    @RequestMapping("hrKsRy-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrKsRyManager.pagedQuery(page, propertyFilters);

        List<HrKsRy> hrKsRys = (List<HrKsRy>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrKsRy info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrKsRys);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrKsRyManager(HrKsRyManager hrKsRyManager) {
        this.hrKsRyManager = hrKsRyManager;
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
