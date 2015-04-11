package com.xthena.core.hibernate;

public class EntityRemovedEvent extends EntityEvent {
    private static final long serialVersionUID = 0L;

    public EntityRemovedEvent(Object entity) {
        super(entity);
    }

    @Override
	public boolean isRemoved() {
        return true;
    }
}
