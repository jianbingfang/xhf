package com.xthena.core.servlet;

import java.util.Collections;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

public class ProxyServletConfig implements ServletConfig {
    private String servletName;
    private ServletContext servletContext;
    private Map<String, String> map = Collections.EMPTY_MAP;

    public ProxyServletConfig(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Override
	public String getServletName() {
        return servletName;
    }

    @Override
	public ServletContext getServletContext() {
        return servletContext;
    }

    @Override
	public String getInitParameter(String name) {
        return map.get(name);
    }

    @Override
	public Enumeration getInitParameterNames() {
        return Collections.enumeration(map.keySet());
    }

    // ~ ==================================================
    public void setServletName(String servletName) {
        this.servletName = servletName;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }
}
