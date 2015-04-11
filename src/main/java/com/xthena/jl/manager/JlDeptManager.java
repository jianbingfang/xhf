package com.xthena.jl.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.xthena.gcgl.domain.PjXm;
import com.xthena.jl.domain.JlDept;
import com.xthena.security.util.PasswordEncoderFactoryBean;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.user.persistence.domain.UserBase;
import com.xthena.user.persistence.manager.UserBaseManager;
import com.xthena.user.service.UserService;
import com.xthena.util.PjXmMapUtil;
import com.xthena.api.user.UserDTO;
import com.xthena.auth.service.AuthService;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.util.ServletUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JlDeptManager extends HibernateEntityDao<JlDept> {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserBaseManager userBaseManager;
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	private PasswordEncoderFactoryBean passwordEncoderFactoryBean;
	
	public void saveUser(JlDept jlDept) {
		
			UserBase userBase=null;
			//如果为新建用户
			if(jlDept.getFid()==null){
				userBase=new UserBase();
				userBase.setUsername(jlDept.getFloginname());
				userBase.setPassword(passwordEncoderFactoryBean.getSimplePasswordEncoder().encode(jlDept.getFloginpass()));
				userBase.setStatus(1);
				userBase.setDisplayName(PjXmMapUtil.getXmMap().get(jlDept.getFxmid()).getFxmname());
				userService.insertUser(userBase, 1L, new HashMap<String,Object>());
				super.save(jlDept);
			}else{
				JlDept oldJlDept=get(jlDept.getFid());
				userBase= userBaseManager.findUniqueBy("username", oldJlDept.getFloginname());
				   if (userBase != null) {
					   userBase.setUsername(jlDept.getFloginname());
					   userBase.setPassword(passwordEncoderFactoryBean.getSimplePasswordEncoder().encode(jlDept.getFloginpass()));
			           userService.updateUser(userBase,  1L, new HashMap<String,Object>());
			        } 
					oldJlDept.setFloginname(jlDept.getFloginname());
					oldJlDept.setFloginpass(jlDept.getFloginpass());
					super.save(oldJlDept);
			}
			 userBase.setRef(userBase.getId().toString());
			  userService.updateUser(userBase,  1L, new HashMap<String,Object>());
			
			//最后两个参数不明白啥意思 暂时写死
			authService.createOrGetUserStatus(jlDept.getFloginname(), userBase.getId().toString(), "1", "1");

	
	}
	
	public long getXmId(HttpServletRequest httpServletRequest){
		if(httpServletRequest.getSession().getAttribute("current_xm_id")==null){
			String userName=SpringSecurityUtils.getCurrentUser().getUsername();
			JlDept jlDept=findUniqueBy("floginname",userName);
			if(jlDept==null){
				return -1;
			}
			Long xmid=jlDept.getFxmid();
			httpServletRequest.getSession().setAttribute("current_xm_id", xmid);
		}
		
		return Long.parseLong(String.valueOf(httpServletRequest.getSession().getAttribute("current_xm_id")));
	}
	
	public void setXmId(HttpServletRequest httpServletRequest,long xmid){
		httpServletRequest.getSession().setAttribute("current_xm_id", xmid);
	}
}
