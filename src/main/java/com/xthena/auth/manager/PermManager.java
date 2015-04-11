package com.xthena.auth.manager;

import com.xthena.auth.domain.Perm;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class PermManager extends HibernateEntityDao<Perm> {
}
