package com.xthena.auth.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import com.xthena.api.scope.ScopeConnector;
import com.xthena.api.scope.ScopeHolder;
import com.xthena.api.user.UserConnector;
import com.xthena.api.user.UserDTO;

import com.xthena.auth.component.UserStatusChecker;
import com.xthena.auth.component.UserStatusConverter;
import com.xthena.auth.domain.Role;
import com.xthena.auth.domain.UserStatus;
import com.xthena.auth.manager.RoleManager;
import com.xthena.auth.manager.UserStatusManager;
import com.xthena.auth.service.AuthService;
import com.xthena.auth.support.CheckUserStatusException;
import com.xthena.auth.support.RoleDTO;

import com.xthena.core.spring.MessageHelper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("auth")
public class UserConnectorBatchController {
    private static Logger logger = LoggerFactory
            .getLogger(UserConnectorBatchController.class);
    private UserStatusManager userStatusManager;
    private MessageHelper messageHelper;
    private UserStatusConverter userStatusConverter;
    private ScopeConnector scopeConnector;
    private UserStatusChecker userStatusChecker;
    private UserConnector userConnector;
    private RoleManager roleManager;
    private AuthService authService;

    @RequestMapping("user-connector-batch-list")
    public String list() {
        return "auth/user-connector-batch-list";
    }

    @RequestMapping("user-connector-batch-input")
    public String input(
            @RequestParam(value = "userText", required = false) String userText,
            Model model, RedirectAttributes redirectAttributes) {
        if (userText != null) {
            List<UserStatus> userStatuses = new ArrayList<UserStatus>();

            for (String str : userText.split("\n")) {
                str = str.trim();

                if (str.length() == 0) {
                    continue;
                }

                String username = str;
                UserDTO userDto = userConnector.findByUsername(username,
                        ScopeHolder.getUserRepoRef());

                if (userDto == null) {
                    messageHelper.addMessage(model, str + " is not exists.");
                    logger.info("{} is not exists", str);
                } else {
                    UserStatus userStatus = authService.createOrGetUserStatus(
                            username, userDto.getId(),
                            ScopeHolder.getUserRepoRef(),
                            ScopeHolder.getScopeId());

                    try {
                        userStatusChecker.check(userStatus);
                        userStatuses.add(userStatus);
                    } catch (CheckUserStatusException ex) {
                        logger.warn(ex.getMessage(), ex);
                        messageHelper.addMessage(model, ex.getMessage());
                    }
                }
            }

            model.addAttribute("userStatuses", userStatuses);
        }

        List<Role> roles = roleManager.find("from Role where scopeId=?",
                ScopeHolder.getScopeId());
        List<RoleDTO> roleDtos = new ArrayList<RoleDTO>();
        roleDtos.addAll(convertRoleDtos(roles, false));
        model.addAttribute("roleDtos", roleDtos);

        // List<ScopeInfo> sharedScopeInfos = scopeConnector.findSharedScopes();

        // logger.info("{}", sharedScopeInfos);

        // for (ScopeInfo scopeInfo : sharedScopeInfos) {
        // List<Role> sharedRoles = authService.findRoles(scopeInfo.getId());
        // roleDtos.addAll(convertRoleDtos(sharedRoles, true));
        // /}
        return "auth/user-connector-batch-input";
    }

    @RequestMapping("user-connector-batch-save")
    public String save(@RequestParam("userIds") List<Long> userIds,
            @RequestParam("roleIds") List<Long> roleIds) {
        logger.debug("userIds: {}, roleIds: {}", userIds, roleIds);

        for (Long userId : userIds) {
            authService.configUserRole(userId, roleIds,
                    ScopeHolder.getUserRepoRef(), ScopeHolder.getScopeId(),
                    false);
        }

        return "redirect:/auth/user-connector-list.do";
    }

    public List<RoleDTO> convertRoleDtos(List<Role> roles, boolean useScope) {
        List<RoleDTO> roleDtos = new ArrayList<RoleDTO>();

        for (Role role : roles) {
            roleDtos.add(convertRoleDto(role, useScope));
        }

        return roleDtos;
    }

    public RoleDTO convertRoleDto(Role role, boolean useScope) {
        RoleDTO roleDto = new RoleDTO();
        roleDto.setId(role.getId());

        if (useScope) {
            roleDto.setName(role.getName() + "("
                    + scopeConnector.findById(role.getScopeId()).getName()
                    + ")");
        } else {
            roleDto.setName(role.getName());
        }

        roleDto.setScopeId(role.getScopeId());

        return roleDto;
    }

    // ~ ======================================================================
    @Resource
    public void setUserStatusManager(UserStatusManager userStatusManager) {
        this.userStatusManager = userStatusManager;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setUserStatusConverter(UserStatusConverter userStatusConverter) {
        this.userStatusConverter = userStatusConverter;
    }

    @Resource
    public void setRoleManager(RoleManager roleManager) {
        this.roleManager = roleManager;
    }

    @Resource
    public void setUserStatusChecker(UserStatusChecker userStatusChecker) {
        this.userStatusChecker = userStatusChecker;
    }

    @Resource
    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }

    @Resource
    public void setScopeConnector(ScopeConnector scopeConnector) {
        this.scopeConnector = scopeConnector;
    }

    @Resource
    public void setAuthService(AuthService authService) {
        this.authService = authService;
    }
}
