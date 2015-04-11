package com.xthena.gh.domain;
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
 * ZiFei entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_gh_zifei", catalog = "xhf")
public class ZiFei implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fno;
	private String fname;
	private Date fdate;
	private Double fprice;
	private String fjsren;
	private String fjqren;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;

	// Constructors

	/** default constructor */
	public ZiFei() {
	}

	/** full constructor */
	public ZiFei(String fno, String fname, Date fdate, Double fprice,
			String fjsren, String fjqren, String fmemo, String fmemo1,
			String fmemo2, String fmemo3) {
		this.fno = fno;
		this.fname = fname;
		this.fdate = fdate;
		this.fprice = fprice;
		this.fjsren = fjsren;
		this.fjqren = fjqren;
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

	@Column(name = "fno", length = 20)
	public String getFno() {
		return this.fno;
	}

	public void setFno(String fno) {
		this.fno = fno;
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

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	@Column(name = "fjsren")
	public String getFjsren() {
		return this.fjsren;
	}

	public void setFjsren(String fjsren) {
		this.fjsren = fjsren;
	}

	@Column(name = "fjqren")
	public String getFjqren() {
		return this.fjqren;
	}

	public void setFjqren(String fjqren) {
		this.fjqren = fjqren;
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