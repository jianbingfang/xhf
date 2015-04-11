package com.xthena.bridge.scope;

import java.util.Collections;
import java.util.List;
import com.xthena.api.scope.ScopeConnector;
import com.xthena.api.scope.ScopeDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MockScopeConnector implements ScopeConnector {
    private static Logger logger = LoggerFactory
            .getLogger(MockScopeConnector.class);
    private ScopeDTO scopeDto;

    public MockScopeConnector() {
        scopeDto = new ScopeDTO();
        scopeDto.setId("1");
        scopeDto.setCode("default");
        scopeDto.setName("default");
        scopeDto.setUserRepoRef("1");
        scopeDto.setShared(true);
        scopeDto.setType(0);
    }

    @Override
	public ScopeDTO findById(String id) {
        return scopeDto;
    }

    @Override
	public ScopeDTO findByCode(String code) {
        return scopeDto;
    }

    @Override
	public ScopeDTO findByRef(String ref) {
        return scopeDto;
    }

    @Override
	public List<ScopeDTO> findAll() {
        return Collections.singletonList(scopeDto);
    }

    @Override
	public List<ScopeDTO> findSharedScopes() {
        return Collections.singletonList(scopeDto);
    }
}
