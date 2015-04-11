package com.xthena.core.logback;

import org.slf4j.bridge.SLF4JBridgeHandler;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class JulHandler implements InitializingBean, DisposableBean {
    @Override
	public void afterPropertiesSet() {
        SLF4JBridgeHandler.removeHandlersForRootLogger();
        SLF4JBridgeHandler.install();
    }

    @Override
	public void destroy() {
        SLF4JBridgeHandler.uninstall();
    }
}
