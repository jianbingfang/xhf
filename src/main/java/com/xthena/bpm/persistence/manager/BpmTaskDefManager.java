package com.xthena.bpm.persistence.manager;

import com.xthena.bpm.persistence.domain.BpmTaskDef;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class BpmTaskDefManager extends HibernateEntityDao<BpmTaskDef> {
}
