package com.xthena.party.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.party.domain.PartyEntity;

import org.springframework.stereotype.Service;

@Service
public class PartyEntityManager extends HibernateEntityDao<PartyEntity> {
}
