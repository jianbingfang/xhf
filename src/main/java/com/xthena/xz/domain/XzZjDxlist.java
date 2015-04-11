package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * XzZjDxlist entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_zj_dxlist", catalog = "xhf")
public class XzZjDxlist implements java.io.Serializable {

	// Fields

	private Long fid;
	private String ftype;
	private Long fzjid;
	private String fname;
	private String fstate;
	private Long fupdatetime;
	private String fmemo;
	private String furl;

	// Constructors

	/** default constructor */
	public XzZjDxlist() {
	}

	/** full constructor */
	public XzZjDxlist(String ftype, Long fzjid, String fname, String fstate,
			Long fupdatetime, String fmemo,String furl) {
		this.ftype = ftype;
		this.fzjid = fzjid;
		this.fname = fname;
		this.fstate = fstate;
		this.fupdatetime = fupdatetime;
		this.fmemo = fmemo;
		this.furl =furl ;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "fid", unique = true, nullable = false)
	public Long getFid() {
		return this.fid;
	}

	public void setFid(Long fid) {
		this.fid = fid;
	}

	@Column(name = "ftype", length = 20)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	@Column(name = "fzjid")
	public Long getFzjid() {
		return this.fzjid;
	}

	public void setFzjid(Long fzjid) {
		this.fzjid = fzjid;
	}

	@Column(name = "fname", length = 1024)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "fstate", length = 20)
	public String getFstate() {
		return this.fstate;
	}

	public void setFstate(String fstate) {
		this.fstate = fstate;
	}

	@Column(name = "fupdatetime")
	public Long getFupdatetime() {
		return this.fupdatetime;
	}

	public void setFupdatetime(Long fupdatetime) {
		this.fupdatetime = fupdatetime;
	}

	@Column(name = "fmemo", length = 80)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	/**
	 * @return the furl
	 */
	@Column(name = "furl", length = 300)
	public String getFurl() {
		return furl;
	}

	/**
	 * @param furl the furl to set
	 */
	public void setFurl(String furl) {
		this.furl = furl;
	}

}