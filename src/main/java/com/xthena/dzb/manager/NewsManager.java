package com.xthena.dzb.manager;

import com.xthena.dzb.domain.News;

import com.xthena.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class NewsManager extends HibernateEntityDao<News> {
}
