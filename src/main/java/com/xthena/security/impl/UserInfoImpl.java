package com.xthena.security.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xthena.security.api.UserInfo;

public class UserInfoImpl implements UserInfo {
    private String id;
    private String username;
    private String displayName;
    private String password;
    private String scopeId;
    private List<String> authorities;
    private List<String> attributes;
    private Map<String, Object> extra = new HashMap<String, Object>();

    @Override
	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
	public String getScopeId() {
        return scopeId;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }

    @Override
	public List<String> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<String> authorities) {
        this.authorities = authorities;
    }

    @Override
	public List<String> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<String> attributes) {
        this.attributes = attributes;
    }

    @Override
	public Map<String, Object> getExtra() {
        return extra;
    }

    public void setExtra(Map<String, Object> extra) {
        this.extra = extra;
    }

    public Object getExtraItem(String key) {
        return extra.get(key);
    }

    public void putExtraItem(String key, Object value) {
        extra.put(key, value);
    }
}
