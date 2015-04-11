package com.xthena.cal.manager;

import com.xthena.cal.domain.CalInfo;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class CalInfoManager extends HibernateEntityDao<CalInfo> {
}
