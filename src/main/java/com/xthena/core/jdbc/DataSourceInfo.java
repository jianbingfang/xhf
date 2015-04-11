package com.xthena.core.jdbc;

public interface DataSourceInfo {
    String getName();

    void setName(String name);

    void validate();
}
