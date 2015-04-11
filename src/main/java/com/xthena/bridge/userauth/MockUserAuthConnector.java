package com.xthena.bridge.userauth;

import java.util.Collections;
import com.xthena.api.scope.ScopeConnector;
import com.xthena.api.user.UserConnector;
import com.xthena.api.userauth.UserAuthConnector;
import com.xthena.api.userauth.UserAuthDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.jdbc.core.JdbcTemplate;

public class MockUserAuthConnector implements UserAuthConnector {
    private static Logger logger = LoggerFactory
            .getLogger(MockUserAuthConnector.class);
    private JdbcTemplate jdbcTemplate;
    private ScopeConnector scopeConnector;
    private UserConnector userConnector;
    private UserAuthDTO userAuthDto;

    public MockUserAuthConnector() {
        userAuthDto = new UserAuthDTO();
        userAuthDto.setId("1");
        userAuthDto.setScopeId("1");
        userAuthDto.setUsername("lingo");
        userAuthDto.setRef("1");
        userAuthDto.setDisplayName("lingo");
        userAuthDto.setStatus("1");
        userAuthDto.setPassword("1");

        userAuthDto.setPermissions(Collections.singletonList("*"));
        userAuthDto.setRoles(Collections.singletonList("ROLE_ADMIN"));
    }

    @Override
	public UserAuthDTO findByUsername(String username, String scopeId) {
        return userAuthDto;
    }

    @Override
	public UserAuthDTO findByRef(String ref, String scopeId) {
        return userAuthDto;
    }

    @Override
	public UserAuthDTO findById(String id, String scopeId) {
        return userAuthDto;
    }
}
