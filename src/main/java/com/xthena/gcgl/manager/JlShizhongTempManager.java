package com.xthena.gcgl.manager;

import com.xthena.gcgl.domain.JlShizhongTemp;
import com.xthena.common.domain.CommCfildsType;
import com.xthena.common.manager.CommCfildsManager;
import com.xthena.common.manager.CommCfildsTypeManager;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JlShizhongTempManager extends HibernateEntityDao<JlShizhongTemp> {

	
	@Autowired
	
	private CommCfildsTypeManager cfildsTypeManager;
	
	public void saveAndBuild(JlShizhongTemp dest) {
		super.save(dest);
		
		CommCfildsType commCfildsType=cfildsTypeManager.findUniqueBy("fcode", dest.getFid().toString());
		if(commCfildsType==null){
			commCfildsType=new CommCfildsType();
			commCfildsType.setFname(dest.getFname());
		}
		commCfildsType.setFtname("T_JL_SHIZHONG_NEW");
		commCfildsType.setFcode(dest.getFid().toString());
	
		cfildsTypeManager.saveAndInit(commCfildsType);
	}
}
