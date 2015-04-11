package com.xthena.xz.domain;
// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * WzStorage entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_wz_storage", catalog = "xhf")
public class WzStorage implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long fwzid;
	private Long fxmid;
	private int fnum;
	private Double fprice;
	private String fjbr;
	private String fmemo;
	private String ftype;
	private Date fdate;
    private String fdateString;

	// Constructors

	/** default constructor */
	public WzStorage() {
	}

	/** minimal constructor */
	public WzStorage(Long fxmid) {
		this.fxmid = fxmid;
	}

	/** full constructor */
	public WzStorage(Long fwzid, Long fxmid, int fnum, Double fprice,
			String fjbr, String fmemo, String ftype,Date fdate) {
		this.fwzid = fwzid;
		this.fxmid = fxmid;
		this.fnum = fnum;
		this.fprice = fprice;
		this.fjbr = fjbr;
		this.fmemo = fmemo;
		this.ftype = ftype;
		this.fdate = fdate;
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

	@Column(name = "fwzid")
	public Long getFwzid() {
		return this.fwzid;
	}

	public void setFwzid(Long fwzid) {
		this.fwzid = fwzid;
	}

	@Column(name = "fxmid", nullable = false)
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fnum", precision = 20)
	public int getFnum() {
		return this.fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	@Column(name = "fjbr", precision = 40)
	public String getFjbr() {
		return this.fjbr;
	}

	public void setFjbr(String fjbr) {
		this.fjbr = fjbr;
	}

	@Column(name = "fmemo", length = 200)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "ftype", length = 64)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	/**
	 * @return the fdate
	 */
	@Column(name = "fdate")
	public Date getFdate() {
		return fdate;
	}

	/**
	 * @param fdate the fdate to set
	 */
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	/**
	 * @return the fdateString
	 */
	public String getFdateString() {
		return fdateString;
	}

	/**
	 * @param fdateString the fdateString to set
	 */
	public void setFdateString(String fdateString) {
		this.fdateString = fdateString;
	}


}