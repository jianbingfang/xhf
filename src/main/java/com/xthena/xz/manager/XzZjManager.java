package com.xthena.xz.manager;

import com.xthena.xz.domain.XzZj;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzZjManager extends HibernateEntityDao<XzZj> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzZj entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
