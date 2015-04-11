package com.xthena.user.persistence.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.user.persistence.domain.UserBase;

import org.springframework.stereotype.Service;

@Service
public class UserBaseManager extends HibernateEntityDao<UserBase> {
}
