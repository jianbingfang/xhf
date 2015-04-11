package com.xthena.form.manager;

import com.xthena.core.hibernate.HibernateEntityDao;

import com.xthena.form.domain.FormTemplate;

import org.springframework.stereotype.Service;

@Service
public class FormTemplateManager extends HibernateEntityDao<FormTemplate> {
}
