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
 * XzZbtzs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_zbtzs", catalog = "xhf")
public class XzZbtzs implements Zj {

	// Fields

	/**
	 * 
	 */
	private Long fid;
	private String fcode;
	private String fxmname;
	private String ffzdw;
	private Double fzbje;
	private Date ffzrq;
	private String fmemo;
	private String fzkstate;
	private Long fzongjian;
	private String ffzwz;
	private String fjdjg;
	private String fmemo1;
	private String fzbfl;

	// Constructors

	/** default constructor */
	public XzZbtzs() {
	}

	/** minimal constructor */
	public XzZbtzs(String fxmname, String ffzdw, Double fzbje, Date ffzrq, String fzbfl) {
		this.fxmname = fxmname;
		this.ffzdw = ffzdw;
		this.fzbje = fzbje;
		this.ffzrq = ffzrq;
		this.fzbfl=fzbfl;
	}

	/**
	 * full constructor
	 * 
	 * @param fzkstate
	 */
	public XzZbtzs(String fcode, String fxmname, String ffzdw, Double fzbje,
			Date ffzrq, String fmemo, String fzkstate, Long fzongjian,
			String ffzwz, String fjdjg, String fmemo1, String fzbfl) {
		this.fxmname = fxmname;
		this.fcode = fcode;
		this.ffzdw = ffzdw;
		this.fzbje = fzbje;
		this.ffzrq = ffzrq;
		this.fmemo = fmemo;
		this.fzkstate = fzkstate;
		this.fzongjian = fzongjian;
		this.ffzwz = ffzwz;
		this.fjdjg = fjdjg;
		this.fmemo1 =fmemo1;
		this.fzbfl=fzbfl;
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

	@Column(name = "fxmname", nullable = false, length = 64)
	public String getFxmname() {
		return this.fxmname;
	}

	public void setFxmname(String fxmname) {
		this.fxmname = fxmname;
	}

	@Column(name = "ffzdw", nullable = false, length = 200)
	public String getFfzdw() {
		return this.ffzdw;
	}

	public void setFfzdw(String ffzdw) {
		this.ffzdw = ffzdw;
	}

	@Column(name = "fzbje", nullable = false)
	public Double getFzbje() {
		return this.fzbje;
	}

	public void setFzbje(Double fzbje) {
		this.fzbje = fzbje;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "ffzrq", nullable = false, length = 10)
	public Date getFfzrq() {
		return this.ffzrq;
	}

	public void setFfzrq(Date ffzrq) {
		this.ffzrq = ffzrq;
	}

	@Column(name = "fmemo", length = 200)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fzkstate", length = 10)
	public String getFzkstate() {
		return fzkstate;
	}

	public void setFzkstate(String fzkstate) {
		this.fzkstate = fzkstate;
	}

	@Column(name = "fzongjian", length = 10)
	public Long getFzongjian() {
		return fzongjian;
	}

	public void setFzongjian(Long fzongjian) {
		this.fzongjian = fzongjian;
	}

	@Column(name = "ffzwz", length = 10)
	public String getFfzwz() {
		return ffzwz;
	}

	public void setFfzwz(String ffzwz) {
		this.ffzwz = ffzwz;
	}

	@Column(name = "fcode", length = 10)
	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "fjdjg", length = 100)
	public String getFjdjg() {
		return fjdjg;
	}

	public void setFjdjg(String fjdjg) {
		this.fjdjg = fjdjg;
	}

	@Column(name = "fmemo1", length = 100)
	public String getFmemo1() {
		return fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fzbfl", length = 100)
	public String getFzbfl() {
		return fzbfl;
	}
	public void setFzbfl(String fzbfl) {
		this.fzbfl = fzbfl;
	}

}