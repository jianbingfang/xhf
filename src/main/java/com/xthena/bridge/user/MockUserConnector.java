package com.xthena.bridge.user;

import java.util.Collections;
import java.util.Map;

import com.xthena.api.user.UserConnector;
import com.xthena.api.user.UserDTO;

import com.xthena.core.page.Page;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MockUserConnector implements UserConnector {
    private static Logger logger = LoggerFactory
            .getLogger(MockUserConnector.class);
    private UserDTO userDto;

    public MockUserConnector() {
        userDto = new UserDTO();
        userDto.setId("1");
        userDto.setUsername("lingo");
        userDto.setDisplayName("lingo");
        userDto.setEmail("lingo.xthena@gmail.com");
        userDto.setMobile("13800138000");
        userDto.setUserRepoRef("1");
        userDto.setStatus(1);
    }

    @Override
	public UserDTO findById(String id) {
        return userDto;
    }

    @Override
	public UserDTO findByUsername(String username, String userRepoRef) {
        return userDto;
    }

    @Override
	public UserDTO findByRef(String ref, String userRepoRef) {
        return userDto;
    }

    @Override
	public Page pagedQuery(Page page, Map<String, Object> parameters) {
        page.setTotalCount(1);
        page.setResult(Collections.singletonList(userDto));

        return page;
    }
}
