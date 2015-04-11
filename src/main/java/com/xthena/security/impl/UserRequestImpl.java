package com.xthena.security.impl;

import com.xthena.security.api.UserRequest;

public class UserRequestImpl implements UserRequest {
    private String id;
    private String scopeId;
    private String username;
    private String password;

    @Override
	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
	public String getScopeId() {
        return scopeId;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }

    @Override
	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
