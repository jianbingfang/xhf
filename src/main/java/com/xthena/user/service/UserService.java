package com.xthena.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Map;

import javax.annotation.Resource;

import com.xthena.api.scope.ScopeHolder;

import com.xthena.user.notification.DefaultUserNotification;
import com.xthena.user.notification.UserNotification;
import com.xthena.user.persistence.domain.UserAttr;
import com.xthena.user.persistence.domain.UserBase;
import com.xthena.user.persistence.domain.UserSchema;
import com.xthena.user.persistence.manager.UserAttrManager;
import com.xthena.user.persistence.manager.UserBaseManager;
import com.xthena.user.persistence.manager.UserRepoManager;
import com.xthena.user.persistence.manager.UserSchemaManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);
    private UserBaseManager userBaseManager;
    private UserRepoManager userRepoManager;
    private UserAttrManager userAttrManager;
    private UserSchemaManager userSchemaManager;
    private UserNotification userNotification = new DefaultUserNotification();

    public void insertUser(UserBase userBase, Long userRepoId,
            Map<String, Object> parameters) {
        // user repo
        userBase.setUserRepo(userRepoManager.get(userRepoId));

        userBase.setScopeId(ScopeHolder.getScopeId());
        userBaseManager.save(userBase);

        for (Map.Entry<String, Object> entry : parameters.entrySet()) {
            String key = entry.getKey();
            String value = (String) entry.getValue();

            UserSchema userSchema = userSchemaManager.findUnique(
                    "from UserSchema where code=? and userRepo.id=?", key,
                    userRepoId);
            UserAttr userAttr = new UserAttr();
            userAttr.setUserSchema(userSchema);
            userAttr.setUserBase(userBase);
            userAttr.setScopeId(ScopeHolder.getScopeId());
            userAttrManager.save(userAttr);

            String type = userSchema.getType();

            if ("boolean".equals(type)) {
                userAttr.setBooleanValue(Integer.parseInt(value));
            } else if ("date".equals(type)) {
                try {
                    userAttr.setDateValue(new SimpleDateFormat("yyyy-MM-dd")
                            .parse(value));
                } catch (ParseException ex) {
                    logger.info(ex.getMessage(), ex);
                }
            } else if ("long".equals(type)) {
                userAttr.setLongValue(Long.parseLong(value));
            } else if ("double".equals(type)) {
                userAttr.setDoubleValue(Double.parseDouble(value));
            } else if ("string".equals(type)) {
                userAttr.setStringValue(value);
            } else {
                throw new IllegalStateException("illegal type: "
                        + userSchema.getType());
            }

            userAttrManager.save(userAttr);
        }

        userNotification.insertUser(userBase);
    }

    public void updateUser(UserBase userBase, Long userRepoId,
            Map<String, Object> parameters) {
        // user repo
        userBase.setUserRepo(userRepoManager.get(userRepoId));
        userBaseManager.save(userBase);

        for (Map.Entry<String, Object> entry : parameters.entrySet()) {
            String key = entry.getKey();
            String value = (String) entry.getValue();

            UserSchema userSchema = userSchemaManager.findUnique(
                    "from UserSchema where code=? and userRepo.id=?", key,
                    userRepoId);
            UserAttr userAttr = userAttrManager.findUnique(
                    "from UserAttr where userSchema=? and userBase=?",
                    userSchema, userBase);

            if (userAttr == null) {
                userAttr = new UserAttr();
                userAttr.setUserSchema(userSchema);
                userAttr.setUserBase(userBase);
                userAttr.setScopeId(ScopeHolder.getScopeId());
            }

            String type = userSchema.getType();

            if ("boolean".equals(type)) {
                userAttr.setBooleanValue(Integer.parseInt(value));
            } else if ("date".equals(type)) {
                try {
                    userAttr.setDateValue(new SimpleDateFormat("yyyy-MM-dd")
                            .parse(value));
                } catch (ParseException ex) {
                    logger.info(ex.getMessage(), ex);
                }
            } else if ("long".equals(type)) {
                userAttr.setLongValue(Long.parseLong(value));
            } else if ("double".equals(type)) {
                userAttr.setDoubleValue(Double.parseDouble(value));
            } else if ("string".equals(type)) {
                userAttr.setStringValue(value);
            } else {
                throw new IllegalStateException("illegal type: "
                        + userSchema.getType());
            }

            userAttrManager.save(userAttr);
        }

        userNotification.updateUser(userBase);
    }

    public void removeUser(UserBase userBase) {
        userBaseManager.removeAll(userBase.getUserAttrs());
        userBaseManager.remove(userBase);
        userNotification.removeUser(userBase);
    }

    @Resource
    public void setUserBaseManager(UserBaseManager userBaseManager) {
        this.userBaseManager = userBaseManager;
    }

    @Resource
    public void setUserRepoManager(UserRepoManager userRepoManager) {
        this.userRepoManager = userRepoManager;
    }

    @Resource
    public void setUserAttrManager(UserAttrManager userAttrManager) {
        this.userAttrManager = userAttrManager;
    }

    @Resource
    public void setUserSchemaManager(UserSchemaManager userSchemaManager) {
        this.userSchemaManager = userSchemaManager;
    }

    @Autowired(required = false)
    public void setUserNotification(UserNotification userNotification) {
        this.userNotification = userNotification;
    }
}
