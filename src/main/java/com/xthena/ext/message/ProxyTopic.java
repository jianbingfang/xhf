package com.xthena.ext.message;

import javax.jms.JMSException;
import javax.jms.Topic;

public class ProxyTopic implements Topic {
    private String name;

    public ProxyTopic(String name) {
        this.name = name;
    }

    @Override
	public String getTopicName() throws JMSException {
        return name;
    }

    @Override
	public String toString() {
        return name;
    }
}
