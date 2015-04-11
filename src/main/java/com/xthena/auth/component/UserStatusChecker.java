package com.xthena.auth.component;

import com.xthena.auth.domain.UserStatus;
import com.xthena.auth.support.CheckUserStatusException;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;

import org.springframework.stereotype.Component;

@Component
public class UserStatusChecker implements MessageSourceAware {
    private MessageSourceAccessor messages;

    public void check(UserStatus userStatus) {
        if ((userStatus.getId() != null) && (userStatus.getId() == 1)) {
            throw new CheckUserStatusException(messages.getMessage(
                    "user.superuser.edit", "不允许修改超级管理员"));
        }
    }

    @Override
	public void setMessageSource(MessageSource messageSource) {
        this.messages = new MessageSourceAccessor(messageSource);
    }
}
