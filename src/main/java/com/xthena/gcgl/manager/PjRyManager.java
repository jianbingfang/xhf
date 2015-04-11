package com.xthena.gcgl.manager;

import java.util.List;

import com.xthena.gcgl.domain.PjRy;
import com.xthena.gcgl.domain.PjRyRecord;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PjRyManager extends HibernateEntityDao<PjRy> {

	
	
	 @Autowired
	 private PjRyRecordManager pjRyRecordManager;
	 
	public void saveAndRecord(PjRy dest, PjRyRecord pjRyRecord) {
		super.save(dest);
		pjRyRecordManager.save(pjRyRecord);
	}

	public void saveSub(PjRy dest) {
		List<PjRy> pjRies=find("select pjry from PjRy pjry where fryid = ? and fstatus='在岗'", dest.getFryid());
		
		for(PjRy pjRy:pjRies){
			pjRy.setFenddate(dest.getFstartdate());
			pjRy.setFstatus("离岗");
			save(pjRy);
			
			PjRyRecord pjRyRecord=new PjRyRecord();
			pjRyRecord.setFdbdate(dest.getFstartdate());
			pjRyRecord.setFdcxm(pjRy.getFxmid());
			pjRyRecord.setFryid(dest.getFryid());
			pjRyRecord.setFlzxm(dest.getFxmid());
			
			pjRyRecordManager.save(pjRyRecord);
		}
		
	}
}
