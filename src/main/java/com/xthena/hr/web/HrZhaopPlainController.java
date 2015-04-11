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
import com.xthena.util.JsonResponseUtil;
import com.xthena.group.domain.OrgDepartment;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.HrGwbm;
import com.xthena.hr.domain.HrZhaopPlain;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrZhaopPlainManager;

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
public class HrZhaopPlainController {
    private HrZhaopPlainManager hrZhaopPlainManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    
    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    
    
    @Autowired
    private  HrGwbmManager hrGwbmManager;
    
    @RequestMapping("hrZhaopPlain-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrZhaopPlainManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        
		// 岗位下拉
		List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
		for (OrgDepartment orgDepartment : orgDepartments) {
			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
		}
		List<HrGwbm> hrGwbms = hrGwbmManager.getAll();
		HashMap<String,HashMap<String, Object>> deptList = new HashMap<String,HashMap<String, Object>>();
		for (HrGwbm hrGwbm : hrGwbms) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("fid", hrGwbm.getFid());
			hashMap.put("fname", orgDeptHashMap.get(hrGwbm.getFbmid()));
			hashMap.put("fgwname", hrGwbm.getFname());
			deptList.put(hrGwbm.getFid().toString(),hashMap);
		}
      
		model.addAttribute("gwInfos", deptList);
        model.addAttribute("deptMap", orgDeptHashMap);

        return "hr/hrZhaopPlain-info-list";
    }

    @RequestMapping("hrZhaopPlain-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrZhaopPlain hrZhaopPlain = hrZhaopPlainManager.get(id);
            model.addAttribute("model", hrZhaopPlain);
        }
       
        
        	// 岗位下拉
     		List<OrgDepartment> orgDepartments = orgDepartmentManager.getAll();
     		
     		 
            model.addAttribute("deptList",orgDepartments);
            
     		HashMap<Long, String> orgDeptHashMap = new HashMap<Long, String>();
     		for (OrgDepartment orgDepartment : orgDepartments) {
     			orgDeptHashMap.put(orgDepartment.getId(), orgDepartment.getName());
     		}
     		List<HrGwbm> hrGwbms = hrGwbmManager.getAll();
     		List<HashMap<String, Object>> deptList = new ArrayList<HashMap<String, Object>>();
     		for (HrGwbm hrGwbm : hrGwbms) {
     			HashMap<String, Object> hashMap = new HashMap<String, Object>();
     			hashMap.put("fid", hrGwbm.getFid());
     			hashMap.put("fname", orgDeptHashMap.get(hrGwbm.getFbmid()));
     			hashMap.put("fgwname", hrGwbm.getFname());
     			deptList.add(hashMap);
     		}
           
     		model.addAttribute("gwInfos", deptList);
     		
   
        
        return "hr/hrZhaopPlain-info-input";
    }

    
    @RequestMapping("bmgw-list-ajax")
    public void bmgwList(@RequestParam(value = "bmid", required = false) Long bmid,HttpServletResponse response,
            Model model) {
    	JsonResponseUtil.write(response,hrGwbmManager.findBy("fbmid", bmid));
    }

    
    @RequestMapping("hrZhaopPlain-info-save")
    public String save(@ModelAttribute HrZhaopPlain hrZhaopPlain,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrZhaopPlain dest = null;

        Long id = hrZhaopPlain.getFid();

        if (id != null) {
            dest = hrZhaopPlainManager.get(id);
            beanMapper.copy(hrZhaopPlain, dest);
        } else {
            dest = hrZhaopPlain;
        }

        hrZhaopPlainManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrZhaopPlain-info-list.do";
    }

    @RequestMapping("hrZhaopPlain-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrZhaopPlain> hrZhaopPlains = hrZhaopPlainManager.findByIds(selectedItem);

        hrZhaopPlainManager.removeAll(hrZhaopPlains);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrZhaopPlain-info-list.do";
    }

    @RequestMapping("hrZhaopPlain-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrZhaopPlainManager.pagedQuery(page, propertyFilters);

        List<HrZhaopPlain> hrZhaopPlains = (List<HrZhaopPlain>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrZhaopPlain info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrZhaopPlains);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrZhaopPlainManager(HrZhaopPlainManager hrZhaopPlainManager) {
        this.hrZhaopPlainManager = hrZhaopPlainManager;
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
