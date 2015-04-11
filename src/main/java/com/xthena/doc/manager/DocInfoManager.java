package com.xthena.doc.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.doc.domain.DocInfo;

import org.springframework.stereotype.Service;

@Service
public class DocInfoManager extends HibernateEntityDao<DocInfo> {
}
