package com.xthena.xz.manager;

import com.xthena.xz.domain.XzRedTape;
import com.xthena.xz.domain.XzRyzs;
import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class XzRedTapeManager extends HibernateEntityDao<XzRedTape> {
	@Autowired
    private XzZjDxlistManager xzZjDxlistManager;
	
	public void mysave(XzRedTape entity) {
		super.save(entity);
		xzZjDxlistManager.mysave(entity);
	}
}
