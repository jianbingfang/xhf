package com.xthena.user.persistence.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.user.persistence.domain.UserRepo;

import org.springframework.stereotype.Service;

@Service
public class UserRepoManager extends HibernateEntityDao<UserRepo> {
}
