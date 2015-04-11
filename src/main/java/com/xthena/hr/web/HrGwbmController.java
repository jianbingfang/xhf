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
import com.xthena.group.domain.OrgDepartment;
import com.xthena.group.manager.JobInfoManager;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.domain.HrGwbm;
import com.xthena.hr.manager.HrGwbmManager;

import com.xthena.util.JsonResponseUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("hr")
public class HrGwbmController {
	@Autowired
	private OrgDepartmentManager orgDepartmentManager;
	
	@Autowired
	private JobInfoManager jobInfoManager;
	
    private HrGwbmManager hrGwbmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("hrGwbm-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrGwbmManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);
        model.addAttribute("deptList",orgDepartmentManager.getAll());
        return "hr/hrGwbm-info-list";
    }
    
    
    @RequestMapping("hrGwbm-listBm")
    public void listBm(HttpServletResponse response) {
        List<OrgDepartment> orgDepartments=orgDepartmentManager.getAll();
        List<HashMap<String, String>> depetList=new ArrayList<HashMap<String,String>>();
        for(OrgDepartment orgDepartment:orgDepartments){
        	HashMap<String, String> depetMap=new HashMap<String, String>();
        	depetMap.put("value",orgDepartment.getId().toString());
        	depetMap.put("text",orgDepartment.getName());
        	depetList.add(depetMap);
        }
        JsonResponseUtil.write(response,depetList);
        
    }
    
    @RequestMapping("hrGwbm-listZw")
    public void listZw(HttpServletResponse response) {
        List<OrgDepartment> orgDepartments=orgDepartmentManager.getAll();
        List<HashMap<String, String>> depetList=new ArrayList<HashMap<String,String>>();
        for(OrgDepartment orgDepartment:orgDepartments){
        	HashMap<String, String> depetMap=new HashMap<String, String>();
        	depetMap.put("value",orgDepartment.getId().toString());
        	depetMap.put("text",orgDepartment.getName());
        	depetList.add(depetMap);
        }
        JsonResponseUtil.write(response,depetList);
        
    }

    @RequestMapping("hrGwbm-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            HrGwbm hrGwbm = hrGwbmManager.get(id);
            model.addAttribute("model", hrGwbm);
        }
        model.addAttribute("jobInfos", jobInfoManager.getAll());
        model.addAttribute("deptList",orgDepartmentManager.getAll());

        return "hr/hrGwbm-info-input";
    }

    @RequestMapping("hrGwbm-info-save")
    public String save(@ModelAttribute HrGwbm hrGwbm,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        HrGwbm dest = null;

        Long id = hrGwbm.getFid();

        if (id != null) {
            dest = hrGwbmManager.get(id);
            beanMapper.copy(hrGwbm, dest);
        } else {
            dest = hrGwbm;
        }

        hrGwbmManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrGwbm-info-list.do";
    }

    @RequestMapping("hrGwbm-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<HrGwbm> hrGwbms = hrGwbmManager.findByIds(selectedItem);

        hrGwbmManager.removeAll(hrGwbms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/hr/hrGwbm-info-list.do";
    }

    @RequestMapping("hrGwbm-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrGwbmManager.pagedQuery(page, propertyFilters);

        List<HrGwbm> hrGwbms = (List<HrGwbm>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrGwbm info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrGwbms);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrGwbmManager(HrGwbmManager hrGwbmManager) {
        this.hrGwbmManager = hrGwbmManager;
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
