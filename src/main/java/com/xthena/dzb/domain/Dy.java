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
@Table(name = "t_dzb_dy", catalog = "xhf")
public class Dy implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fno;
	private String fname;
	private String fsex;
	private String fprovince;
	private String fcity;
	private String fminzu;
	private Date fbirthday;
	private Date fcjgzdate;
	private Date frddate;
	private String fsfzh;
	private String fwhcd;
	private String faddress;
	private String flxdh;
	private String fgzdw;
	private String fszdzb;
	private Date fqdwjjfzdate;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private String fmemo3;
	private String ftype;

	// Constructors

	/** default constructor */
	public Dy() {
	}

	/** full constructor */
	public Dy(String fno, String fname, String fsex, String fprovince,
			String fcity, String fminzu, Date fbirthday, Date fcjgzdate,
			Date frddate, String fsfzh, String fwhcd, String faddress,
			String flxdh, String fgzdw, String fszdzb, Date fqdwjjfzdate,
			String fmemo, String fmemo1, String fmemo2, String fmemo3,
			String ftype) {
		this.fno = fno;
		this.fname = fname;
		this.fsex = fsex;
		this.fprovince = fprovince;
		this.fcity = fcity;
		this.fminzu = fminzu;
		this.fbirthday = fbirthday;
		this.fcjgzdate = fcjgzdate;
		this.frddate = frddate;
		this.fsfzh = fsfzh;
		this.fwhcd = fwhcd;
		this.faddress = faddress;
		this.flxdh = flxdh;
		this.fgzdw = fgzdw;
		this.fszdzb = fszdzb;
		this.fqdwjjfzdate = fqdwjjfzdate;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fmemo3 = fmemo3;
		this.ftype = ftype;
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

	@Column(name = "fsex", length = 10)
	public String getFsex() {
		return this.fsex;
	}

	public void setFsex(String fsex) {
		this.fsex = fsex;
	}

	@Column(name = "fprovince", length = 20)
	public String getFprovince() {
		return this.fprovince;
	}

	public void setFprovince(String fprovince) {
		this.fprovince = fprovince;
	}

	@Column(name = "fcity", length = 20)
	public String getFcity() {
		return this.fcity;
	}

	public void setFcity(String fcity) {
		this.fcity = fcity;
	}

	@Column(name = "fminzu", length = 20)
	public String getFminzu() {
		return this.fminzu;
	}

	public void setFminzu(String fminzu) {
		this.fminzu = fminzu;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fbirthday", length = 20)
	public Date getFbirthday() {
		return this.fbirthday;
	}

	public void setFbirthday(Date fbirthday) {
		this.fbirthday = fbirthday;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fcjgzdate", length = 20)	public Date getFcjgzdate() {
		return this.fcjgzdate;	}

	public void setFcjgzdate(Date fcjgzdate) {
		this.fcjgzdate = fcjgzdate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "frddate", length = 20)
	public Date getFrddate() {
		return this.frddate;
	}

	public void setFrddate(Date frddate) {
		this.frddate = frddate;
	}

	@Column(name = "fsfzh", length = 40)
	public String getFsfzh() {
		return this.fsfzh;
	}

	public void setFsfzh(String fsfzh) {
		this.fsfzh = fsfzh;
	}

	@Column(name = "fwhcd", length = 40)
	public String getFwhcd() {
		return this.fwhcd;
	}

	public void setFwhcd(String fwhcd) {
		this.fwhcd = fwhcd;
	}

	@Column(name = "faddress", length = 40)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "flxdh", length = 40)
	public String getFlxdh() {
		return this.flxdh;
	}

	public void setFlxdh(String flxdh) {
		this.flxdh = flxdh;
	}

	@Column(name = "fgzdw", length = 200)
	public String getFgzdw() {
		return this.fgzdw;
	}

	public void setFgzdw(String fgzdw) {
		this.fgzdw = fgzdw;
	}

	@Column(name = "fszdzb", length = 100)
	public String getFszdzb() {
		return this.fszdzb;
	}

	public void setFszdzb(String fszdzb) {
		this.fszdzb = fszdzb;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fqdwjjfzdate", length = 20)
	public Date getFqdwjjfzdate() {
		return this.fqdwjjfzdate;
	}

	public void setFqdwjjfzdate(Date fqdwjjfzdate) {
		this.fqdwjjfzdate = fqdwjjfzdate;
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

	@Column(name = "ftype", length = 20)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

}