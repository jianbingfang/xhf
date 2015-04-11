package com.xthena.jl.domain;

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
 * TJlRysq entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_jl_rysq", catalog = "xhf")
public class JlRysq implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long fxmid;
	private String fgangw;
	private Integer frenshu;
	private String fyuanyin;
	private String fstatus;
	private String fmemo;
	private String fmemo1;
	private Date fshenqingdate;
	private Date fshenpidate;
	private String fshenpiinfo;

	// Constructors

	/** default constructor */
	public JlRysq() {
	}

	/** full constructor */
	public JlRysq(Long fxmid, String fgangw, Integer frenshu, String fyuanyin,
			String fstatus, String fmemo, String fmemo1, Date fshenqingdate,
			Date fshenpidate, String fshenpiinfo) {
		this.fxmid = fxmid;
		this.fgangw = fgangw;
		this.frenshu = frenshu;
		this.fyuanyin = fyuanyin;
		this.fstatus = fstatus;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fshenqingdate = fshenqingdate;
		this.fshenpidate = fshenpidate;
		this.fshenpiinfo = fshenpiinfo;
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

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fgangw", length = 64)
	public String getFgangw() {
		return this.fgangw;
	}

	public void setFgangw(String fgangw) {
		this.fgangw = fgangw;
	}

	@Column(name = "frenshu")
	public Integer getFrenshu() {
		return this.frenshu;
	}

	public void setFrenshu(Integer frenshu) {
		this.frenshu = frenshu;
	}

	@Column(name = "fyuanyin", length = 512)
	public String getFyuanyin() {
		return this.fyuanyin;
	}

	public void setFyuanyin(String fyuanyin) {
		this.fyuanyin = fyuanyin;
	}

	@Column(name = "fstatus", length = 64)
	public String getFstatus() {
		return this.fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

	@Column(name = "fmemo", length = 512)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 512)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fshenqingdate", length = 10)
	public Date getFshenqingdate() {
		return this.fshenqingdate;
	}

	public void setFshenqingdate(Date fshenqingdate) {
		this.fshenqingdate = fshenqingdate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fshenpidate", length = 10)
	public Date getFshenpidate() {
		return this.fshenpidate;
	}

	public void setFshenpidate(Date fshenpidate) {
		this.fshenpidate = fshenpidate;
	}

	@Column(name = "fshenpiinfo", length = 512)
	public String getFshenpiinfo() {
		return this.fshenpiinfo;
	}

	public void setFshenpiinfo(String fshenpiinfo) {
		this.fshenpiinfo = fshenpiinfo;
	}

}