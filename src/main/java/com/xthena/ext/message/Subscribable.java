package com.xthena.ext.message;

public interface Subscribable<T> {
    void handleMessage(T message);

    String getTopic();
}
