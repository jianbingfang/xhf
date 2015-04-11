package com.xthena.security.status;

public class AccountLockedException extends UserStatusException {
    public AccountLockedException(String message) {
        super(message);
    }
}
