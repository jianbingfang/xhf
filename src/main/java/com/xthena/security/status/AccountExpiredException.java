package com.xthena.security.status;

public class AccountExpiredException extends UserStatusException {
    public AccountExpiredException(String message) {
        super(message);
    }
}
