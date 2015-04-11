package com.xthena.security.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xthena.security.spi.UserStatusDetails;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserStatusDetailsImpl extends User implements UserStatusDetails {
    private String id;
    private String displayName;
    private String scopeId;
    private List<String> attributes = new ArrayList<String>();
    private Map<String, Collection<String>> attributeMap = new HashMap<String, Collection<String>>();

    public UserStatusDetailsImpl(String username, String password,
            boolean enabled, Collection<GrantedAuthority> authSet) {
        super(username, password, enabled, true, true, true, authSet);
    }

    @Override
	public Collection<String> getAttributes() {
        return attributes;
    }

    @Override
	public Collection<String> getAttributes(String type) {
        return attributeMap.get(type);
    }

    public void setAttributes(List<String> attributes) {
        this.attributes = attributes;

        for (String attribute : attributes) {
            String[] array = attribute.split("_");
            String type = array[0];
            String value = array[1];
            Collection<String> collection = attributeMap.get(type);

            if (collection == null) {
                collection = new ArrayList<String>();
                attributeMap.put(type, collection);
            }

            collection.add(value);
        }
    }

    @Override
	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    @Override
	public String getScopeId() {
        return scopeId;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }
}
