package com.xthena.auth.manager;

import com.xthena.auth.domain.UserStatus;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class UserStatusManager extends HibernateEntityDao<UserStatus> {
}
