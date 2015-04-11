package com.xthena.user.persistence.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.user.persistence.domain.UserSchema;

import org.springframework.stereotype.Service;

@Service
public class UserSchemaManager extends HibernateEntityDao<UserSchema> {
}
