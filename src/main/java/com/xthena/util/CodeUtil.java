package com.xthena.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xthena.util.domain.CodeGen;
import com.xthena.util.manager.CodeGenManager;
import com.xthena.core.hibernate.PropertyFilter;

public class CodeUtil {

	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat smdf=new SimpleDateFormat("yyyyMM");
	private static SimpleDateFormat sydf=new SimpleDateFormat("yyyy");
	
	public static synchronized String getSysCode(String typeCode,String dateCode,int length,CodeGenManager codeGenManager){
		Map<String, Object> parameterMap =new HashMap<String, Object>();
		parameterMap.put("filter_EQS_ftypecode", typeCode);
    	parameterMap.put("filter_EQS_fdatecode",dateCode);
		 List<PropertyFilter> propertyFilters = PropertyFilter
	                .buildFromMap(parameterMap);
		List<CodeGen> codeGens= codeGenManager.find(propertyFilters);
		String codeResult=dateCode;
		if(codeGens!=null&&!codeGens.isEmpty()){
			CodeGen codeGen=codeGens.get(0);
			codeGen.setFcurrvalue(codeGen.getFcurrvalue()+1);
			codeResult+= buildCode(length,codeGen.getFcurrvalue());
			codeGenManager.save(codeGen);
		}else{
			CodeGen codeGen=new CodeGen();
			codeGen.setFtypecode(typeCode);
			codeGen.setFdatecode(dateCode);
			codeGen.setFcurrvalue(1);
			codeResult+= buildCode(length,1);
			codeGenManager.save(codeGen);
		}
		return codeResult;
	}
	
	public static synchronized String getDaySysCode(String typeCode,int length,CodeGenManager codeGenManager){
		return getSysCode( typeCode,dayformMatDate(new Date()), length, codeGenManager);
	}
	
	public static synchronized String getSysMothCode(String typeCode,int length,CodeGenManager codeGenManager){
		return getSysCode( typeCode,monthformMatDate(new Date()), length, codeGenManager);
	}
	
	public static synchronized String getSysYearCode(String typeCode,int length,CodeGenManager codeGenManager){
		return getSysCode( typeCode,yearformMatDate(new Date()), length, codeGenManager);
	}
	
	private static String buildCode(int length,int value){
		String strVal=String.valueOf(value);
		while (strVal.length()<length){
			strVal="0"+strVal;
		}
		return strVal;
	}
	public static String dayformMatDate(Date date){
		return sdf.format(date);
	}
	public static String monthformMatDate(Date date){
		return smdf.format(date);
	}
	public static String yearformMatDate(Date date){
		return sydf.format(date);
	}
	
}
