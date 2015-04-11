package com.xthena.util;

import java.util.HashMap;
import java.util.List;

import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;

public class PjXmMapUtil {

	private static HashMap<Long, PjXm> xmMap =new HashMap<Long, PjXm>();
	
	public static HashMap<Long, PjXm> getXmMap() {
		return xmMap;
	}

	public static void setXmMap(HashMap<Long, PjXm> xmMap) {
		PjXmMapUtil.xmMap = xmMap;
	}

	public static void initRyMap(PjXmManager pjXmManager){
		List<PjXm> pjxms= pjXmManager.getAll();
		for(PjXm pjXm:pjxms){
			xmMap.put(pjXm.getFid(), pjXm);
		}
	}
	
	public static void refreshRyMap(PjXm pjXm) {
		xmMap.put(pjXm.getFid(), pjXm);
	}
	
	public static void refreshRyMap(List<PjXm> pjxms) {
		for(PjXm pjXm:pjxms){
			xmMap.put(pjXm.getFid(), pjXm);
		}
	}
	
}
