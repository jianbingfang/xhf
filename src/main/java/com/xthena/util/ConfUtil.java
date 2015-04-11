package com.xthena.util;


import java.io.FileReader;
import java.io.Reader;
import java.util.Properties;




public class ConfUtil {

	private static Properties p = new Properties();

	static {
		try {
			String resource = "/conf.properties";
			Reader reader = new FileReader(ConfUtil.class.getResource(resource)
					.getFile());
			p.load(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getProperty(String key) {
		return p.getProperty(key);
	}
	

}
