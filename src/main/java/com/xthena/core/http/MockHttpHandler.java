package com.xthena.core.http;

import java.io.IOException;

import java.util.Map;

public class MockHttpHandler implements HttpHandler {
    private String content;

    @Override
	public String readText(String url) {
        return content;
    }

    @Override
	public String readText(String url, Map<String, Object> parameterMap)
            throws IOException {
        return content;
    }

    @Override
	public String readText(String url, String encoding,
            Map<String, Object> parameterMap) throws IOException {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
