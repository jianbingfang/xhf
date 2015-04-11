package com.xthena.xz.domain;

// default package

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * XzCommHuiyi entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_comm_huiyi", catalog = "xhf")
public class XzCommHuiyi implements java.io.Serializable {

	// Fields

	private Long fid;
	private String ftype;
	private String faddress;
	private String fhyzt;
	private Date fhydate;
	private String fhycode;
	private String fzhuchir;
	private String fcanyurenyuan;
	private String fhycontent;
	private String fresult;
	private String fhyjf;
	private String ffpkjqk;
	private String fneiwai;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public XzCommHuiyi() {
	}

	/** full constructor */
	public XzCommHuiyi(String ftype, String faddress, String fhyzt,
			Date fhydate, String fhycode, String fzhuchir,
			String fcanyurenyuan, String fhycontent, String fresult,
			String fhyjf, String ffpkjqk, String fneiwai, String fmemo,
			String fmemo1, String fmemo2) {
		this.ftype = ftype;
		this.faddress = faddress;
		this.fhyzt = fhyzt;
		this.fhydate = fhydate;
		this.fhycode = fhycode;
		this.fzhuchir = fzhuchir;
		this.fcanyurenyuan = fcanyurenyuan;
		this.fhycontent = fhycontent;
		this.fresult = fresult;
		this.fhyjf = fhyjf;
		this.ffpkjqk = ffpkjqk;
		this.fneiwai = fneiwai;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
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

	@Column(name = "ftype", length = 64)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	@Column(name = "faddress", length = 200)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "fhyzt", length = 64)
	public String getFhyzt() {
		return this.fhyzt;
	}

	public void setFhyzt(String fhyzt) {
		this.fhyzt = fhyzt;
	}

	@Column(name = "fhydate", length = 19)
	public Date getFhydate() {
		return this.fhydate;
	}

	public void setFhydate(Date fhydate) {
		this.fhydate = fhydate;
	}

	@Column(name = "fhycode", length = 64)
	public String getFhycode() {
		return this.fhycode;
	}

	public void setFhycode(String fhycode) {
		this.fhycode = fhycode;
	}

	@Column(name = "fzhuchir", length = 64)
	public String getFzhuchir() {
		return this.fzhuchir;
	}

	public void setFzhuchir(String fzhuchir) {
		this.fzhuchir = fzhuchir;
	}

	@Column(name = "fcanyurenyuan", length = 4000)
	public String getFcanyurenyuan() {
		return this.fcanyurenyuan;
	}

	public void setFcanyurenyuan(String fcanyurenyuan) {
		this.fcanyurenyuan = fcanyurenyuan;
	}

	@Column(name = "fhycontent", length = 4000)
	public String getFhycontent() {
		return this.fhycontent;
	}

	public void setFhycontent(String fhycontent) {
		this.fhycontent = fhycontent;
	}

	@Column(name = "fresult", length = 4000)
	public String getFresult() {
		return this.fresult;
	}

	public void setFresult(String fresult) {
		this.fresult = fresult;
	}

	@Column(name = "fhyjf", length = 1000)
	public String getFhyjf() {
		return this.fhyjf;
	}

	public void setFhyjf(String fhyjf) {
		this.fhyjf = fhyjf;
	}

	@Column(name = "ffpkjqk")
	public String getFfpkjqk() {
		return this.ffpkjqk;
	}

	public void setFfpkjqk(String ffpkjqk) {
		this.ffpkjqk = ffpkjqk;
	}

	@Column(name = "fneiwai", length = 20)
	public String getFneiwai() {
		return this.fneiwai;
	}

	public void setFneiwai(String fneiwai) {
		this.fneiwai = fneiwai;
	}

	@Column(name = "fmemo", length = 1000)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 1000)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 1000)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}