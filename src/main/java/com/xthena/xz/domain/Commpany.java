package com.xthena.xz.domain;
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
 * Commpany entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_company", catalog = "xhf")
public class Commpany implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fname;
	private String faddress;
	private Long ffuzeren;
	private String ftel;
	private Long fjsfzr;
	private Date fbadate;
	private String fnpry;
	private Date fyxdate;
	private String fglxyqdqk;
	private Date fxyqdqk;
	private Double fglfmoney;
	private String fglpay;
	private Double fyfjine;
	private Double fxczfje;
	private Date fxczfsj;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public Commpany() {
	}

	/** full constructor */
	public Commpany(String fname, String faddress, Long ffuzeren, String ftel,
			Long fjsfzr, Date fbadate, String fnpry, Date fyxdate,
			String fglxyqdqk, Date fxyqdqk, Double fglfmoney, String fglpay,
			Double fyfjine, Double fxczfje, Date fxczfsj) {
		this.fname = fname;
		this.faddress = faddress;
		this.ffuzeren = ffuzeren;
		this.ftel = ftel;
		this.fjsfzr = fjsfzr;
		this.fbadate = fbadate;
		this.fnpry = fnpry;
		this.fyxdate = fyxdate;
		this.fglxyqdqk = fglxyqdqk;
		this.fxyqdqk = fxyqdqk;
		this.fglfmoney = fglfmoney;
		this.fglpay = fglpay;
		this.fyfjine = fyfjine;
		this.fxczfje = fxczfje;
		this.fxczfsj = fxczfsj;
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

	@Column(name = "fname", length = 512)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "faddress", length = 512)
	public String getFaddress() {
		return this.faddress;
	}

	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}

	@Column(name = "ffuzeren")
	public Long getFfuzeren() {
		return this.ffuzeren;
	}

	public void setFfuzeren(Long ffuzeren) {
		this.ffuzeren = ffuzeren;
	}

	@Column(name = "ftel", length = 64)
	public String getFtel() {
		return this.ftel;
	}

	public void setFtel(String ftel) {
		this.ftel = ftel;
	}

	@Column(name = "fjsfzr")
	public Long getFjsfzr() {
		return this.fjsfzr;
	}

	public void setFjsfzr(Long fjsfzr) {
		this.fjsfzr = fjsfzr;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fbadate", length = 10)
	public Date getFbadate() {
		return this.fbadate;
	}

	public void setFbadate(Date fbadate) {
		this.fbadate = fbadate;
	}

	@Column(name = "fnpry", length = 200)
	public String getFnpry() {
		return this.fnpry;
	}

	public void setFnpry(String fnpry) {
		this.fnpry = fnpry;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fyxdate", length = 10)
	public Date getFyxdate() {
		return this.fyxdate;
	}

	public void setFyxdate(Date fyxdate) {
		this.fyxdate = fyxdate;
	}

	@Column(name = "fglxyqdqk", length = 20)
	public String getFglxyqdqk() {
		return this.fglxyqdqk;
	}

	public void setFglxyqdqk(String fglxyqdqk) {
		this.fglxyqdqk = fglxyqdqk;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fxyqdqk", length = 10)
	public Date getFxyqdqk() {
		return this.fxyqdqk;
	}

	public void setFxyqdqk(Date fxyqdqk) {
		this.fxyqdqk = fxyqdqk;
	}

	@Column(name = "fglfmoney", precision = 20)
	public Double getFglfmoney() {
		return this.fglfmoney;
	}

	public void setFglfmoney(Double fglfmoney) {
		this.fglfmoney = fglfmoney;
	}

	@Column(name = "fglpay", length = 200)
	public String getFglpay() {
		return this.fglpay;
	}

	public void setFglpay(String fglpay) {
		this.fglpay = fglpay;
	}

	@Column(name = "fyfjine", precision = 20)
	public Double getFyfjine() {
		return this.fyfjine;
	}

	public void setFyfjine(Double fyfjine) {
		this.fyfjine = fyfjine;
	}

	@Column(name = "fxczfje", precision = 20)
	public Double getFxczfje() {
		return this.fxczfje;
	}

	public void setFxczfje(Double fxczfje) {
		this.fxczfje = fxczfje;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fxczfsj", length = 10)
	public Date getFxczfsj() {
		return this.fxczfsj;
	}

	public void setFxczfsj(Date fxczfsj) {
		this.fxczfsj = fxczfsj;
	}

	/**
	 * @return the fmemo
	 */
	@Column(name = "fmemo", precision = 200)
	public String getFmemo() {
		return fmemo;
	}

	/**
	 * @param fmemo the fmemo to set
	 */
	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	/**
	 * @return the fmemo1
	 */
	@Column(name = "fmemo1", precision = 200)
	public String getFmemo1() {
		return fmemo1;
	}

	/**
	 * @param fmemo1 the fmemo1 to set
	 */
	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	/**
	 * @return the fmemo2
	 */
	@Column(name = "fmemo2", precision = 200)
	public String getFmemo2() {
		return fmemo2;
	}

	/**
	 * @param fmemo2 the fmemo2 to set
	 */
	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}