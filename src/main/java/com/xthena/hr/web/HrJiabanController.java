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
import com.xthena.hr.domain.HrJiaban;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrJiabanManager;

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
public class HrJiabanController {
    private HrJiabanManager hrJiabanManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    @RequestMapping("hrJiaban-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrJiabanManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
    	List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
		for (OrgDepartment orgDepartment : orgDepartments) {
			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
		}
      
		  model.addAttribute("deptMap", orgDeptHashMap);
		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
		
		

        return "hr/hrJiaban-info-list";
    }

    @RequestMapping("hrJiaban-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrJiaban hrJiaban = hrJiabanManager.get(id);
            model.addAttribute("model", hrJiaban);
        }
    	// 岗位下拉
 		List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
        model.addAttribute("deptList",orgDepartments);
 		model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "hr/hrJiaban-info-input";
    }

    @RequestMapping("hrJiaban-info-save")
    public String save(@ModelAttribute HrJiaban hrJiaban,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrJiaban dest = null;

        Long id = hrJiaban.getFid();

        if (id != null) {
            dest = hrJiabanManager.get(id);
            beanMapper.copy(hrJiaban, dest);
        } else {
            dest = hrJiaban;
        }

        hrJiabanManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrJiaban-info-list.do";
    }

    @RequestMapping("hrJiaban-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrJiaban> hrJiabans = hrJiabanManager.findByIds(selectedItem);

        hrJiabanManager.removeAll(hrJiabans);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrJiaban-info-list.do";
    }

    @RequestMapping("hrJiaban-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrJiabanManager.pagedQuery(page, propertyFilters);

        List<HrJiaban> hrJiabans = (List<HrJiaban>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrJiaban info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrJiabans);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrJiabanManager(HrJiabanManager hrJiabanManager) {
        this.hrJiabanManager = hrJiabanManager;
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
