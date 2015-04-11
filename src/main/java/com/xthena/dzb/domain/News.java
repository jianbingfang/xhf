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
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_comm_news", catalog = "xhf")
public class News implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private String ffwdw;
	private Date fdate;
	private Long fbjren;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(String fname, String ffwdw, Date fdate, Long fbjren,
			String fmemo, String fmemo1, String fmemo2) {
		this.fname = fname;
		this.ffwdw = ffwdw;
		this.fdate = fdate;
		this.fbjren = fbjren;
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

	@Column(name = "fname", length = 100)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "ffwdw", length = 64)
	public String getFfwdw() {
		return this.ffwdw;
	}

	public void setFfwdw(String ffwdw) {
		this.ffwdw = ffwdw;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fbjren")
	public Long getFbjren() {
		return this.fbjren;
	}

	public void setFbjren(Long fbjren) {
		this.fbjren = fbjren;
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