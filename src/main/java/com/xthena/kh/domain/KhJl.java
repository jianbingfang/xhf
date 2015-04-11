package com.xthena.kh.domain;
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
 * KhJl entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_khw_jl", catalog = "xhf")
public class KhJl implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private Date fdate;
	private String fkhzcy;
	private String fkhjg;
	private String ftype;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;

	// Constructors

	/** default constructor */
	public KhJl() {
	}

	/** full constructor */
	public KhJl(String fname, Date fdate, String fkhzcy, String fkhjg,
			String ftype, String fmemo, String fmemo1, String fmemo2,
			String fmemo3) {
		this.fname = fname;
		this.fdate = fdate;
		this.fkhzcy = fkhzcy;
		this.fkhjg = fkhjg;
		this.ftype = ftype;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fmemo3 = fmemo3;
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

	@Column(name = "fname", length = 20)
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

	@Column(name = "fkhzcy", length = 200)
	public String getFkhzcy() {
		return this.fkhzcy;
	}

	public void setFkhzcy(String fkhzcy) {
		this.fkhzcy = fkhzcy;
	}

	@Column(name = "fkhjg", length = 1000)
	public String getFkhjg() {
		return this.fkhjg;
	}

	public void setFkhjg(String fkhjg) {
		this.fkhjg = fkhjg;
	}

	@Column(name = "ftype", length = 20)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
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

	@Column(name = "fmemo3", length = 400)
	public String getFmemo3() {
		return this.fmemo3;
	}

	public void setFmemo3(String fmemo3) {
		this.fmemo3 = fmemo3;
	}

}