package com.xthena.msg.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.msg.domain.MsgInfo;

import org.springframework.stereotype.Service;

@Service
public class MsgInfoManager extends HibernateEntityDao<MsgInfo> {
}
