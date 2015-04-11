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

/**
 * XzWs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_ws", catalog = "xhf")
public class XzWs implements java.io.Serializable {

	// Fields

	private Long fid;
	private Date fdate;
	private String fjczcy;
	private String fbjbm;
	private String flfqk;
	private String fpjjg;
	private String ftype;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public XzWs() {
	}

	/** full constructor */
	public XzWs(Date fdate, String fjczcy, String fbjbm, String flfqk,
			String fpjjg, String ftype, String fmemo, String fmemo1,
			String fmemo2) {
		this.fdate = fdate;
		this.fjczcy = fjczcy;
		this.fbjbm = fbjbm;
		this.flfqk = flfqk;
		this.fpjjg = fpjjg;
		this.ftype = ftype;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fjczcy", length = 128)
	public String getFjczcy() {
		return this.fjczcy;
	}

	public void setFjczcy(String fjczcy) {
		this.fjczcy = fjczcy;
	}

	@Column(name = "fbjbm", length = 128)
	public String getFbjbm() {
		return this.fbjbm;
	}

	public void setFbjbm(String fbjbm) {
		this.fbjbm = fbjbm;
	}

	@Column(name = "flfqk", length = 128)
	public String getFlfqk() {
		return this.flfqk;
	}

	public void setFlfqk(String flfqk) {
		this.flfqk = flfqk;
	}

	@Column(name = "fpjjg", length = 128)
	public String getFpjjg() {
		return this.fpjjg;
	}

	public void setFpjjg(String fpjjg) {
		this.fpjjg = fpjjg;
	}

	@Column(name = "ftype", length = 64)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	@Column(name = "fmemo", length = 128)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 128)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 128)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}