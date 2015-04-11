package com.xthena.xz.manager;

import com.xthena.xz.domain.XzRyzs;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzRyzsManager extends HibernateEntityDao<XzRyzs> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzRyzs entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
