package com.xthena.util;

import java.util.HashMap;
import java.util.List;

import com.xthena.hr.domain.CommRy;
import com.xthena.hr.manager.CommRyManager;

public class CommRyMapUtil {

	private static HashMap<Long, CommRy> ryMap = new HashMap<Long, CommRy>();

	public static HashMap<Long, CommRy> getRyMap() {
		return ryMap;
	}

	public static void setRyMap(HashMap<Long, CommRy> ryMap) {
		CommRyMapUtil.ryMap = ryMap;
	}

	public static void initRyMap(CommRyManager commRyManager) {
		List<CommRy> commRies = commRyManager.getAll();
		for (CommRy commRy : commRies) {
			ryMap.put(commRy.getFid(), commRy);
		}
	}



	public static CommRy getRyById(Long id) {
		if (ryMap.get(id) != null) {
			return ryMap.get(id);
		} else
			return new CommRy();
	}

	public static void refreshRyMap(CommRy commRy) {
		ryMap.put(commRy.getFid(), commRy);
	}

	public static void refreshRyMap(List<CommRy> commRies) {
		for (CommRy commRy : commRies) {
			ryMap.put(commRy.getFid(), commRy);
		}
	}

	public static void deleteRyMap(CommRy commRy) {
		ryMap.remove(commRy.getFid());
	}

	public static void deleteRyMap(List<CommRy> commRies) {
		for (CommRy commRy : commRies) {
			ryMap.remove(commRy.getFid());
		}
	}
}
