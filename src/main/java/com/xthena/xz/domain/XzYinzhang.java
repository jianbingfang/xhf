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
 * XzYinzhang entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_yinzhang", catalog = "xhf")
public class XzYinzhang implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fcode;
	private String fsqr;
	private Long fbm;
	private String fname;
	private Date fdate;
	private String fshenpi;
	private String fymba;
	private Date fqyrq;
	private Long fzrr;
	private String fstatus;
	private String fkzcsjyy;
	private Double ffy;
	private Double fjnje;
	private Date fghdate;
	private String ffzwz;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public XzYinzhang() {
	}

	/** full constructor */
	public XzYinzhang(String fcode,String fsqr, Long fbm, String fname, Date fdate,
			String fshenpi, String fymba, Date fqyrq, Long fzrr,
			String fstatus, String fkzcsjyy, Double ffy, Double fjnje,Date fghdate,String ffzwz,
			String fmemo, String fmemo1, String fmemo2) {
		this.fcode = fcode;
		this.fsqr = fsqr;
		this.fbm = fbm;
		this.fname = fname;
		this.fdate = fdate;
		this.fshenpi = fshenpi;
		this.fymba = fymba;
		this.fqyrq = fqyrq;
		this.fzrr = fzrr;
		this.fstatus = fstatus;
		this.fkzcsjyy = fkzcsjyy;
		this.ffy = ffy;
		this.fjnje = fjnje;
		this.fghdate = fghdate;
		this.ffzwz = ffzwz;
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

	@Column(name = "fsqr", length = 16777215)
	public String getFsqr() {
		return this.fsqr;
	}

	public void setFsqr(String fsqr) {
		this.fsqr = fsqr;
	}

	@Column(name = "fbm", length = 20)
	public Long getFbm() {
		return this.fbm;
	}

	public void setFbm(Long fbm) {
		this.fbm = fbm;
	}

	@Column(name = "fname", length = 200)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fshenpi", length = 64)
	public String getFshenpi() {
		return this.fshenpi;
	}

	public void setFshenpi(String fshenpi) {
		this.fshenpi = fshenpi;
	}

	@Column(name = "fymba", length = 64)
	public String getFymba() {
		return this.fymba;
	}

	public void setFymba(String fymba) {
		this.fymba = fymba;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fqyrq", length = 10)
	public Date getFqyrq() {
		return this.fqyrq;
	}

	public void setFqyrq(Date fqyrq) {
		this.fqyrq = fqyrq;
	}

	@Column(name = "fzrr",length=20 )
	public Long getFzrr() {
		return this.fzrr;
	}

	public void setFzrr(Long fzrr) {
		this.fzrr = fzrr;
	}

	@Column(name = "fstatus", length = 64)
	public String getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

	@Column(name = "fkzcsjyy", length = 200)
	public String getFkzcsjyy() {
		return this.fkzcsjyy;
	}

	public void setFkzcsjyy(String fkzcsjyy) {
		this.fkzcsjyy = fkzcsjyy;
	}

	@Column(name = "ffy", precision = 20)
	public Double getFfy() {
		return this.ffy;
	}

	public void setFfy(Double ffy) {
		this.ffy = ffy;
	}

	@Column(name = "fjnje", precision = 20)
	public Double getFjnje() {
		return this.fjnje;
	}

	public void setFjnje(Double fjnje) {
		this.fjnje = fjnje;
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

	/**
	 * @return the fcode
	 */
	@Column(name = "fcode", length = 40)
	public String getFcode() {
		return fcode;
	}

	/**
	 * @param fcode the fcode to set
	 */
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	/**
	 * @return the fghdate
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "fghdate", length = 10)
	public Date getFghdate() {
		return fghdate;
	}

	/**
	 * @param fghdate the fghdate to set
	 */
	public void setFghdate(Date fghdate) {
		this.fghdate = fghdate;
	}

	/**
	 * @return the ffzwz
	 */
	@Column(name = "ffzwz", length = 40)
	public String getFfzwz() {
		return ffzwz;
	}

	/**
	 * @param ffzwz the ffzwz to set
	 */
	public void setFfzwz(String ffzwz) {
		this.ffzwz = ffzwz;
	}

}