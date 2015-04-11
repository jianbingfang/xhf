package com.xthena.xz.domain;

// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Hetong entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_hetong", catalog = "xhf")
public class Hetong implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fcode;
	private String fname;
	private String faddress;
	private String fgcgm;
	private String fry;
	private Date fhtdate;
	private Date fstartdate;
	private Date fenddate;
	private String fweituoren;
	private String fzaojia;
	private String fjianliqufei;
	private String fjianlifei;
	private String fpaytype;
	private String fflow;
	private String fprojecttype;

	// Constructors

	/** default constructor */
	public Hetong() {
	}

	/** minimal constructor */
	public Hetong(String fcode, String fname, String faddress, String fry,
			Date fhtdate, Date fstartdate, Date fenddate, String fweituoren,
			String fzaojia, String fjianliqufei, String fjianlifei,
			String fpaytype, String fflow) {
		this.fcode = fcode;
		this.fname = fname;
		this.faddress = faddress;
		this.fry = fry;
		this.fhtdate = fhtdate;
		this.fstartdate = fstartdate;
		this.fenddate = fenddate;
		this.fweituoren = fweituoren;
		this.fzaojia = fzaojia;
		this.fjianliqufei = fjianliqufei;
		this.fjianlifei = fjianlifei;
		this.fpaytype = fpaytype;
		this.fflow = fflow;
	}

	/** full constructor */
	public Hetong(String fcode, String fname, String faddress, String fgcgm,
			String fry, Date fhtdate, Date fstartdate, Date fenddate,
			String fweituoren, String fzaojia, String fjianliqufei,String fprojecttype,
			String fjianlifei, String fpaytype, String fflow) {
		this.fcode = fcode;
		this.fname = fname;
		this.faddress = faddress;
		this.fgcgm = fgcgm;
		this.fry = fry;
		this.fhtdate = fhtdate;
		this.fstartdate = fstartdate;
		this.fenddate = fenddate;
		this.fweituoren = fweituoren;
		this.fzaojia = fzaojia;
		this.fjianliqufei = fjianliqufei;
		this.fjianlifei = fjianlifei;
		this.fpaytype = fpaytype;
		this.fflow = fflow;
		this.fprojecttype = fprojecttype;
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

	@Column(name = "fcode", nullable = false, length = 64)
	public String getFcode() {
		return this.fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "fname", nullable = false, length = 64)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "faddress", nullable = false, length = 64)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "fgcgm", length = 64)
	public String getFgcgm() {
		return this.fgcgm;
	}

	public void setFgcgm(String fgcgm) {
		this.fgcgm = fgcgm;
	}

	@Column(name = "fry", nullable = false, length = 64)
	public String getFry() {
		return this.fry;
	}

	public void setFry(String fry) {
		this.fry = fry;
	}

	@Column(name = "fhtdate", nullable = false, length = 19)
	public Date getFhtdate() {
		return this.fhtdate;
	}

	public void setFhtdate(Date fhtdate) {
		this.fhtdate = fhtdate;
	}

	@Column(name = "fstartdate", nullable = false, length = 19)
	public Date getFstartdate() {
		return this.fstartdate;
	}

	public void setFstartdate(Date fstartdate) {
		this.fstartdate = fstartdate;
	}

	@Column(name = "fenddate", nullable = false, length = 19)
	public Date getFenddate() {
		return this.fenddate;
	}

	public void setFenddate(Date fenddate) {
		this.fenddate = fenddate;
	}

	@Column(name = "fweituoren", nullable = false, length = 64)
	public String getFweituoren() {
		return this.fweituoren;
	}

	public void setFweituoren(String fweituoren) {
		this.fweituoren = fweituoren;
	}

	@Column(name = "fzaojia", nullable = false, length = 64)
	public String getFzaojia() {
		return this.fzaojia;
	}

	public void setFzaojia(String fzaojia) {
		this.fzaojia = fzaojia;
	}

	@Column(name = "fjianliqufei", nullable = false, length = 64)
	public String getFjianliqufei() {
		return this.fjianliqufei;
	}

	public void setFjianliqufei(String fjianliqufei) {
		this.fjianliqufei = fjianliqufei;
	}

	@Column(name = "fjianlifei", nullable = false, length = 64)
	public String getFjianlifei() {
		return this.fjianlifei;
	}

	public void setFjianlifei(String fjianlifei) {
		this.fjianlifei = fjianlifei;
	}

	@Column(name = "fpaytype", nullable = false, length = 64)
	public String getFpaytype() {
		return this.fpaytype;
	}

	public void setFpaytype(String fpaytype) {
		this.fpaytype = fpaytype;
	}

	@Column(name = "fflow", nullable = false, length = 64)
	public String getFflow() {
		return this.fflow;
	}

	public void setFflow(String fflow) {
		this.fflow = fflow;
	}

	@Column(name = "fprojecttype")
	public String getFprojecttype() {
		return fprojecttype;
	}

	public void setFprojecttype(String fprojecttype) {
		this.fprojecttype = fprojecttype;
	}

}