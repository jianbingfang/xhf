package com.xthena.user.persistence.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.user.persistence.domain.UserAttr;

import org.springframework.stereotype.Service;

@Service
public class UserAttrManager extends HibernateEntityDao<UserAttr> {
}
