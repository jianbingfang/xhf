package com.xthena.xz.manager;

import com.xthena.xz.domain.XzCar;
import com.xthena.xz.domain.XzCarSc;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzCarScManager extends HibernateEntityDao<XzCarSc> {
	
	@Autowired
	private XzCarManager xCarManager;
	
	public void saveAndUpdeCar(XzCarSc dest) {
		   XzCar xzCar= xCarManager.get(dest.getFcarid());
		   xzCar.setFscdate(dest.getFscdate());
	        xCarManager.save(xzCar);
	        save(dest);
		
	}
}
