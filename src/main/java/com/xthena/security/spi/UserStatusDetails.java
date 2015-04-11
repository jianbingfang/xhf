package com.xthena.security.spi;

import java.util.Collection;

public interface UserStatusDetails {
    String getId();

    String getScopeId();

    Collection<String> getAttributes();

    Collection<String> getAttributes(String type);
}
