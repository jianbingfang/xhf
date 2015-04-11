package com.xthena.security.impl;

import com.xthena.security.api.UserAuth;
import com.xthena.security.api.UserRealm;

import org.springframework.jdbc.core.JdbcTemplate;

public class DatabaseUserRealm implements UserRealm {
    private JdbcTemplate jdbcTemplate;

    @Override
	public UserAuth login(String username, String password, String scopeId) {
        return null;
    }

    public UserAuth findByUsername(String username, String scopeId) {
        return null;
    }

    @Override
	public UserAuth findByRef(String ref, String scopeId) {
        return null;
    }

    @Override
	public UserAuth findById(String id, String scopeId) {
        return null;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
