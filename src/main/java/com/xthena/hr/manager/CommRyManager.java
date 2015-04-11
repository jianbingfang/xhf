package com.xthena.hr.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xthena.core.hibernate.HibernateEntityDao;
import com.xthena.hr.domain.CommRy;
import com.xthena.xz.manager.XzZjDxlistManager;

@Service
public class CommRyManager extends HibernateEntityDao<CommRy> {
}
