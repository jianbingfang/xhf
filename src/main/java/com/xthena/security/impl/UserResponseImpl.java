package com.xthena.security.impl;

import java.util.List;

import com.xthena.security.api.UserResponse;

public class UserResponseImpl implements UserResponse {
    private String id;
    private String scopeId;
    private String username;
    private String displayName;
    private String status;
    private List<String> permissions;
    private List<String> roles;

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
	public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    @Override
	public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
	public List<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<String> permissions) {
        this.permissions = permissions;
    }

    @Override
	public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}
