package com.xthena.security.status;

public class CredentialExpiredException extends UserStatusException {
    public CredentialExpiredException(String message) {
        super(message);
    }
}
