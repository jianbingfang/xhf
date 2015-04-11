package com.xthena.cw.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CwHtfx entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_cw_htfx", catalog = "xhf")
public class CwHtFx implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long flistid;
	private Long fhetongid;
	private String fhetongname;
	private String fhetongjine;
	private String fsjzsr;
	private String fyszk;
	private String fhsl;
	private String fysjlf;
	private String flyl;
	private String fgcjd;
	private String fqksm;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public CwHtFx() {
	}

	/** minimal constructor */
	public CwHtFx(Long flistid) {
		this.flistid = flistid;
	}

	/** full constructor */
	public CwHtFx(Long flistid, Long fhetongid, String fhetongname,
			String fhetongjine, String fsjzsr, String fyszk, String fhsl,
			String fysjlf, String flyl, String fgcjd, String fqksm,
			String fmemo, String fmemo1, String fmemo2) {
		this.flistid = flistid;
		this.fhetongid = fhetongid;
		this.fhetongname = fhetongname;
		this.fhetongjine = fhetongjine;
		this.fsjzsr = fsjzsr;
		this.fyszk = fyszk;
		this.fhsl = fhsl;
		this.fysjlf = fysjlf;
		this.flyl = flyl;
		this.fgcjd = fgcjd;
		this.fqksm = fqksm;
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

	@Column(name = "flistid", nullable = false)
	public Long getFlistid() {
		return this.flistid;
	}

	public void setFlistid(Long flistid) {
		this.flistid = flistid;
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

	@Column(name = "fhetongjine", length = 128)
	public String getFhetongjine() {
		return this.fhetongjine;
	}

	public void setFhetongjine(String fhetongjine) {
		this.fhetongjine = fhetongjine;
	}

	@Column(name = "fsjzsr", length = 128)
	public String getFsjzsr() {
		return this.fsjzsr;
	}

	public void setFsjzsr(String fsjzsr) {
		this.fsjzsr = fsjzsr;
	}

	@Column(name = "fyszk", length = 128)
	public String getFyszk() {
		return this.fyszk;
	}

	public void setFyszk(String fyszk) {
		this.fyszk = fyszk;
	}

	@Column(name = "fhsl", length = 128)
	public String getFhsl() {
		return this.fhsl;
	}

	public void setFhsl(String fhsl) {
		this.fhsl = fhsl;
	}

	@Column(name = "fysjlf", length = 128)
	public String getFysjlf() {
		return this.fysjlf;
	}

	public void setFysjlf(String fysjlf) {
		this.fysjlf = fysjlf;
	}

	@Column(name = "flyl", length = 128)
	public String getFlyl() {
		return this.flyl;
	}

	public void setFlyl(String flyl) {
		this.flyl = flyl;
	}

	@Column(name = "fgcjd", length = 128)
	public String getFgcjd() {
		return this.fgcjd;
	}

	public void setFgcjd(String fgcjd) {
		this.fgcjd = fgcjd;
	}

	@Column(name = "fqksm", length = 128)
	public String getFqksm() {
		return this.fqksm;
	}

	public void setFqksm(String fqksm) {
		this.fqksm = fqksm;
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