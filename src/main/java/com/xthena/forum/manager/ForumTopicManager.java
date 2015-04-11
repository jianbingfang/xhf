package com.xthena.forum.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.forum.domain.ForumTopic;

import org.springframework.stereotype.Service;

@Service
public class ForumTopicManager extends HibernateEntityDao<ForumTopic> {
}
