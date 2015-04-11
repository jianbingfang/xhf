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
 * CwXmhslist entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_cw_xmhslist", catalog = "xhf")
public class CwXmhslist implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fquarter;
	private Date fstartdate;
	private Date fenddate;
	private String fjsstate;
	private String fsx;
	private String fmemo1;

	// Constructors

	/** default constructor */
	public CwXmhslist() {
	}

	/** full constructor */
	public CwXmhslist(String fquarter, Date fstartdate, Date fenddate,
			String fjsstate, String fsx, String fmemo1) {
		this.fquarter = fquarter;
		this.fstartdate = fstartdate;
		this.fenddate = fenddate;
		this.fjsstate = fjsstate;
		this.fsx = fsx;
		this.fmemo1 = fmemo1;
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

	@Column(name = "fquarter", length = 20)
	public String getFquarter() {
		return this.fquarter;
	}

	public void setFquarter(String fquarter) {
		this.fquarter = fquarter;
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

	@Column(name = "fjsstate", length = 20)
	public String getFjsstate() {
		return this.fjsstate;
	}

	public void setFjsstate(String fjsstate) {
		this.fjsstate = fjsstate;
	}

	@Column(name = "fsx", length = 20)
	public String getFsx() {
		return this.fsx;
	}

	public void setFsx(String fsx) {
		this.fsx = fsx;
	}

	@Column(name = "fmemo1", length = 20)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

}