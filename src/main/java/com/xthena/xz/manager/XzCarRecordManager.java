package com.xthena.xz.manager;

import com.xthena.xz.domain.XzCar;
import com.xthena.xz.domain.XzCarRecord;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzCarRecordManager extends HibernateEntityDao<XzCarRecord> {
	@Autowired
	private XzCarManager xCarManager;
	
	public void saveAndUpdeCar(XzCarRecord dest) {
		   XzCar xzCar=   xCarManager.get(dest.getFcarid());
	        xzCar.setFuser(dest.getFry());
	        xzCar.setFtotalkm(dest.getFtotalkm());
	        xCarManager.save(xzCar);
	        save(dest);
	}
}
