package com.xthena.hr.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.hr.domain.HrRyZj;
import com.xthena.xz.manager.XzZjDxlistManager;

@Service
public class HrRyZjManager extends HibernateEntityDao<HrRyZj> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(HrRyZj entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
