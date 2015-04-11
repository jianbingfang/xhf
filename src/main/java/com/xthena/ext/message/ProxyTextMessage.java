package com.xthena.ext.message;

import javax.jms.TextMessage;

public class ProxyTextMessage extends ProxyMessage implements TextMessage {
    private String text;

    @Override
	public String getText() {
        return text;
    }

    @Override
	public void setText(String text) {
        this.text = text;
    }
}
