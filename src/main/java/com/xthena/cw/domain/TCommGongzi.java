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
 * TCommGongzi entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_comm_gongzi", catalog = "xhf")
public class TCommGongzi implements java.io.Serializable {

	// Fields

	private Long fid;
	private Date fdate;
	private Double fjine;

	// Constructors

	/** default constructor */
	public TCommGongzi() {
	}

	/** full constructor */
	public TCommGongzi(Date fdate, Double fjine) {
		this.fdate = fdate;
		this.fjine = fjine;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fjine", precision = 20)
	public Double getFjine() {
		return this.fjine;
	}

	public void setFjine(Double fjine) {
		this.fjine = fjine;
	}

}