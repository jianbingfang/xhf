package com.xthena.user.notification;

import com.xthena.user.persistence.domain.UserBase;

public interface UserNotification {
    void insertUser(UserBase userBase);

    void updateUser(UserBase userBase);

    void removeUser(UserBase userBase);
}
