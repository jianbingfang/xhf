package com.xthena.jl.manager;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.domain.JlShiZhongAndFujianArray;
import com.xthena.jl.domain.JlShizhong;
import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.SessionUtil;
import com.xthena.util.manager.CodeGenManager;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.mapper.BeanMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JlShizhongManager extends HibernateEntityDao<JlShizhong> {

	private BeanMapper beanMapper = new BeanMapper();
	 
	@Autowired
	private JlFujianManager jlFujianManager;
	
	@Autowired
	private CodeGenManager codeGenManager;
	
	@Autowired
	private UserConnector userConnector;
	
	@Autowired
	private JlDeptManager jlDeptManager;
	
	public void saveJlShizhongAndFujian(
			JlShiZhongAndFujianArray jlShiZhongAndFujianArray,HttpServletRequest request) {

        JlShizhong dest = null;
       Long id = jlShiZhongAndFujianArray.getJlShizhong().getFid();
        if (id != null) {
            dest = get(id);
            beanMapper.copy(jlShiZhongAndFujianArray.getJlShizhong(), dest);
        } else {
            dest = jlShiZhongAndFujianArray.getJlShizhong();
            dest.setFno(CodeUtil.getSysYearCode(ConstValue.SYS_XM_WENJIAN, 6, codeGenManager));
            dest.setFuploaddate(new Date());
            dest.setFuploadname(Long.parseLong(SpringSecurityUtils.getCurrentUserId()));
            dest.setFxmid(jlDeptManager.getXmId(request));
        }

        save(dest);
        
        JlFujian[] jlFujian=jlShiZhongAndFujianArray.getJlFujian();
        if(jlFujian!=null){
	        for(JlFujian jlFujian2:jlFujian){
	        	jlFujian2.setFtablename("t_jl_shizhong");
	        	jlFujian2.setFmainid(dest.getFid());
	        	jlFujianManager.save(jlFujian2);
	        }
        }
		
	}
}
