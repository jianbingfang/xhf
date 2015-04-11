package com.xthena.bridge.scope;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xthena.api.scope.ScopeConnector;
import com.xthena.api.scope.ScopeHolder;

public class HeaderCodeScopeFilter implements Filter {
    private String defaultScopeCode = "default";
    private ScopeConnector scopeConnector;
    private String scopeHeaderName = "x-scope-code";

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
	public void destroy() {
    }

    /**
     * http://localhost:8080/ctx/model/service.do x-scope-code: default
     */
    @Override
	public void doFilter(ServletRequest servletRequest,
            ServletResponse servletResponse, FilterChain filterChain)
            throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String scopeCode = request.getHeader(scopeHeaderName);

        if (scopeCode == null) {
            scopeCode = defaultScopeCode;
        }

        try {
            ScopeHolder.setScopeDto(scopeConnector.findByCode(scopeCode));

            request.setAttribute("scopePrefix", request.getContextPath());
            filterChain.doFilter(request, response);
        } finally {
            ScopeHolder.clear();
        }
    }

    // ~ ==================================================
    public void setDefaultScopeCode(String defaultScopeCode) {
        this.defaultScopeCode = defaultScopeCode;
    }

    public void setScopeConnector(ScopeConnector scopeConnector) {
        this.scopeConnector = scopeConnector;
    }

    public void setScopeHeaderName(String scopeHeaderName) {
        this.scopeHeaderName = scopeHeaderName;
    }
}
