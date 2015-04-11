package com.xthena.group.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.group.domain.JobUser;

import org.springframework.stereotype.Service;

@Service
public class JobUserManager extends HibernateEntityDao<JobUser> {
}
