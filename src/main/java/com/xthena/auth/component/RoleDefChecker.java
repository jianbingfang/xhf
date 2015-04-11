package com.xthena.auth.component;

import com.xthena.auth.domain.RoleDef;
import com.xthena.auth.support.CheckRoleException;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;

import org.springframework.stereotype.Component;

@Component
public class RoleDefChecker implements MessageSourceAware {
    private MessageSourceAccessor messages;

    public void check(RoleDef roleDef) {
        if ((roleDef.getId() != null) && (roleDef.getId() == 1)) {
            throw new CheckRoleException(messages.getMessage(
                    "auth.superuser.edit", "不允许修改超级管理员角色"));
        }
    }

    @Override
	public void setMessageSource(MessageSource messageSource) {
        this.messages = new MessageSourceAccessor(messageSource);
    }
}
