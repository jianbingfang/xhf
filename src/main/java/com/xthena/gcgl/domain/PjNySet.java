package com.xthena.gcgl.domain;
// default package



public class PjNySet implements java.io.Serializable {

	private PjNy pjNy;
	
	private PjNyList[] pjNyList;

	public PjNy getPjNy() {
		return pjNy;
	}

	public void setPjNy(PjNy pjNy) {
		this.pjNy = pjNy;
	}

	public PjNyList[] getPjNyList() {
		return pjNyList;
	}

	public void setPjNyList(PjNyList[] pjNyList) {
		this.pjNyList = pjNyList;
	}

}