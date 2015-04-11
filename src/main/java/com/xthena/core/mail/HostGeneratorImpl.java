package com.xthena.core.mail;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class HostGeneratorImpl implements HostGenerator {
    @Override
	public String generateLocalAddress() throws UnknownHostException {
        String address = InetAddress.getLocalHost().getHostName() + "/"
                + InetAddress.getLocalHost().getHostAddress();

        return address;
    }
}
