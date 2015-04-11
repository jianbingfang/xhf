package com.xthena.auth.component;

import javax.annotation.Resource;

import com.xthena.api.userauth.UserAuthCache;
import com.xthena.api.userauth.UserAuthDTO;

import com.xthena.auth.domain.Perm;
import com.xthena.auth.domain.Role;
import com.xthena.auth.domain.RoleDef;
import com.xthena.auth.domain.UserStatus;

import org.springframework.stereotype.Component;

@Component
public class AuthCache {
    private UserAuthCache userAuthCache;

    public void evictUserStatus(UserStatus userStatus) {
        UserAuthDTO userAuthDto = new UserAuthDTO();
        userAuthDto.setId(Long.toString(userStatus.getId()));
        userAuthDto.setUsername(userStatus.getUsername());
        userAuthDto.setRef(userStatus.getRef());
        userAuthDto.setScopeId(userStatus.getScopeId());
        userAuthCache.removeUserAuth(userAuthDto);
    }

    public void evictRole(Role role) {
        for (UserStatus userStatus : role.getUserStatuses()) {
            evictUserStatus(userStatus);
        }
    }

    public void evictPerm(Perm perm) {
        for (RoleDef roleDef : perm.getRoleDefs()) {
            for (Role role : roleDef.getRoles()) {
                evictRole(role);
            }
        }
    }

    @Resource
    public void setUserAuthCache(UserAuthCache userAuthCache) {
        this.userAuthCache = userAuthCache;
    }
}
