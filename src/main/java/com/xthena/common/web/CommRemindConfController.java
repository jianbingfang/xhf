package  com.xthena.common.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;
import com.xthena.auth.domain.Role;
import com.xthena.auth.manager.RoleManager;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.group.manager.OrgDepartmentManager;
import com.xthena.hr.manager.HrGwbmManager;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.JsonResponseUtil;
import com.xthena.common.domain.CommRemindConf;
import com.xthena.common.manager.CommRemindConfManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("comm")
public class CommRemindConfController {
    private CommRemindConfManager commRemindconfManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    
    
    @Autowired
    private OrgDepartmentManager orgDepartmentManager;
    
    
    @Autowired
    private HrGwbmManager hrGwbmManager;
    
    
    @Autowired
    private RoleManager roleManager;

    @RequestMapping("commRemindconf-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindconfManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commRemindconf-info-list";
    }

    @RequestMapping("commRemindconf-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommRemindConf commRemindconf = commRemindconfManager.get(id);
            model.addAttribute("model", commRemindconf);
        }

        return "comm/commRemindconf-info-input";
    }
	
    @RequestMapping("loadDept")
    public void loadDept(HttpServletResponse response){
    	JsonResponseUtil.write(response,orgDepartmentManager.getAll());
    }
    
    @RequestMapping("loadHrGwbm")
    public void loadHrGwbm(HttpServletResponse response){
    	JsonResponseUtil.write(response,hrGwbmManager.getAll());
    }
    
    @RequestMapping("loadRole")
    public void loadRole(HttpServletResponse response){
    	List<HashMap<String,Object>> roleMapList=new ArrayList<HashMap<String, Object>>();
    	List<Role> roleList=roleManager.getAll();
    	for(Role role:roleList){
    		HashMap<String,Object> roleMap=new HashMap<String,Object>();
    		roleMap.put("id",role.getId());
    		roleMap.put("name",role.getName());
    		roleMapList.add(roleMap);
    	}
    	JsonResponseUtil.write(response,roleMapList);
    }
    
    
    @RequestMapping("commRemindconf-info-save")
    public String save(@ModelAttribute CommRemindConf commRemindconf,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
       
    	CommRemindConf dest = null;

        Long id = commRemindconf.getFid();

        if (id != null) {
            dest = commRemindconfManager.get(id);
            beanMapper.copy(commRemindconf, dest);
        } else {
            dest = commRemindconf;
        }

        commRemindconfManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/comm/commRemindconf-info-list.do";
    }

    @RequestMapping("commRemindconf-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommRemindConf> commRemindconfs = commRemindconfManager.findByIds(selectedItem);

        commRemindconfManager.removeAll(commRemindconfs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/comm/commRemindconf-info-list.do";
    }

    @RequestMapping("commRemindconf-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commRemindconfManager.pagedQuery(page, propertyFilters);

        List<CommRemindConf> commRemindconfs = (List<CommRemindConf>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commRemindconf info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commRemindconfs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommRemindConfManager(CommRemindConfManager commRemindconfManager) {
        this.commRemindconfManager = commRemindconfManager;
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
