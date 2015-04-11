package com.xthena.ext.cache;

public class RemoteCacheStrategy implements CacheStrategy {
    private Cache cache = new MapCache();

    @Override
	public Cache getCache(String name) {
        return cache;
    }
}
