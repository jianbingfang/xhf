package com.xthena.bridge.userrepo;

import com.xthena.api.userrepo.UserRepoCache;
import com.xthena.api.userrepo.UserRepoDTO;

import com.xthena.ext.cache.Cache;
import com.xthena.ext.cache.CacheStrategy;

public class UserRepoCacheImpl implements UserRepoCache {
    private CacheStrategy cacheStrategy;
    private Cache cache;

    @Override
	public UserRepoDTO findById(String id) {
        String key = "userRepoId:" + id;

        return cache.get(key);
    }

    @Override
	public UserRepoDTO findByCode(String code) {
        String key = "userRepoCode:" + code;

        return cache.get(key);
    }

    @Override
	public void updateUserRepo(UserRepoDTO userRepoDto) {
        cache.set("userRepoId:" + userRepoDto.getId(), userRepoDto);
        cache.set("userRepoCode:" + userRepoDto.getCode(), userRepoDto);
    }

    @Override
	public void removeUserRepo(UserRepoDTO userRepoDto) {
        cache.remove("userRepoId:" + userRepoDto.getId());
        cache.remove("userRepoCode:" + userRepoDto.getCode());
    }

    public void setCacheStrategy(CacheStrategy cacheStrategy) {
        this.cacheStrategy = cacheStrategy;
        this.cache = cacheStrategy.getCache("userrepo");
    }
}
