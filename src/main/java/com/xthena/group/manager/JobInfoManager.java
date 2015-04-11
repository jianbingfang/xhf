package com.xthena.group.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.group.domain.JobInfo;

import org.springframework.stereotype.Service;

@Service
public class JobInfoManager extends HibernateEntityDao<JobInfo> {
}
