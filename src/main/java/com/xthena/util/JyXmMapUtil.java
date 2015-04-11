package com.xthena.util;

import java.util.HashMap;
import java.util.List;

import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjXmManager;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.manager.JyXmManager;

public class JyXmMapUtil {

	private static HashMap<Long, JyXm> xmMap =new HashMap<Long, JyXm>();
	
	public static HashMap<Long, JyXm> getXmMap() {
		return xmMap;
	}

	public static void setXmMap(HashMap<Long, JyXm> xmMap) {
		JyXmMapUtil.xmMap = xmMap;
	}

	public static void initRyMap(JyXmManager jyXmManager){
		List<JyXm> pjxms= jyXmManager.getAll();
		for(JyXm pjXm:pjxms){
			xmMap.put(pjXm.getFid(), pjXm);
		}
	}
	
	public static void refreshRyMap(JyXm pjXm) {
		xmMap.put(pjXm.getFid(), pjXm);
	}
	
	public static void refreshRyMap(List<JyXm> pjxms) {
		for(JyXm pjXm:pjxms){
			xmMap.put(pjXm.getFid(), pjXm);
		}
	}
	
}
