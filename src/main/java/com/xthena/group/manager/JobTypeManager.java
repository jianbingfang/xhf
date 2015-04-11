package com.xthena.group.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.group.domain.JobType;

import org.springframework.stereotype.Service;

@Service
public class JobTypeManager extends HibernateEntityDao<JobType> {
}
