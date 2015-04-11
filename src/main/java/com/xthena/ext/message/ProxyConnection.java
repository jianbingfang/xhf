package com.xthena.ext.message;

import javax.jms.Connection;
import javax.jms.ConnectionConsumer;
import javax.jms.ConnectionMetaData;
import javax.jms.Destination;
import javax.jms.ExceptionListener;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.ServerSessionPool;
import javax.jms.Session;
import javax.jms.Topic;

public class ProxyConnection implements Connection {
    private ProxyConnectionFactory connectionFactory;
    private ProxySession proxySession;

    public ProxyConnection(ProxyConnectionFactory connectionFactory) {
        this.connectionFactory = connectionFactory;
        proxySession = new ProxySession(this);
    }

    @Override
	public Session createSession(boolean transacted, int acknowledgeMode)
            throws JMSException {
        return proxySession;
    }

    @Override
	public String getClientID() throws JMSException {
        return null;
    }

    @Override
	public void setClientID(String clientID) throws JMSException {
    }

    @Override
	public ConnectionMetaData getMetaData() throws JMSException {
        return null;
    }

    @Override
	public ExceptionListener getExceptionListener() throws JMSException {
        return null;
    }

    @Override
	public void setExceptionListener(ExceptionListener listener)
            throws JMSException {
    }

    @Override
	public void start() throws JMSException {
    }

    @Override
	public void stop() throws JMSException {
    }

    @Override
	public void close() throws JMSException {
    }

    @Override
	public ConnectionConsumer createConnectionConsumer(Destination destination,
            String messageSelector, ServerSessionPool sessionPool,
            int maxMessages) throws JMSException {
        return null;
    }

    @Override
	public ConnectionConsumer createDurableConnectionConsumer(Topic topic,
            String subscriptionName, String messageSelector,
            ServerSessionPool sessionPool, int maxMessages) throws JMSException {
        return null;
    }

    // ~ ==================================================
    public void sendMessage(Destination destination, String text) {
        this.connectionFactory.sendMessage(destination, text);
    }

    public Message getMessage(String destinationName) {
        return connectionFactory.getMessage(destinationName);
    }

    public MessageConsumer createConsumer(Destination destination,
            ProxySession session) {
        return connectionFactory.createConsumer(destination, session);
    }

    public void removeMessageConsumer(ProxyMessageConsumer messageConsumer) {
        connectionFactory.removeMessageConsumer(messageConsumer);
    }
}
