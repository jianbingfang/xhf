package com.xthena.bridge.scope;

import com.xthena.api.scope.ScopeCache;
import com.xthena.api.scope.ScopeDTO;

import com.xthena.ext.cache.Cache;
import com.xthena.ext.cache.CacheStrategy;

public class ScopeCacheImpl implements ScopeCache {
    private CacheStrategy cacheStrategy;
    private Cache cache;

    @Override
	public ScopeDTO findById(String id) {
        String key = "scopeInfoId:" + id;

        return cache.get(key);
    }

    @Override
	public ScopeDTO findByRef(String ref) {
        String key = "scopeInfoRef:" + ref;

        return cache.get(key);
    }

    @Override
	public ScopeDTO findByCode(String code) {
        String key = "scopeInfoCode:" + code;

        return cache.get(key);
    }

    @Override
	public void updateScope(ScopeDTO scopeDto) {
        cache.set("scopeInfoId:" + scopeDto.getId(), scopeDto);
        cache.set("scopeInfoRef:" + scopeDto.getId(), scopeDto);
        cache.set("scopeInfoCode:" + scopeDto.getId(), scopeDto);
    }

    @Override
	public void removeScope(ScopeDTO scopeDto) {
        cache.remove("scopeInfoId:" + scopeDto.getId());
        cache.remove("scopeInfoRef:" + scopeDto.getId());
        cache.remove("scopeInfoCode:" + scopeDto.getId());
    }

    public void setCacheStrategy(CacheStrategy cacheStrategy) {
        this.cacheStrategy = cacheStrategy;
        this.cache = cacheStrategy.getCache("scope");
    }
}
