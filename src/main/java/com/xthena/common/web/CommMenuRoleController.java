package  com.xthena.common.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xthena.api.user.UserConnector;
import com.xthena.auth.domain.Role;
import com.xthena.auth.domain.UserStatus;
import com.xthena.auth.manager.UserStatusManager;
import com.xthena.common.domain.CommMenu;
import com.xthena.common.domain.CommMenuRole;
import com.xthena.common.manager.CommMenuManager;
import com.xthena.common.manager.CommMenuRoleManager;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.ConstValue;
import com.xthena.util.JsonResponseUtil;

@Controller
@RequestMapping("sysconf")
public class CommMenuRoleController {
    private CommMenuRoleManager commMenuRoleManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommMenuManager commMenuManager;
    
    @Autowired
    private UserStatusManager userStatusManager;
    
    @RequestMapping("menu-role-input")
    public String menuRoleInput(@ModelAttribute Page page,@RequestParam(value = "roleid", required = false) Long roleid,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	
    	List<CommMenu> commMenus=commMenuManager.getAll("forder", true);
    
    	parameterMap.put("filter_EQL_froleid", roleid);
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<CommMenuRole>  commMenuRoles= commMenuRoleManager.find( propertyFilters);
        
        Set<Long> menuIdSet=new HashSet<Long>();
        for(CommMenuRole commMenuRole:commMenuRoles){
        	menuIdSet.add(commMenuRole.getFmenuid());
        }
        
        LinkedHashMap<CommMenu, Boolean> commMenuChecked=new LinkedHashMap<CommMenu, Boolean>();
        for(CommMenu commMenu:commMenus){
        	if(menuIdSet.contains(commMenu.getFid())){
        		commMenuChecked.put(commMenu,true);
        	}else{
        		commMenuChecked.put(commMenu,false);
        	}
        }

        model.addAttribute("commMenuChecked", commMenuChecked);
        model.addAttribute("roleid", roleid);

        return "comm/menu-role-input";
    }
 
    
    @RequestMapping("menu-role-save")
    public String menuRoleSave(@RequestParam("selectedItem") List<Long> selectedItem,@RequestParam(value = "roleid", required = false) Long roleid,
            RedirectAttributes redirectAttributes) {
    	
    	commMenuRoleManager.batchUpdate("delete from CommMenuRole where froleid= ?", roleid);
    	for(Long menuid:selectedItem){
    		CommMenuRole commMenuRole=new CommMenuRole();
    		commMenuRole.setFmenuid(menuid);
    		commMenuRole.setFroleid(roleid);
    		commMenuRoleManager.save(commMenuRole);
    	}
    	
        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "保存成功");

        return "redirect:/auth/role-def-list.do";
    }
    
    @RequestMapping("listUserMenu")
    public void listUserMenu(HttpServletResponse response,HttpServletRequest request) {
    	
    	//查session以减少对数据库的查询
    	if(request.getSession().getAttribute(ConstValue.CURR_SESSION_MENU)!=null){
    		JsonResponseUtil.write(response,request.getSession().getAttribute(ConstValue.CURR_SESSION_MENU));
    		return;
    	}
    	
    	//查询sql
    	
    	String hql=" select DISTINCT commMenu from UserStatus userStatus,CommMenuRole commMenuRole,CommMenu commMenu,UserRole userRole " +
    			" where userStatus.id=userRole.id.userStatusId and userRole.id.roleId=commMenuRole.froleid and commMenuRole.fmenuid=commMenu.fid " +
    			" and userStatus.ref= ? order by forder ";
    	
    /*	String userId=SpringSecurityUtils.getCurrentUserId();
    	UserStatus userStatus = userStatusManager.findUniqueBy("ref",String.valueOf(userId));
    	Set<Role> roles=userStatus.getRoles();
    	List<Long> roleids=new ArrayList<Long>();
    	String roleidstr="";
    	for(Role role:roles){
    		roleidstr+=role.getId()+",";
    	}
    	System.out.println(SpringSecurityUtils.getRoles().contains("超级管理员"));
	   
    	 	Criterion criterion=Restrictions.in("froleid", roleids);
	    * List<CommMenuRole> commMenuRoles = commMenuRoleManager.find(CommMenuRole.class, criterion);
	    * 
    	
    	Map<String, Object> parameterMap=new HashMap<String, Object>();
    	parameterMap.put("filter_INL_froleid", roleidstr);
    	
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List<CommMenuRole> commMenuRoles=commMenuRoleManager.find(propertyFilters);
    	
    	
    	List<Long> menuIdList=new ArrayList<Long>();
    	for(CommMenuRole commMenuRole:commMenuRoles){
    		menuIdList.add(commMenuRole.getFmenuid());
    	}
    	
    	HashMap<String , Object> resultMap=new HashMap<String, Object>();
    	if(!menuIdList.isEmpty()){
	    	List<CommMenu> commMenus= commMenuManager.findByIds(menuIdList);
	    	resultMap.put("menus", commMenus);
    	}
    	resultMap.put("roles", roleids);*/
    	
    	//如果session木有
    	
    	HashMap<String , Object> resultMap=new HashMap<String, Object>();
    	List<CommMenu> commMenus= commMenuManager.find(hql, SpringSecurityUtils.getCurrentUserId());
    	resultMap.put("menus",commMenus);
    	request.getSession().setAttribute(ConstValue.CURR_SESSION_MENU, resultMap);
    	
    	JsonResponseUtil.write(response,resultMap);
    }
    
    @RequestMapping("commMenuRole-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commMenuRoleManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "comm/commMenuRole-info-list";
    }

    @RequestMapping("commMenuRole-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            CommMenuRole commMenuRole = commMenuRoleManager.get(id);
            model.addAttribute("model", commMenuRole);
        }

        return "comm/commMenuRole-info-input";
    }

    @RequestMapping("commMenuRole-info-save")
    public String save(@ModelAttribute CommMenuRole commMenuRole,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        CommMenuRole dest = null;

        Long id = commMenuRole.getFid();

        if (id != null) {
            dest = commMenuRoleManager.get(id);
            beanMapper.copy(commMenuRole, dest);
        } else {
            dest = commMenuRole;
        }

        commMenuRoleManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sysconf/commMenuRole-info-list.do";
    }

    @RequestMapping("commMenuRole-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<CommMenuRole> commMenuRoles = commMenuRoleManager.findByIds(selectedItem);

        commMenuRoleManager.removeAll(commMenuRoles);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sysconf/commMenuRole-info-list.do";
    }

    @RequestMapping("commMenuRole-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commMenuRoleManager.pagedQuery(page, propertyFilters);

        List<CommMenuRole> commMenuRoles = (List<CommMenuRole>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commMenuRole info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commMenuRoles);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommMenuRoleManager(CommMenuRoleManager commMenuRoleManager) {
        this.commMenuRoleManager = commMenuRoleManager;
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
