package com.xthena.security.api;

import java.util.Map;

public interface UrlSourceFetcher {
    Map<String, String> getSource(String type);
}
