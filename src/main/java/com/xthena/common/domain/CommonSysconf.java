package com.xthena.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TCommonSysconf entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_common_sysconf", catalog = "xhf")
public class CommonSysconf implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fcode;
	private String fdefaultvalue;
	private String fvalue;
	private Integer fstatus;
	private String fmemo;
	private String fmemo2;
	private String fmemo1;

	// Constructors

	/** default constructor */
	public CommonSysconf() {
	}

	/** full constructor */
	public CommonSysconf(String fcode, String fdefaultvalue, String fvalue,
			Integer fstatus, String fmemo, String fmemo2, String fmemo1) {
		this.fcode = fcode;
		this.fdefaultvalue = fdefaultvalue;
		this.fvalue = fvalue;
		this.fstatus = fstatus;
		this.fmemo = fmemo;
		this.fmemo2 = fmemo2;
		this.fmemo1 = fmemo1;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "FID", unique = true, nullable = false)
	public Long getFid() {
		return this.fid;
	}

	public void setFid(Long fid) {
		this.fid = fid;
	}

	@Column(name = "FCODE", length = 128)
	public String getFcode() {
		return this.fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "FDEFAULTVALUE", length = 256)
	public String getFdefaultvalue() {
		return this.fdefaultvalue;
	}

	public void setFdefaultvalue(String fdefaultvalue) {
		this.fdefaultvalue = fdefaultvalue;
	}

	@Column(name = "FVALUE", length = 256)
	public String getFvalue() {
		return this.fvalue;
	}

	public void setFvalue(String fvalue) {
		this.fvalue = fvalue;
	}

	@Column(name = "FSTATUS")
	public Integer getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(Integer fstatus) {
		this.fstatus = fstatus;
	}

	@Column(name = "FMEMO", length = 256)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "FMEMO2", length = 64)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

	@Column(name = "FMEMO1", length = 64)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

}