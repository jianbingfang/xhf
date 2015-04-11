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
 * CwGd entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_cw_gd", catalog = "xhf")
public class CwGd implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fwzcode;
	private String fwzname;
	private String fwztype;
	private Date fzjdate;
	private Double fzjjine;
	private Long fxmid;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;
	private String fmemo4;

	// Constructors

	/** default constructor */
	public CwGd() {
	}

	/** full constructor */
	public CwGd(String fwzcode, String fwzname, String fwztype, Date fzjdate,
			Double fzjjine, Long fxmid, String fmemo, String fmemo1,
			String fmemo2, String fmemo3, String fmemo4) {
		this.fwzcode = fwzcode;
		this.fwzname = fwzname;
		this.fwztype = fwztype;
		this.fzjdate = fzjdate;
		this.fzjjine = fzjjine;
		this.fxmid = fxmid;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fmemo3 = fmemo3;
		this.fmemo4 = fmemo4;
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

	@Column(name = "fwzcode", length = 64)
	public String getFwzcode() {
		return this.fwzcode;
	}

	public void setFwzcode(String fwzcode) {
		this.fwzcode = fwzcode;
	}

	@Column(name = "fwzname", length = 64)
	public String getFwzname() {
		return this.fwzname;
	}

	public void setFwzname(String fwzname) {
		this.fwzname = fwzname;
	}

	@Column(name = "fwztype", length = 64)
	public String getFwztype() {
		return this.fwztype;
	}

	public void setFwztype(String fwztype) {
		this.fwztype = fwztype;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fzjdate", length = 10)
	public Date getFzjdate() {
		return this.fzjdate;
	}

	public void setFzjdate(Date fzjdate) {
		this.fzjdate = fzjdate;
	}

	@Column(name = "fzjjine", precision = 20)
	public Double getFzjjine() {
		return this.fzjjine;
	}

	public void setFzjjine(Double fzjjine) {
		this.fzjjine = fzjjine;
	}

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
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

	@Column(name = "fmemo3", length = 64)
	public String getFmemo3() {
		return this.fmemo3;
	}

	public void setFmemo3(String fmemo3) {
		this.fmemo3 = fmemo3;
	}

	@Column(name = "fmemo4", length = 64)
	public String getFmemo4() {
		return this.fmemo4;
	}

	public void setFmemo4(String fmemo4) {
		this.fmemo4 = fmemo4;
	}

}