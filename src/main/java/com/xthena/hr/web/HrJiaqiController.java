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
import com.xthena.hr.domain.HrJiaqi;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrJiaqiManager;

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
public class HrJiaqiController {
    private HrJiaqiManager hrJiaqiManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    
    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    
    @RequestMapping("hrJiaqi-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrJiaqiManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
    	List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
		for (OrgDepartment orgDepartment : orgDepartments) {
			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
		}
      
		  model.addAttribute("deptMap", orgDeptHashMap);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		

        return "hr/hrJiaqi-info-list";
    }

    @RequestMapping("hrJiaqi-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrJiaqi hrJiaqi = hrJiaqiManager.get(id);
            model.addAttribute("model", hrJiaqi);
        }

    	// 岗位下拉
 		List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
        model.addAttribute("deptList",orgDepartments);
 		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
 		
        return "hr/hrJiaqi-info-input";
    }

    @RequestMapping("hrJiaqi-info-save")
    public String save(@ModelAttribute HrJiaqi hrJiaqi,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrJiaqi dest = null;

        Long id = hrJiaqi.getFid();

        if (id != null) {
            dest = hrJiaqiManager.get(id);
            beanMapper.copy(hrJiaqi, dest);
        } else {
            dest = hrJiaqi;
        }

        hrJiaqiManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrJiaqi-info-list.do";
    }

    @RequestMapping("hrJiaqi-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrJiaqi> hrJiaqis = hrJiaqiManager.findByIds(selectedItem);

        hrJiaqiManager.removeAll(hrJiaqis);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrJiaqi-info-list.do";
    }

    @RequestMapping("hrJiaqi-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrJiaqiManager.pagedQuery(page, propertyFilters);

        List<HrJiaqi> hrJiaqis = (List<HrJiaqi>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrJiaqi info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrJiaqis);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrJiaqiManager(HrJiaqiManager hrJiaqiManager) {
        this.hrJiaqiManager = hrJiaqiManager;
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
