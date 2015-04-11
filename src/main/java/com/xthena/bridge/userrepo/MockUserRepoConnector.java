package com.xthena.bridge.userrepo;

import java.util.Collections;
import java.util.List;

import com.xthena.api.userrepo.UserRepoConnector;
import com.xthena.api.userrepo.UserRepoDTO;

public class MockUserRepoConnector implements UserRepoConnector {
    private UserRepoDTO userRepoDto = new UserRepoDTO();

    public MockUserRepoConnector() {
        userRepoDto.setId("1");
        userRepoDto.setCode("default");
    }

    @Override
	public UserRepoDTO findById(String id) {
        return userRepoDto;
    }

    @Override
	public UserRepoDTO findByCode(String code) {
        return userRepoDto;
    }

    @Override
	public List<UserRepoDTO> findAll() {
        return Collections.singletonList(userRepoDto);
    }
}
