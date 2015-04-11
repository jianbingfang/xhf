package com.xthena.dzb.domain;
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
 * Hd entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_dzb_hd", catalog = "xhf")
public class Hd implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fpxzt;
	private Date fdate;
	private String faddress;
	private String fpxlb;
	private String fcjry;
	private String fpxnr;
	private String furl;
	private Double fprice;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public Hd() {
	}

	/** full constructor */
	public Hd(String fpxzt, Date fdate, String faddress, String fpxlb,
			String fcjry, String fpxnr, String furl, Double fprice,
			String fmemo, String fmemo1, String fmemo2) {
		this.fpxzt = fpxzt;
		this.fdate = fdate;
		this.faddress = faddress;
		this.fpxlb = fpxlb;
		this.fcjry = fcjry;
		this.fpxnr = fpxnr;
		this.furl = furl;
		this.fprice = fprice;
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

	@Column(name = "fpxzt", length = 100)
	public String getFpxzt() {
		return this.fpxzt;
	}

	public void setFpxzt(String fpxzt) {
		this.fpxzt = fpxzt;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "faddress", length = 100)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "fpxlb", length = 100)
	public String getFpxlb() {
		return this.fpxlb;
	}

	public void setFpxlb(String fpxlb) {
		this.fpxlb = fpxlb;
	}

	@Column(name = "fcjry", length = 100)
	public String getFcjry() {
		return this.fcjry;
	}

	public void setFcjry(String fcjry) {
		this.fcjry = fcjry;
	}

	@Column(name = "fpxnr", length = 200)
	public String getFpxnr() {
		return this.fpxnr;
	}

	public void setFpxnr(String fpxnr) {
		this.fpxnr = fpxnr;
	}

	@Column(name = "furl", length = 500)
	public String getFurl() {
		return this.furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	@Column(name = "fmemo", length = 1000)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 1000)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 1000)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}