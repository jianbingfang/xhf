package com.xthena.auth.component;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.xthena.api.scope.ScopeConnector;
import com.xthena.api.scope.ScopeDTO;

import com.xthena.auth.domain.Role;
import com.xthena.auth.domain.UserStatus;
import com.xthena.auth.support.UserStatusDTO;

import org.springframework.stereotype.Component;

@Component
public class UserStatusConverter {
    private ScopeConnector scopeConnector;

    public UserStatusDTO createUserStatusDto(UserStatus userStatus,
            String userRepoRef, String scopeId) {
        UserStatusDTO userStatusDto = new UserStatusDTO();
        userStatusDto.setId(userStatus.getId());
        userStatusDto.setUsername(userStatus.getUsername());
        userStatusDto.setEnabled(Integer.valueOf(1).equals(
                userStatus.getStatus()));
        userStatusDto.setRef(userStatus.getRef());

        StringBuilder buff = new StringBuilder();

        for (Role role : userStatus.getRoles()) {
            if (scopeId.equals(role.getScopeId())) {
                buff.append(role.getName()).append(",");
            } else {
                ScopeDTO scopeDto = scopeConnector.findById(role.getScopeId());
                buff.append(role.getName()).append("(")
                        .append(scopeDto.getName()).append("),");
            }
        }

        if (buff.length() > 0) {
            buff.deleteCharAt(buff.length() - 1);
        }

        userStatusDto.setAuthorities(buff.toString());

        return userStatusDto;
    }

    public List<UserStatusDTO> createUserStatusDtos(
            List<UserStatus> userStatuses, String userRepoRef, String scopeId) {
        List<UserStatusDTO> userStatusDtos = new ArrayList<UserStatusDTO>();

        for (UserStatus userStatus : userStatuses) {
            userStatusDtos.add(createUserStatusDto(userStatus, userRepoRef,
                    scopeId));
        }

        return userStatusDtos;
    }

    @Resource
    public void setScopeConnector(ScopeConnector scopeConnector) {
        this.scopeConnector = scopeConnector;
    }
}
