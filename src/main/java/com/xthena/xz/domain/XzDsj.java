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
 * XzDsj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_zj_dsj", catalog = "xhf")
public class XzDsj implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fshijian;
	private Date fdate;
	private String fcontent;
	private String fmemo;

	// Constructors

	/** default constructor */
	public XzDsj() {
	}

	/** full constructor */
	public XzDsj(String fshijian, Date fdate, String fcontent, String fmemo) {
		this.fshijian = fshijian;
		this.fdate = fdate;
		this.fcontent = fcontent;
		this.fmemo = fmemo;
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

	@Column(name = "fshijian", length = 100)
	public String getFshijian() {
		return this.fshijian;
	}

	public void setFshijian(String fshijian) {
		this.fshijian = fshijian;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fcontent", length = 4000)
	public String getFcontent() {
		return this.fcontent;
	}

	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}

	@Column(name = "fmemo", length = 200)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

}