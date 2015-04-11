package com.xthena.bridge.scope;

import javax.annotation.Resource;

import com.xthena.api.scope.ScopeCache;
import com.xthena.api.scope.ScopeDTO;

import com.xthena.core.mapper.JsonMapper;

import com.xthena.ext.message.Subscribable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ScopeSubscriber implements Subscribable<String> {
    private static Logger logger = LoggerFactory
            .getLogger(ScopeSubscriber.class);
    private JsonMapper jsonMapper = new JsonMapper();
    private ScopeCache scopeCache;
    private String destinationName = "topic.scope.update";

    @Override
	public void handleMessage(String message) {
        ScopeDTO scopeDto = jsonMapper.fromJson(message, ScopeDTO.class);

        if (scopeDto.getName() == null) {
            scopeCache.removeScope(scopeDto);
            logger.info("remove scopeDto : {}", message);
        } else {
            scopeCache.updateScope(scopeDto);
            logger.info("update scopeDto : {}", message);
        }
    }

    @Override
	public String getTopic() {
        return destinationName;
    }

    @Resource
    public void setScopeCache(ScopeCache scopeCache) {
        this.scopeCache = scopeCache;
    }

    public void setDestinationName(String destinationName) {
        this.destinationName = destinationName;
    }
}
