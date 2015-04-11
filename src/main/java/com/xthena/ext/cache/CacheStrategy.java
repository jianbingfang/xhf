package com.xthena.ext.cache;

public interface CacheStrategy {
    Cache getCache(String name);
}
