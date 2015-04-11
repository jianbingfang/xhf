package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * XzXhptj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_zj_xhptj", catalog = "xhf")
public class XzXhptj implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fyuefen;
	private String fwpname;
	private Long fyuankc;
	private Long fxingsl;
	private Long fxhsl;
	private Long fxkcl;

	// Constructors

	/** default constructor */
	public XzXhptj() {
	}

	/** full constructor */
	public XzXhptj(String fyuefen, String fwpname, Long fyuankc, Long fxingsl,
			Long fxhsl, Long fxkcl) {
		this.fyuefen = fyuefen;
		this.fwpname = fwpname;
		this.fyuankc = fyuankc;
		this.fxingsl = fxingsl;
		this.fxhsl = fxhsl;
		this.fxkcl = fxkcl;
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

	@Column(name = "fyuefen", length = 20)
	public String getFyuefen() {
		return this.fyuefen;
	}

	public void setFyuefen(String fyuefen) {
		this.fyuefen = fyuefen;
	}

	@Column(name = "fwpname", length = 100)
	public String getFwpname() {
		return this.fwpname;
	}

	public void setFwpname(String fwpname) {
		this.fwpname = fwpname;
	}

	@Column(name = "fyuankc")
	public Long getFyuankc() {
		return this.fyuankc;
	}

	public void setFyuankc(Long fyuankc) {
		this.fyuankc = fyuankc;
	}

	@Column(name = "fxingsl")
	public Long getFxingsl() {
		return this.fxingsl;
	}

	public void setFxingsl(Long fxingsl) {
		this.fxingsl = fxingsl;
	}

	@Column(name = "fxhsl")
	public Long getFxhsl() {
		return this.fxhsl;
	}

	public void setFxhsl(Long fxhsl) {
		this.fxhsl = fxhsl;
	}

	@Column(name = "fxkcl")
	public Long getFxkcl() {
		return this.fxkcl;
	}

	public void setFxkcl(Long fxkcl) {
		this.fxkcl = fxkcl;
	}

}