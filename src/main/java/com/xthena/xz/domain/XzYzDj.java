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
 * XzYzDj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_yz_dj", catalog = "xhf")
public class XzYzDj implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fsybm;
	private String fsy;
	private Long fspren;
	private String fname;
	private Long fzhubanren;
	private Date fdate;
	private Double fshoufei;
	private Long fbszzr;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public XzYzDj() {
	}

	/** minimal constructor */
	public XzYzDj(String fname, Long fzhubanren) {
		this.fname = fname;
		this.fzhubanren = fzhubanren;
	}

	/** full constructor */
	public XzYzDj(String fsybm, String fsy, Long fspren, String fname,
			Long fzhubanren, Date fdate, Double fshoufei, Long fbszzr,
			String fmemo, String fmemo1, String fmemo2) {
		this.fsybm = fsybm;
		this.fsy = fsy;
		this.fspren = fspren;
		this.fname = fname;
		this.fzhubanren = fzhubanren;
		this.fdate = fdate;
		this.fshoufei = fshoufei;
		this.fbszzr = fbszzr;
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

	@Column(name = "fsybm", length = 64)
	public String getFsybm() {
		return this.fsybm;
	}

	public void setFsybm(String fsybm) {
		this.fsybm = fsybm;
	}

	@Column(name = "fsy", length = 200)
	public String getFsy() {
		return this.fsy;
	}

	public void setFsy(String fsy) {
		this.fsy = fsy;
	}

	@Column(name = "fspren", length = 20)
	public Long getFspren() {
		return this.fspren;
	}

	public void setFspren(Long fspren) {
		this.fspren = fspren;
	}

	@Column(name = "fname", nullable = false, length = 64)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "fzhubanren", nullable = false)
	public Long getFzhubanren() {
		return this.fzhubanren;
	}

	public void setFzhubanren(Long fzhubanren) {
		this.fzhubanren = fzhubanren;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fshoufei")
	public Double getFshoufei() {
		return this.fshoufei;
	}

	public void setFshoufei(Double fshoufei) {
		this.fshoufei = fshoufei;
	}

	@Column(name = "fbszzr", length =20)
	public Long getFbszzr() {
		return this.fbszzr;
	}

	public void setFbszzr(Long fbszzr) {
		this.fbszzr = fbszzr;
	}

	@Column(name = "fmemo", length = 400)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 400)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 400)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}