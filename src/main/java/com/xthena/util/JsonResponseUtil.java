package com.xthena.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;



public class JsonResponseUtil {
	
	public static void write(HttpServletResponse response,String str) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			printWriter.write(str);
			printWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void write(HttpServletResponse response,Object object) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			JsonConfig config = new JsonConfig();  
            config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			printWriter.write(JSONObject.fromObject(object,config).toString());
			printWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void write(HttpServletResponse response,List list) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			JsonConfig config = new JsonConfig();  
            config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			printWriter.write(JSONArray.fromObject(list,config).toString());
			printWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
