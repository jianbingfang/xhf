package com.xthena.xz.manager;


import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.xz.domain.XzCar;
import com.xthena.xz.domain.XzCarWbrecord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzCarWbrecordManager extends HibernateEntityDao<XzCarWbrecord> {
	
	@Autowired
	private XzCarManager xCarManager;
	
	public void saveAndUpdeCar(XzCarWbrecord dest) {
		   XzCar xzCar= xCarManager.get(dest.getFcarid());
		   xzCar.setFwbdate(dest.getFwbdate());
	        xCarManager.save(xzCar);
	        save(dest);
		
	}
}
