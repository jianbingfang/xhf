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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.HrPx;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrPxManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrPxController {
    private HrPxManager hrPxManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    @Autowired
	private OrgDepartmentManager orgDepartmentManager;
    @Autowired
    private CommRyManager ryManager;
    
    @RequestMapping("hrPx-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
       page = hrPxManager.pagedQuery(page, propertyFilters);
       model.addAttribute("page", page);
       model.addAttribute("deptList",orgDepartmentManager.getAll());
       model.addAttribute("userNames", ryManager.getAll());
      // System.out.println("*****************************"+ryManager.getAll().size());
        return "hr/hrPx-info-list";
    }

    @RequestMapping("hrPx-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrPx hrPx = hrPxManager.get(id);
            model.addAttribute("model", hrPx);
        }
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        model.addAttribute("userNames", ryManager.getAll());
        return "hr/hrPx-info-input";
    }

    @RequestMapping("hrPx-info-save")
    public String save(@ModelAttribute HrPx hrPx,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrPx dest = null;

        Long id = hrPx.getFid();

        if (id != null) {
            dest = hrPxManager.get(id);
            beanMapper.copy(hrPx, dest);
        } else {
            dest = hrPx;
        }

        hrPxManager.save(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/hr/hrPx-info-list.do";
    }

    @RequestMapping("hrPx-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrPx> hrPxs = hrPxManager.findByIds(selectedItem);

        hrPxManager.removeAll(hrPxs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrPx-info-list.do";
    }

    @RequestMapping("hrPx-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrPxManager.pagedQuery(page, propertyFilters);

        List<HrPx> hrPxs = (List<HrPx>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrPx info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrPxs);
        exportor.export(response, tableModel);
    }

    @RequestMapping("hrPx-wb-info-list")
    public String list2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrPxManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "hr/hrPx-wb-info-list";
    }

    @RequestMapping("hrPx-wb-info-input")
    public String input2(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrPx hrPx = hrPxManager.get(id);
            model.addAttribute("model", hrPx);
        }

        return "hr/hrPx-wb-info-input";
    }

    @RequestMapping("hrPx-wb-info-save")
    public String save2(@ModelAttribute HrPx hrPx,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrPx dest = null;

        Long id = hrPx.getFid();

        if (id != null) {
            dest = hrPxManager.get(id);
            beanMapper.copy(hrPx, dest);
        } else {
            dest = hrPx;
        }

        hrPxManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrPx-wb-info-list.do";
    }

    @RequestMapping("hrPx-wb-info-remove")
    public String remove2(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrPx> hrPxs = hrPxManager.findByIds(selectedItem);

        hrPxManager.removeAll(hrPxs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrPx-wb-info-list.do";
    }

    @RequestMapping("hrPx-wb-info-export")
    public void export2(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrPxManager.pagedQuery(page, propertyFilters);

        List<HrPx> hrPxs = (List<HrPx>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrPx info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrPxs);
        exportor.export(response, tableModel);
    }

    
    // ~ ======================================================================
    @Resource
    public void setHrPxManager(HrPxManager hrPxManager) {
        this.hrPxManager = hrPxManager;
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
