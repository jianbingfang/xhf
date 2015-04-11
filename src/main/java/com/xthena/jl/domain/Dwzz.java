package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Dwzz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_jl_dwzz", catalog = "xhf")
public class Dwzz implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private String fstatus;
	private String fmemo;
	private String fval;
	private Long fxmid;
	private String fzzlevel;
	private String fyyzzyxq;

	// Constructors

	/** default constructor */
	public Dwzz() {
	}

	/** full constructor */
	public Dwzz(String fname, String fstatus, String fmemo, String fval,
			Long fxmid, String fzzlevel, String fyyzzyxq) {
		this.fname = fname;
		this.fstatus = fstatus;
		this.fmemo = fmemo;
		this.fval = fval;
		this.fxmid = fxmid;
		this.fzzlevel = fzzlevel;
		this.fyyzzyxq = fyyzzyxq;
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

	@Column(name = "fname", length = 64)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "fstatus", length = 64)
	public String getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

	@Column(name = "fmemo", length = 64)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fval", length = 64)
	public String getFval() {
		return this.fval;
	}

	public void setFval(String fval) {
		this.fval = fval;
	}

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fzzlevel", length = 64)
	public String getFzzlevel() {
		return this.fzzlevel;
	}

	public void setFzzlevel(String fzzlevel) {
		this.fzzlevel = fzzlevel;
	}

	@Column(name = "fyyzzyxq", length = 64)
	public String getFyyzzyxq() {
		return this.fyyzzyxq;
	}

	public void setFyyzzyxq(String fyyzzyxq) {
		this.fyyzzyxq = fyyzzyxq;
	}

}