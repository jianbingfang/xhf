package com.xthena.bridge.user;

import com.xthena.api.user.UserCache;
import com.xthena.api.user.UserDTO;

import com.xthena.ext.cache.Cache;
import com.xthena.ext.cache.CacheStrategy;

public class UserCacheImpl implements UserCache {
    private CacheStrategy cacheStrategy;
    private Cache cache;

    @Override
	public UserDTO findById(String id) {
        String key = "userId:" + id;

        return cache.get(key);
    }

    @Override
	public UserDTO findByUsername(String username, String userRepoRef) {
        String key = "userUsername:" + username + ":" + userRepoRef;

        return cache.get(key);
    }

    @Override
	public UserDTO findByRef(String ref, String userRepoRef) {
        String key = "userRef:" + ref + ":" + userRepoRef;

        return cache.get(key);
    }

    @Override
	public void updateUser(UserDTO userDto) {
        cache.set("userId:" + userDto.getId(), userDto);
        cache.set(
                "userUsername:" + userDto.getUsername() + ":"
                        + userDto.getUserRepoRef(), userDto);
        cache.set(
                "userRef:" + userDto.getRef() + ":" + userDto.getUserRepoRef(),
                userDto);
    }

    @Override
	public void removeUser(UserDTO userDto) {
        cache.remove("userId:" + userDto.getId());
        cache.remove("userUsername:" + userDto.getUsername() + ":"
                + userDto.getUserRepoRef());
        cache.remove("userRef:" + userDto.getRef() + ":"
                + userDto.getUserRepoRef());
    }

    public void setCacheStrategy(CacheStrategy cacheStrategy) {
        this.cacheStrategy = cacheStrategy;
        this.cache = cacheStrategy.getCache("user");
    }
}
