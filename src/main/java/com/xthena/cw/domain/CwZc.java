package com.xthena.cw.domain;
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
 * CwZc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_cw_zc", catalog = "xhf")
public class CwZc implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private String fcode;
	private String ftype;
	private Double fprice;
	private Double fzjjine;
	private Double fcprice;
	private Double fcanzhi;
	private Date fendate;
	private Double fyzjjine;
	private String fstatus;
	private String fusestatus;
	private Long fxmid;
	private String fjlunit;
	private Date fbuydate;
	private Date fqldate;
	private Double fqljine;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public CwZc() {
	}

	/** full constructor */
	public CwZc(String fname, String fcode, String ftype, Double fprice,
			Double fzjjine, Double fcprice, Double fcanzhi, Date fendate,
			Double fyzjjine, String fstatus, String fusestatus, Long fxmid,
			String fjlunit, Date fbuydate, Date fqldate, Double fqljine,
			String fmemo, String fmemo1, String fmemo2) {
		this.fname = fname;
		this.fcode = fcode;
		this.ftype = ftype;
		this.fprice = fprice;
		this.fzjjine = fzjjine;
		this.fcprice = fcprice;
		this.fcanzhi = fcanzhi;
		this.fendate = fendate;
		this.fyzjjine = fyzjjine;
		this.fstatus = fstatus;
		this.fusestatus = fusestatus;
		this.fxmid = fxmid;
		this.fjlunit = fjlunit;
		this.fbuydate = fbuydate;
		this.fqldate = fqldate;
		this.fqljine = fqljine;
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

	@Column(name = "fname", length = 64)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "fcode", length = 64)
	public String getFcode() {
		return this.fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "ftype", length = 64)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	@Column(name = "fzjjine", precision = 20)
	public Double getFzjjine() {
		return this.fzjjine;
	}

	public void setFzjjine(Double fzjjine) {
		this.fzjjine = fzjjine;
	}

	@Column(name = "fcprice", precision = 20)
	public Double getFcprice() {
		return this.fcprice;
	}

	public void setFcprice(Double fcprice) {
		this.fcprice = fcprice;
	}

	@Column(name = "fcanzhi", precision = 20)
	public Double getFcanzhi() {
		return this.fcanzhi;
	}

	public void setFcanzhi(Double fcanzhi) {
		this.fcanzhi = fcanzhi;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fendate", length = 10)
	public Date getFendate() {
		return this.fendate;
	}

	public void setFendate(Date fendate) {
		this.fendate = fendate;
	}

	@Column(name = "fyzjjine", precision = 20)
	public Double getFyzjjine() {
		return this.fyzjjine;
	}

	public void setFyzjjine(Double fyzjjine) {
		this.fyzjjine = fyzjjine;
	}

	@Column(name = "fstatus", length = 64)
	public String getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

	@Column(name = "fusestatus", length = 64)
	public String getFusestatus() {
		return this.fusestatus;
	}

	public void setFusestatus(String fusestatus) {
		this.fusestatus = fusestatus;
	}

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fjlunit", length = 64)
	public String getFjlunit() {
		return this.fjlunit;
	}

	public void setFjlunit(String fjlunit) {
		this.fjlunit = fjlunit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fbuydate", length = 10)
	public Date getFbuydate() {
		return this.fbuydate;
	}

	public void setFbuydate(Date fbuydate) {
		this.fbuydate = fbuydate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fqldate", length = 10)
	public Date getFqldate() {
		return this.fqldate;
	}

	public void setFqldate(Date fqldate) {
		this.fqldate = fqldate;
	}

	@Column(name = "fqljine", precision = 20)
	public Double getFqljine() {
		return this.fqljine;
	}

	public void setFqljine(Double fqljine) {
		this.fqljine = fqljine;
	}

	@Column(name = "fmemo", length = 64)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 64)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 64)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}