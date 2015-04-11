package  com.xthena.hr.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.xthena.group.domain.OrgDepartment;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.HrGwbm;
import com.xthena.hr.domain.Hrqingjia;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrqingjiaManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrqingjiaController {
    private HrqingjiaManager hrqingjiaManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    
    @RequestMapping("hrqingjia-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrqingjiaManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        
    	List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
		for (OrgDepartment orgDepartment : orgDepartments) {
			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
		}
      
		  model.addAttribute("deptMap", orgDeptHashMap);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		

        return "hr/hrqingjia-info-list";
    }

    @RequestMapping("hrqingjia-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            Hrqingjia hrqingjia = hrqingjiaManager.get(id);
            model.addAttribute("model", hrqingjia);
        }
     // 岗位下拉
        List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
        model.addAttribute("deptList",orgDepartments);
 		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrqingjia-info-input";
    }

    @RequestMapping("hrqingjia-info-save")
    public String save(@ModelAttribute Hrqingjia hrqingjia,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        Hrqingjia dest = null;

        Long id = hrqingjia.getFid();

        if (id != null) {
            dest = hrqingjiaManager.get(id);
            beanMapper.copy(hrqingjia, dest);
        } else {
            dest = hrqingjia;
        }

        hrqingjiaManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrqingjia-info-list.do";
    }

    @RequestMapping("hrqingjia-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<Hrqingjia> hrqingjias = hrqingjiaManager.findByIds(selectedItem);

        hrqingjiaManager.removeAll(hrqingjias);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrqingjia-info-list.do";
    }

    @RequestMapping("hrqingjia-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrqingjiaManager.pagedQuery(page, propertyFilters);

        List<Hrqingjia> hrqingjias = (List<Hrqingjia>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrqingjia info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrqingjias);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrqingjiaManager(HrqingjiaManager hrqingjiaManager) {
        this.hrqingjiaManager = hrqingjiaManager;
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
