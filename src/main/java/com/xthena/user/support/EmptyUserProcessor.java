package com.xthena.user.support;

import com.xthena.api.UserProcessor;

public class EmptyUserProcessor implements UserProcessor {
    @Override
	public void insertUser(String id, String username) {
    }

    @Override
	public void updateUser(String id, String username) {
    }

    @Override
	public void removeUser(String id) {
    }
}
