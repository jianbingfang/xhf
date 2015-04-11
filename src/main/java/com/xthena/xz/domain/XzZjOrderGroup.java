package com.xthena.xz.domain;

import java.util.HashMap;
import java.util.List;

public class XzZjOrderGroup {
	
	private XzZjOrder xzZjOrder;
	
	private List<HashMap<String, Object>> fzjlist;

	public XzZjOrder getXzZjOrder() {
		return xzZjOrder;
	}

	public void setXzZjOrder(XzZjOrder xzZjOrder) {
		this.xzZjOrder = xzZjOrder;
	}

	public List<HashMap<String, Object>> getFzjlist() {
		return fzjlist;
	}

	public void setFzjlist(List<HashMap<String, Object>> fzjlist) {
		this.fzjlist = fzjlist;
	}
	
	

}
