package com.xthena.xz.manager;

import com.xthena.xz.domain.XzZbtzs;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzZbtzsManager extends HibernateEntityDao<XzZbtzs> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzZbtzs entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
