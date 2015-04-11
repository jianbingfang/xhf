package com.xthena.util;

import java.util.HashMap;
import java.util.List;

import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;

public class HtMapUtil {

	private static HashMap<Long, CommHt> htMap =new HashMap<Long, CommHt>();
	
	public static HashMap<Long, CommHt> getHtMap() {
		return htMap;
	}

	public static void setHtMap(HashMap<Long, CommHt> htMap) {
		HtMapUtil.htMap = htMap;
	}

	public static void initHtMap(CommHtManager htManager){
		List<CommHt> hts= htManager.getAll();
		for(CommHt ht:hts){
			htMap.put(ht.getFid(), ht);
		}
	}
	
	public static void refreshHtMap(CommHt ht) {
		htMap.put(ht.getFid(), ht);
	}
	
	public static void refreshHtMap(List<CommHt> hts) {
		for(CommHt ht:hts){
			htMap.put(ht.getFid(), ht);
		}
	}
	
}
