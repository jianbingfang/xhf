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
 * WzAsk entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_wz_ask", catalog = "xhf")
public class WzAsk implements java.io.Serializable {

	// Fields

	private Long fid;
	private String faskno;
	private String faskbm;
	private String faskxm;
	private String fwplx;
	private String faskyt;
	private Date faskdate;
	private String faskry;
	private Long fspr;
	private String fspyj;
	private String fjfqk;
	private String fjnje;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fstatus;

	// Constructors

	/** default constructor */
	public WzAsk() {
	}

	/** full constructor */
	public WzAsk(String faskno, String faskbm, String faskxm, String fwplx,
			String faskyt, Date faskdate, String faskry, Long fspr, String fspyj,
			String fjfqk, String fjnje, String fmemo, String fmemo1,
			String fmemo2, String fstatus) {
		this.faskno = faskno;
		this.faskbm = faskbm;
		this.faskxm = faskxm;
		this.fwplx = fwplx;
		this.faskyt = faskyt;
		this.faskdate = faskdate;
		this.faskry = faskry;
		this.fspr = fspr;
		this.fspyj = fspyj;
		this.fjfqk = fjfqk;
		this.fjnje = fjnje;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fstatus = fstatus;
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

	@Column(name = "faskno", length = 64)
	public String getFaskno() {
		return this.faskno;
	}

	public void setFaskno(String faskno) {
		this.faskno = faskno;
	}

	@Column(name = "faskbm", length = 64)
	public String getFaskbm() {
		return this.faskbm;
	}

	public void setFaskbm(String faskbm) {
		this.faskbm = faskbm;
	}

	@Column(name = "faskxm")
	public String getFaskxm() {
		return this.faskxm;
	}

	public void setFaskxm(String faskxm) {
		this.faskxm = faskxm;
	}

	@Column(name = "fwplx", length = 64)
	public String getFwplx() {
		return this.fwplx;
	}

	public void setFwplx(String fwplx) {
		this.fwplx = fwplx;
	}

	@Column(name = "faskyt", length = 500)
	public String getFaskyt() {
		return this.faskyt;
	}

	public void setFaskyt(String faskyt) {
		this.faskyt = faskyt;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "faskdate", length = 10)
	public Date getFaskdate() {
		return this.faskdate;
	}

	public void setFaskdate(Date faskdate) {
		this.faskdate = faskdate;
	}

	@Column(name = "faskry", length = 64)
	public String getFaskry() {
		return this.faskry;
	}

	public void setFaskry(String faskry) {
		this.faskry = faskry;
	}

	@Column(name = "fspr")
	public Long getFspr() {
		return this.fspr;
	}

	public void setFspr(Long fspr) {
		this.fspr = fspr;
	}

	@Column(name = "fspyj", length = 100)
	public String getFspyj() {
		return this.fspyj;
	}

	public void setFspyj(String fspyj) {
		this.fspyj = fspyj;
	}

	@Column(name = "fjfqk", length = 100)
	public String getFjfqk() {
		return this.fjfqk;
	}

	public void setFjfqk(String fjfqk) {
		this.fjfqk = fjfqk;
	}

	@Column(name = "fjnje", length = 64)
	public String getFjnje() {
		return this.fjnje;
	}

	public void setFjnje(String fjnje) {
		this.fjnje = fjnje;
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

	@Column(name = "fstatus", length = 64)
	public String getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

}