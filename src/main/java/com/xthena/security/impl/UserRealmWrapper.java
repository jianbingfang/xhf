package com.xthena.security.impl;

import com.xthena.security.api.UserAuth;
import com.xthena.security.api.UserRealm;

public class UserRealmWrapper implements UserRealm {
    @Override
	public UserAuth login(String username, String password, String scopeId) {
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
}
