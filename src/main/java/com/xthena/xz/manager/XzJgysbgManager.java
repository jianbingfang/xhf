package com.xthena.xz.manager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.xz.domain.XzJgysbg;

@Service
public class XzJgysbgManager extends HibernateEntityDao<XzJgysbg> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzJgysbg entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
