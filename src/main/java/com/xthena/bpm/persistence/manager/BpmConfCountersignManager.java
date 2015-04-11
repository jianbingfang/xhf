package com.xthena.bpm.persistence.manager;

import com.xthena.bpm.persistence.domain.BpmConfCountersign;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class BpmConfCountersignManager extends
        HibernateEntityDao<BpmConfCountersign> {
}
