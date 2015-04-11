package com.xthena.jl.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.domain.JlShiqian;
import com.xthena.jl.domain.JlShiqianArray;
import com.xthena.util.CodeUtil;
import com.xthena.util.ConstValue;
import com.xthena.util.SessionUtil;
import com.xthena.util.manager.CodeGenManager;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.core.hibernate.PropertyFilter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JlShiqianManager extends HibernateEntityDao<JlShiqian> {
	
	@Autowired
	private JlFujianManager jlFujianManager;
	
	@Autowired
	private CodeGenManager codeGenManager;
	
	@Autowired
	private JlDeptManager jlDeptManager;

	public void saveMore(JlShiqianArray jlShiqianArray, UserConnector userConnector,HttpServletRequest request) {
		
		
		for(JlShiqian jlShiqian:jlShiqianArray.getJlShiqian()){
			jlShiqian.setFxmid(jlDeptManager.getXmId(request));
			save(jlShiqian);
			
			if(jlShiqian.getFfilename()!=null){
				
				Map<String, Object> parameterMap=new HashMap<String, Object>();   
        		parameterMap=new HashMap<String, Object>();
               	parameterMap.put("filter_EQS_ftablename", "t_jl_shiqian");
               	parameterMap.put("filter_EQL_fmainid", jlShiqian.getFid());
                List<PropertyFilter> propertyFilters  = PropertyFilter
                        .buildFromMap(parameterMap);
               	List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
               	JlFujian jlFujian=null;
               	if(jlFujians.isEmpty()){
               		jlFujian=new JlFujian();
               	}else{
               		jlFujian=jlFujians.get(0);
               	}
				jlFujian.setFname(jlShiqian.getFfilename());
				jlFujian.setFurl(jlShiqian.getFfileurl());
				jlFujian.setFmainid(jlShiqian.getFid());
				jlFujian.setFtablename("t_jl_shiqian");
				jlFujianManager.save(jlFujian);
			}
		}
	}

	public void saveFujianAndSHIQIANMain(JlFujian dest,String shiqianType) {
		Map<String, Object> parameterMap=new HashMap<String, Object>();
		parameterMap.put("filter_EQS_fitem", dest.getFfujiantype());
    	parameterMap.put("filter_EQL_fxmid",dest.getFxmid());
    	dest.setFfileno(CodeUtil.getSysMothCode(ConstValue.SYS_CODE_XM+dest.getFxmid(), 6, codeGenManager));
    	dest.setFuploaddate(new Date());
    	dest.setFtablename("t_jl_shiqian");
    	 List<PropertyFilter> propertyFilters = PropertyFilter
                 .buildFromMap(parameterMap);
         List<JlShiqian> shiqians= find(propertyFilters);
         
         if(shiqians.isEmpty()){
        	 JlShiqian jlShiqian=new JlShiqian();
        	 jlShiqian.setFitem(dest.getFfujiantype());
        	 jlShiqian.setFtype(shiqianType);
        	 jlShiqian.setFxmid(dest.getFxmid());
        	 save(jlShiqian);
        	 dest.setFmainid(jlShiqian.getFid());
         }else{
        	 dest.setFmainid(shiqians.get(0).getFid());
         }
         
         jlFujianManager.save(dest);
	}
}
