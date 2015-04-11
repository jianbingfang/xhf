package com.xthena.util;

import java.text.NumberFormat;

public class QcKxjsf {
	// 去除科学计数法工具
	public static String kxjs(Double d) {
		if (d != null) {
			NumberFormat nf = java.text.NumberFormat.getInstance();
			nf.setGroupingUsed(false);
			String a = nf.format(d);
			return a;
		}
		return "";
	}
}
