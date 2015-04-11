package com.xthena.api;

public interface UserProcessor {
    void insertUser(String id, String username);

    void updateUser(String id, String username);

    void removeUser(String id);
}
