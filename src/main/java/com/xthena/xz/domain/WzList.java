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
 * WzList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_wz_list", catalog = "xhf")
public class WzList implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fcode;
	private String ftype;
	private String fname;
	private String fgg;
	private String flyr;
	private int fnum;
	private Date flydate;
	private Long fxmid;
	private String fsystate;
	private String fxjstate;
	private Double fprice;
	private Double fcprice;
	private Double fsubprice;
	private Double fyscz;
	private Date fzjtjwcdate;
	private Double fyzjprice;
	private String fzjstate;
	private String fzjrule;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;
	private Date fqldate;
	private Double fqlprice;

	// Constructors

	/** default constructor */
	public WzList() {
	}

	/** full constructor */
	public WzList(String fcode, String ftype, String fname, String fgg,
			String flyr, int fnum, Date flydate, Long fxmid, String fsystate,
			String fxjstate, Double fprice, Double fcprice, Double fsubprice,
			Double fyscz, Date fzjtjwcdate, Double fyzjprice, String fzjstate,
			String fzjrule, String fmemo, String fmemo1, String fmemo2,Date fqldate,Double fqlprice) {
		this.fcode = fcode;
		this.ftype = ftype;
		this.fname = fname;
		this.fgg = fgg;
		this.flyr = flyr;
		this.fnum = fnum;
		this.flydate = flydate;
		this.fxmid = fxmid;
		this.fsystate = fsystate;
		this.fxjstate = fxjstate;
		this.fprice = fprice;
		this.fcprice = fcprice;
		this.fsubprice = fsubprice;
		this.fyscz = fyscz;
		this.fzjtjwcdate = fzjtjwcdate;
		this.fyzjprice = fyzjprice;
		this.fzjstate = fzjstate;
		this.fzjrule = fzjrule;
		this.fmemo = fmemo;
		this.fmemo1 = fmemo1;
		this.fmemo2 = fmemo2;
		this.fqldate = fqldate;
		this.fqlprice = fqlprice;
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

	@Column(name = "fcode", length = 64)
	public String getFcode() {
		return this.fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Column(name = "ftype", length = 64)
	public String getFtype() {
		return this.ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	@Column(name = "fname", length = 200)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "fgg", length = 100)
	public String getFgg() {
		return this.fgg;
	}

	public void setFgg(String fgg) {
		this.fgg = fgg;
	}

	@Column(name = "flyr", length = 20)
	public String getFlyr() {
		return this.flyr;
	}

	public void setFlyr(String flyr) {
		this.flyr = flyr;
	}

	@Column(name = "fnum")
	public int getFnum() {
		return this.fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "flydate", length = 10)
	public Date getFlydate() {
		return this.flydate;
	}

	public void setFlydate(Date flydate) {
		this.flydate = flydate;
	}

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fsystate", length = 64)
	public String getFsystate() {
		return this.fsystate;
	}

	public void setFsystate(String fsystate) {
		this.fsystate = fsystate;
	}

	@Column(name = "fxjstate", length = 64)
	public String getFxjstate() {
		return this.fxjstate;
	}

	public void setFxjstate(String fxjstate) {
		this.fxjstate = fxjstate;
	}

	@Column(name = "fprice", precision = 20)
	public Double getFprice() {
		return this.fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	@Column(name = "fcprice", precision = 20)
	public Double getFcprice() {
		return this.fcprice;
	}

	public void setFcprice(Double fcprice) {
		this.fcprice = fcprice;
	}

	@Column(name = "fsubprice", precision = 20)
	public Double getFsubprice() {
		return this.fsubprice;
	}

	public void setFsubprice(Double fsubprice) {
		this.fsubprice = fsubprice;
	}

	@Column(name = "fyscz", precision = 20)
	public Double getFyscz() {
		return this.fyscz;
	}

	public void setFyscz(Double fyscz) {
		this.fyscz = fyscz;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fzjtjwcdate", length = 10)
	public Date getFzjtjwcdate() {
		return this.fzjtjwcdate;
	}

	public void setFzjtjwcdate(Date fzjtjwcdate) {
		this.fzjtjwcdate = fzjtjwcdate;
	}

	@Column(name = "fyzjprice", precision = 20)
	public Double getFyzjprice() {
		return this.fyzjprice;
	}

	public void setFyzjprice(Double fyzjprice) {
		this.fyzjprice = fyzjprice;
	}

	@Column(name = "fzjstate")
	public String getFzjstate() {
		return this.fzjstate;
	}

	public void setFzjstate(String fzjstate) {
		this.fzjstate = fzjstate;
	}

	@Column(name = "fzjrule", length = 64)
	public String getFzjrule() {
		return this.fzjrule;
	}

	public void setFzjrule(String fzjrule) {
		this.fzjrule = fzjrule;
	}

	@Column(name = "fmemo", length = 500)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

	@Column(name = "fmemo1", length = 64)
	public String getFmemo1() {
		return this.fmemo1;
	}

	public void setFmemo1(String fmemo1) {
		this.fmemo1 = fmemo1;
	}

	@Column(name = "fmemo2", length = 500)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

	/**
	 * @return the fqldate
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "fqldate", length = 10)
	public Date getFqldate() {
		return fqldate;
	}

	/**
	 * @param fqldate the fqldate to set
	 */
	public void setFqldate(Date fqldate) {
		this.fqldate = fqldate;
	}

	/**
	 * @return the fqlprice
	 */
	@Column(name = "fqlprice", precision = 20)
	public Double getFqlprice() {
		return fqlprice;
	}

	/**
	 * @param fqlprice the fqlprice to set
	 */
	public void setFqlprice(Double fqlprice) {
		this.fqlprice = fqlprice;
	}

}