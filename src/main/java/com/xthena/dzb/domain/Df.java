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
 * Df entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_dzb_df", catalog = "xhf")
public class Df implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private Date fjfdate;
	private Double fprice;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;

	// Constructors

	/** default constructor */
	public Df() {
	}

	/** full constructor */
	public Df(String fname, Date fjfdate, Double fprice, String fmemo,
			String fmemo1, String fmemo2, String fmemo3) {
		this.fname = fname;
		this.fjfdate = fjfdate;
		this.fprice = fprice;
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
	@Column(name = "fjfdate", length = 10)
	public Date getFjfdate() {
		return this.fjfdate;
	}

	public void setFjfdate(Date fjfdate) {
		this.fjfdate = fjfdate;
	}

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
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