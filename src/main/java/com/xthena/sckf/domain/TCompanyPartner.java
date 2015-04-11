package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TCompanyPartner entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_company_partner", catalog = "xhf")
public class TCompanyPartner implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private String faddress;
	private String fcity;
	private String flinkman;
	private String fphone;
	private String fkhh;
	private String fyhzh;
	private String fmemo;
	private String fmemo1;

	// Constructors

	/** default constructor */
	public TCompanyPartner() {
	}

	/** full constructor */
	public TCompanyPartner(String fname, String faddress, String fcity,
			String flinkman, String fphone, String fkhh, String fyhzh,
			String fmemo, String fmemo1) {
		this.fname = fname;
		this.faddress = faddress;
		this.fcity = fcity;
		this.flinkman = flinkman;
		this.fphone = fphone;
		this.fkhh = fkhh;
		this.fyhzh = fyhzh;
		this.fmemo = fmemo;
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

	@Column(name = "fname", length = 64)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "faddress", length = 200)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "fcity", length = 20)
	public String getFcity() {
		return this.fcity;
	}

	public void setFcity(String fcity) {
		this.fcity = fcity;
	}

	@Column(name = "flinkman", length = 20)
	public String getFlinkman() {
		return this.flinkman;
	}

	public void setFlinkman(String flinkman) {
		this.flinkman = flinkman;
	}

	@Column(name = "fphone", length = 64)
	public String getFphone() {
		return this.fphone;
	}

	public void setFphone(String fphone) {
		this.fphone = fphone;
	}

	@Column(name = "fkhh", length = 64)
	public String getFkhh() {
		return this.fkhh;
	}

	public void setFkhh(String fkhh) {
		this.fkhh = fkhh;
	}

	@Column(name = "fyhzh", length = 64)
	public String getFyhzh() {
		return this.fyhzh;
	}

	public void setFyhzh(String fyhzh) {
		this.fyhzh = fyhzh;
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

}