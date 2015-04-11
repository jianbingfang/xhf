package com.xthena.core.hibernate;

public class EntityCreatedEvent extends EntityEvent {
    private static final long serialVersionUID = 0L;

    public EntityCreatedEvent(Object entity) {
        super(entity);
    }

    @Override
	public boolean isCreated() {
        return true;
    }
}
