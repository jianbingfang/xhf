package com.xthena.xz.manager;

import com.xthena.xz.domain.XzCar;
import com.xthena.xz.domain.XzCarBxRecord;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzCarBxRecordManager extends HibernateEntityDao<XzCarBxRecord> {
	
	@Autowired
	private XzCarManager xCarManager;
	
	public void saveAndUpdeCar(XzCarBxRecord dest) {
		   XzCar xzCar= xCarManager.get(dest.getFcarid());
		   xzCar.setFwbdate(dest.getFbxdate());
	        xCarManager.save(xzCar);
	        save(dest);
	}
}
