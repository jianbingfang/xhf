package com.xthena.auth.manager;

import com.xthena.auth.domain.Role;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class RoleManager extends HibernateEntityDao<Role> {
}
