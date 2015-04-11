package com.xthena.party.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.party.domain.PartyType;

import org.springframework.stereotype.Service;

@Service
public class PartyTypeManager extends HibernateEntityDao<PartyType> {
}
