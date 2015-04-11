package com.xthena.group.support;

import com.xthena.api.GroupProcessor;

public class EmptyGroupProcessor implements GroupProcessor {
    @Override
	public void insertGroup(String id, String name) {
    }

    @Override
	public void updateGroup(String id, String name) {
    }

    @Override
	public void removeGroup(String id) {
    }
}
