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
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.CommRy;
import com.xthena.hr.domain.HrGwbm;
import com.xthena.hr.domain.HrRydb;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrGwbmManager;
import com.xthena.hr.manager.HrRydbManager;

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
public class HrRydbController {
    private HrRydbManager hrRydbManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    
    
    @Autowired
    private  HrGwbmManager hrGwbmManager;
    
    
    @Autowired
    private CommRyManager commRyManager;
    
    @RequestMapping("hrryzp-input")
    public String hrryzpinput() {
        return "hr/hrryzp-input";
    }  
    
    @RequestMapping("hrRydb-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrRydbManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        
    	List<HrGwbm> hrGwbms = hrGwbmManager.getAll();
		HashMap<Long,HashMap<String, Object>> deptList = new HashMap<Long,HashMap<String, Object>>();
		for (HrGwbm hrGwbm : hrGwbms) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("fid", hrGwbm.getFid());
			hashMap.put("fgwname", hrGwbm.getFname());
			deptList.put(hrGwbm.getFid(),hashMap);
		}
      
		model.addAttribute("gwInfos", deptList);
		
        return "hr/hrRydb-info-list";
    }

    @RequestMapping("hrRydb-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrRydb hrRydb = hrRydbManager.get(id);
            model.addAttribute("model", hrRydb);
        }

 		List<HrGwbm> hrGwbms = hrGwbmManager.getAll();
 		List<HashMap<String, Object>> deptList = new ArrayList<HashMap<String, Object>>();
 		for (HrGwbm hrGwbm : hrGwbms) {
 			HashMap<String, Object> hashMap = new HashMap<String, Object>();
 			hashMap.put("fid", hrGwbm.getFid());
 			hashMap.put("fgwname", hrGwbm.getFname());
 			deptList.add(hashMap);
 		}
       
 		model.addAttribute("gwInfos", deptList);
        
        
        return "hr/hrRydb-info-input";
    }

    @RequestMapping("hrRydb-info-save")
    public String save(@ModelAttribute HrRydb hrRydb,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrRydb dest = null;

        Long id = hrRydb.getFid();

        if (id != null) {
            dest = hrRydbManager.get(id);
            beanMapper.copy(hrRydb, dest);
        } else {
            dest = hrRydb;
        }

        CommRy commRy= commRyManager.get(dest.getFryid());
        dest.setFsrcgw(commRy.getFjobid());
     
        commRy.setFjobid(dest.getFdestgw());
        commRyManager.save(commRy);
        
       
        hrRydbManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrRydb-info-list.do";
    }

    @RequestMapping("hrRydb-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrRydb> hrRydbs = hrRydbManager.findByIds(selectedItem);

        hrRydbManager.removeAll(hrRydbs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrRydb-info-list.do";
    }

    @RequestMapping("hrRydb-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrRydbManager.pagedQuery(page, propertyFilters);

        List<HrRydb> hrRydbs = (List<HrRydb>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrRydb info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrRydbs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrRydbManager(HrRydbManager hrRydbManager) {
        this.hrRydbManager = hrRydbManager;
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
