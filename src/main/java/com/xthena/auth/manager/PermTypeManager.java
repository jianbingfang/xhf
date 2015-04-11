package com.xthena.auth.manager;

import com.xthena.auth.domain.PermType;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class PermTypeManager extends HibernateEntityDao<PermType> {
}
