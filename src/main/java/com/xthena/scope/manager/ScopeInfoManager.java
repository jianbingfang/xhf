package com.xthena.scope.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.scope.domain.ScopeInfo;

import org.springframework.stereotype.Service;

@Service
public class ScopeInfoManager extends HibernateEntityDao<ScopeInfo> {
}
