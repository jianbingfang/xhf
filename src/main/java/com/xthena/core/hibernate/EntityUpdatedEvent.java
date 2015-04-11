package com.xthena.core.hibernate;

public class EntityUpdatedEvent extends EntityEvent {
    private static final long serialVersionUID = 0L;

    public EntityUpdatedEvent(Object entity) {
        super(entity);
    }

    @Override
	public boolean isUpdated() {
        return true;
    }
}
