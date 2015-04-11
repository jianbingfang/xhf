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
 * WzIo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_wz_io", catalog = "xhf")
public class WzIo implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long fwzid;
	private Long fdcxm;
	private Long fdrxm;
	private String fyy;
	private Date fdate;
	private Long fjbr;
	private String fwhqk;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public WzIo() {
	}

	/** full constructor */
	public WzIo(Long fwzid, Long fdcxm, Long fdrxm, String fyy, Date fdate,
			Long fjbr, String fwhqk, String fmemo, String fmemo1, String fmemo2) {
		this.fwzid = fwzid;
		this.fdcxm = fdcxm;
		this.fdrxm = fdrxm;
		this.fyy = fyy;
		this.fdate = fdate;
		this.fjbr = fjbr;
		this.fwhqk = fwhqk;
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

	@Column(name = "fwzid")
	public Long getFwzid() {
		return this.fwzid;
	}

	public void setFwzid(Long fwzid) {
		this.fwzid = fwzid;
	}

	@Column(name = "fdcxm")
	public Long getFdcxm() {
		return this.fdcxm;
	}

	public void setFdcxm(Long fdcxm) {
		this.fdcxm = fdcxm;
	}

	@Column(name = "fdrxm")
	public Long getFdrxm() {
		return this.fdrxm;
	}

	public void setFdrxm(Long fdrxm) {
		this.fdrxm = fdrxm;
	}

	@Column(name = "fyy", length = 200)
	public String getFyy() {
		return this.fyy;
	}

	public void setFyy(String fyy) {
		this.fyy = fyy;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fjbr")
	public Long getFjbr() {
		return this.fjbr;
	}

	public void setFjbr(Long fjbr) {
		this.fjbr = fjbr;
	}

	@Column(name = "fwhqk", length = 100)
	public String getFwhqk() {
		return this.fwhqk;
	}

	public void setFwhqk(String fwhqk) {
		this.fwhqk = fwhqk;
	}

	@Column(name = "fmemo", length = 500)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 500)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 500)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}