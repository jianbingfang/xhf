package com.xthena.gcgl.manager;

import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.domain.PjRyRecord;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PjRyRecordManager extends HibernateEntityDao<PjRyRecord> {
	
	@Autowired 
	private PjRyManager pjRyManager;

	public void saveAndPjRy(PjRyRecord pjRyRecord) {
		 	
		  	PjRy pjRy=pjRyManager.findUnique("select pjry from PjRy pjry where fxmid=? and fryid=?", pjRyRecord.getFdrxm(),pjRyRecord.getFryid());
		
			if(pjRy==null){
				pjRy=new PjRy();
				pjRy.setFryid(pjRyRecord.getFryid());
				pjRy.setFxmid(pjRyRecord.getFdrxm());
			}
			
			pjRy.setFgangwei(pjRyRecord.getFdrgw());
			pjRy.setFstartdate(pjRyRecord.getFdbdate());
			pjRy.setFstatus("在岗");
	        
	        
	       
	        PjRy pjRy2=pjRyManager.findUnique("select pjry from PjRy pjry where fxmid=? and fryid=?", pjRyRecord.getFdcxm(),pjRyRecord.getFryid());
	        pjRy2.setFenddate(pjRyRecord.getFdbdate());
	        pjRy2.setFstatus("离岗");
	        
	        pjRyManager.save(pjRy);
	        pjRyManager.save(pjRy2);
	        super.save(pjRyRecord);
	        
	}
}
