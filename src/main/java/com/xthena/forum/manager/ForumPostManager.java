package com.xthena.forum.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.forum.domain.ForumPost;

import org.springframework.stereotype.Service;

@Service
public class ForumPostManager extends HibernateEntityDao<ForumPost> {
}
