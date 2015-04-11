package com.xthena.cw.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CwXmhs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_cw_xmhs", catalog = "xhf")
public class CwXmhs implements java.io.Serializable {

	// Fields

	private Long fid;
   private Long flistid;
	private Long fhetongid;
	private String fhetongname;
	private Double fhetongjine;
	private Double fbjdsr;
	private Double fbndzsr;
	private Double fzsr;
	private Double fbjdzcb;
	private Double fbnzcb;
	private Double fzcb;
	private Double fglf;
	private Double flr;
	private Double ffpkjwdz;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public CwXmhs() {
	}

	/** full constructor */
	public CwXmhs(Long fhetongid, String fhetongname, Double fhetongjine,
			Double fbjdsr, Double fbndzsr, Double fzsr, Double fbjdzcb,
			Double fbnzcb, Double fzcb, Double fglf, Double ffpkjwdz, Long flistid,Double flr,
			String fmemo, String fmemo1, String fmemo2) {
		this.fhetongid = fhetongid;
		this.flistid = flistid;
		this.fhetongname = fhetongname;
		this.fhetongjine = fhetongjine;
		this.fbjdsr = fbjdsr;
		this.fbndzsr = fbndzsr;
		this.fzsr = fzsr;
		this.fbjdzcb = fbjdzcb;
		this.fbnzcb = fbnzcb;
		this.fzcb = fzcb;
		this.fglf = fglf;
		this.ffpkjwdz = ffpkjwdz;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.flr = flr;
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

	@Column(name = "fhetongid")
	public Long getFhetongid() {
		return this.fhetongid;
	}

	public void setFhetongid(Long fhetongid) {
		this.fhetongid = fhetongid;
	}

	@Column(name = "fhetongname", length = 64)
	public String getFhetongname() {
		return this.fhetongname;
	}

	public void setFhetongname(String fhetongname) {
		this.fhetongname = fhetongname;
	}

	@Column(name = "fhetongjine", precision = 20)
	public Double getFhetongjine() {
		return this.fhetongjine;
	}

	public void setFhetongjine(Double fhetongjine) {
		this.fhetongjine = fhetongjine;
	}

	@Column(name = "fbjdsr", precision = 20)
	public Double getFbjdsr() {
		return this.fbjdsr;
	}

	public void setFbjdsr(Double fbjdsr) {
		this.fbjdsr = fbjdsr;
	}

	@Column(name = "fbndzsr", precision = 20)
	public Double getFbndzsr() {
		return this.fbndzsr;
	}

	public void setFbndzsr(Double fbndzsr) {
		this.fbndzsr = fbndzsr;
	}

	@Column(name = "fzsr", precision = 20)
	public Double getFzsr() {
		return this.fzsr;
	}

	public void setFzsr(Double fzsr) {
		this.fzsr = fzsr;
	}

	@Column(name = "fbjdzcb", precision = 20)
	public Double getFbjdzcb() {
		return this.fbjdzcb;
	}

	public void setFbjdzcb(Double fbjdzcb) {
		this.fbjdzcb = fbjdzcb;
	}

	@Column(name = "fbnzcb", precision = 20)
	public Double getFbnzcb() {
		return this.fbnzcb;
	}

	public void setFbnzcb(Double fbnzcb) {
		this.fbnzcb = fbnzcb;
	}

	@Column(name = "fzcb", precision = 20)
	public Double getFzcb() {
		return this.fzcb;
	}

	public void setFzcb(Double fzcb) {
		this.fzcb = fzcb;
	}

	@Column(name = "fglf", precision = 20)
	public Double getFglf() {
		return this.fglf;
	}

	public void setFglf(Double fglf) {
		this.fglf = fglf;
	}

	@Column(name = "ffpkjwdz", precision = 20)
	public Double getFfpkjwdz() {
		return this.ffpkjwdz;
	}

	public void setFfpkjwdz(Double ffpkjwdz) {
		this.ffpkjwdz = ffpkjwdz;
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
	 * @return the flistid
	 */
	public Long getFlistid() {
		return flistid;
	}

	/**
	 * @param flistid the flistid to set
	 */
	@Column(name = "flistid")
	public void setFlistid(Long flistid) {
		this.flistid = flistid;
	}

	/**
	 * @return the flr
	 */
	public Double getFlr() {
		return flr;
	}

	/**
	 * @param flr the flr to set
	 */
	@Column(name = "flr", precision = 20)
	public void setFlr(Double flr) {
		this.flr = flr;
	}

}