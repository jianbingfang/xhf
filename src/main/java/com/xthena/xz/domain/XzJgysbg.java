package com.xthena.xz.domain;

// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.xthena.xz.manager.Zj;

/**
 * XzJgysbg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_jgysbg", catalog = "xhf")
public class XzJgysbg implements java.io.Serializable,Zj {

	// Fields

	private Long fid;
	private String fcode;
	private String fxmname;
	private String fgcgm;
	private Double fztz;
	private Long fzongjian;
	private Date fstartdate;
	private Date fenddate;
	private String fzkstate;
	private String ffzwz;
	private String fmemo;
	private String fmemo1;

	// Constructors

	public String getFmemo1() {
		return fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	/** default constructor */
	public XzJgysbg() {
	}

	/** full constructor */
	public XzJgysbg(String fcode, String fxmname, String fgcgm, Double fztz,
			Long fzongjian, Date fstartdate, Date fenddate, String fzkstate,
			String ffzwz, String fmemo) {
		this.fcode = fcode;
		this.fxmname = fxmname;
		this.fgcgm = fgcgm;
		this.fztz = fztz;
		this.fzongjian = fzongjian;
		this.fstartdate = fstartdate;
		this.fenddate = fenddate;
		this.fzkstate = fzkstate;
		this.ffzwz = ffzwz;
		this.fmemo = fmemo;
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

	@Column(name = "fcode", length = 20)
	public String getFcode() {
		return this.fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "fxmname", length = 64)
	public String getFxmname() {
		return this.fxmname;
	}

	public void setFxmname(String fxmname) {
		this.fxmname = fxmname;
	}

	@Column(name = "fgcgm", length = 200)
	public String getFgcgm() {
		return this.fgcgm;
	}

	public void setFgcgm(String fgcgm) {
		this.fgcgm = fgcgm;
	}

	@Column(name = "fztz")
	public Double getFztz() {
		return this.fztz;
	}

	public void setFztz(Double fztz) {
		this.fztz = fztz;
	}

	@Column(name = "fzongjian", length = 10)
	public Long getFzongjian() {
		return this.fzongjian;
	}

	public void setFzongjian(Long fzongjian) {
		this.fzongjian = fzongjian;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fstartdate")
	public Date getFstartdate() {
		return this.fstartdate;
	}

	public void setFstartdate(Date fstartdate) {
		this.fstartdate = fstartdate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fenddate", length = 10)
	public Date getFenddate() {
		return this.fenddate;
	}

	public void setFenddate(Date fenddate) {
		this.fenddate = fenddate;
	}

	@Column(name = "fzkstate", length = 10)
	public String getFzkstate() {
		return this.fzkstate;
	}

	public void setFzkstate(String fzkstate) {
		this.fzkstate = fzkstate;
	}

	@Column(name = "ffzwz", length = 10)
	public String getFfzwz() {
		return this.ffzwz;
	}

	public void setFfzwz(String ffzwz) {
		this.ffzwz = ffzwz;
	}

	@Column(name = "fmemo", length = 200)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

}