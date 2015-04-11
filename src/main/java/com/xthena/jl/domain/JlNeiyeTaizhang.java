package com.xthena.jl.domain;

import java.util.Date;

public class JlNeiyeTaizhang {
		private  String fname;
		private int fnumber;
		private Date flastdate;
		private String url;
		
		public JlNeiyeTaizhang(String fname, int fnumber, Date flastdate,String url) {
			super();
			this.fname = fname;
			this.fnumber = fnumber;
			this.flastdate = flastdate;
			this.url =url;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public int getFnumber() {
			return fnumber;
		}
		public void setFnumber(int fnumber) {
			this.fnumber = fnumber;
		}
		public Date getFlastdate() {
			return flastdate;
		}
		public void setFlastdate(Date flastdate) {
			this.flastdate = flastdate;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
}
