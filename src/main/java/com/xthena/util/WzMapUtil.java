package com.xthena.util;

import java.util.HashMap;
import java.util.List;

import com.xthena.xz.domain.WzList;
import com.xthena.xz.manager.WzListManager;

public class WzMapUtil {

	private static HashMap<Long, WzList> wzMap = new HashMap<Long, WzList>();

	public static HashMap<Long, WzList> getWzMap() {
		return wzMap;
	}

	public static void setWzMap(HashMap<Long, WzList> wzMap) {
		WzMapUtil.wzMap = wzMap;
	}

	public static void initWzMap(WzListManager wzTableManager) {
		List<WzList> wzTables = wzTableManager.getAll();
		for (WzList wzTable : wzTables) {
			wzMap.put(wzTable.getFid(), wzTable);
		}
	}

	public static void refreshWzMap(WzList wzTable) {
		wzMap.put(wzTable.getFid(), wzTable);
	}

	public static void deleteWzMap(WzList wzTable) {
		wzMap.remove(wzTable.getFid());
	}

	public static void deleteWzMap(List<WzList> wzList) {
		for (WzList wzTable : wzList) {
			wzMap.remove(wzTable.getFid());
		}
	}

	public static void refreshWzMap(List<WzList> wzList) {
		for (WzList wzTable : wzList) {
			wzMap.put(wzTable.getFid(), wzTable);
		}
	}

}
