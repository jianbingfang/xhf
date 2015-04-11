package com.xthena.jl.manager;

import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.jl.domain.PjXmJd;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PjXmJdManager extends HibernateEntityDao<PjXmJd> {
	
	@Autowired
	private PjXmManager pjXmManager;

	public void saveJd(PjXmJd dest) {
		
		save(dest);
		
		PjXm pjXm= pjXmManager.get(dest.getFxmid());
		pjXm.setFxmjd(dest.getFjd().intValue());
		pjXmManager.save(pjXm);
		// TODO Auto-generated method stub
		
	}
}
