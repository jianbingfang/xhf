package com.xthena.xz.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.xz.domain.XzXjpy;

@Service
public class XzXjpyManager extends HibernateEntityDao<XzXjpy> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzXjpy entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
