package com.xthena.sckf.domain;
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
 * TZjDingdan entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_zj_dingdan", catalog = "xhf")
public class TZjDingdan implements java.io.Serializable {

	// Fields

	private Long id;
	private String fddcode;
	private Long fzjid;
	private Long fryid;
	private Date fstartdate;
	private Date fenddate;
	private String fstate;
	private Long fxmid;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;

	// Constructors

	/** default constructor */
	public TZjDingdan() {
	}

	/** full constructor */
	public TZjDingdan(String fddcode, Long fzjid, Long fryid, Date fstartdate,
			Date fenddate, String fstate, Long fxmid, String fmemo,
			String fmemo1, String fmemo2, String fmemo3) {
		this.fddcode = fddcode;
		this.fzjid = fzjid;
		this.fryid = fryid;
		this.fstartdate = fstartdate;
		this.fenddate = fenddate;
		this.fstate = fstate;
		this.fxmid = fxmid;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fmemo3 = fmemo3;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "fddcode", length = 64)
	public String getFddcode() {
		return this.fddcode;
	}

	public void setFddcode(String fddcode) {
		this.fddcode = fddcode;
	}

	@Column(name = "fzjid")
	public Long getFzjid() {
		return this.fzjid;
	}

	public void setFzjid(Long fzjid) {
		this.fzjid = fzjid;
	}

	@Column(name = "fryid")
	public Long getFryid() {
		return this.fryid;
	}

	public void setFryid(Long fryid) {
		this.fryid = fryid;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fstartdate", length = 10)
	public Date getFstartdate() {
		return this.fstartdate;
	}

	public void setFstartdate(Date fstartdate) {
		this.fstartdate = fstartdate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fenddate", length = 10)
	public Date getFenddate() {
		return this.fenddate;
	}

	public void setFenddate(Date fenddate) {
		this.fenddate = fenddate;
	}

	@Column(name = "fstate", length = 20)
	public String getFstate() {
		return this.fstate;
	}

	public void setFstate(String fstate) {
		this.fstate = fstate;
	}

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fmemo", length = 200)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 200)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 200)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

	@Column(name = "fmemo3", length = 200)
	public String getFmemo3() {
		return this.fmemo3;
	}

	public void setFmemo3(String fmemo3) {
		this.fmemo3 = fmemo3;
	}

}