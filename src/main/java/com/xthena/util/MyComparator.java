package com.xthena.util;

import java.text.Collator;
import java.util.Comparator;

import com.xthena.hr.domain.CommRy;

public class MyComparator<T> implements Comparator<T> {

	@Override
	public int compare(T o1, T o2) {
		String name1 = ((CommRy) o1).getFname();
		String name2  = ((CommRy) o2).getFname();
		Collator cmp = Collator.getInstance(java.util.Locale.CHINA);
		int i = cmp.compare(name1, name2);
		return i;
	}

}
