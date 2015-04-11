package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Jlf entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_jl_jlf", catalog = "xhf")
public class Jlf implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long fxmid;
	private String fhtke;
	private String fhtgq;
	private String fzffs;
	private String fbqys;
	private String fmemo;
	private String fmemo1;
	private String fmemo2;

	// Constructors

	/** default constructor */
	public Jlf() {
	}

	/** full constructor */
	public Jlf(Long fxmid, String fhtke, String fhtgq, String fzffs,
			String fbqys, String fmemo, String fmemo1, String fmemo2) {
		this.fxmid = fxmid;
		this.fhtke = fhtke;
		this.fhtgq = fhtgq;
		this.fzffs = fzffs;
		this.fbqys = fbqys;
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

	@Column(name = "fxmid")
	public Long getFxmid() {
		return this.fxmid;
	}

	public void setFxmid(Long fxmid) {
		this.fxmid = fxmid;
	}

	@Column(name = "fhtke", length = 64)
	public String getFhtke() {
		return this.fhtke;
	}

	public void setFhtke(String fhtke) {
		this.fhtke = fhtke;
	}

	@Column(name = "fhtgq", length = 100)
	public String getFhtgq() {
		return this.fhtgq;
	}

	public void setFhtgq(String fhtgq) {
		this.fhtgq = fhtgq;
	}

	@Column(name = "fzffs", length = 400)
	public String getFzffs() {
		return this.fzffs;
	}

	public void setFzffs(String fzffs) {
		this.fzffs = fzffs;
	}

	@Column(name = "fbqys", length = 64)
	public String getFbqys() {
		return this.fbqys;
	}

	public void setFbqys(String fbqys) {
		this.fbqys = fbqys;
	}

	@Column(name = "fmemo", length = 400)
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

	@Column(name = "fmemo2", length = 200)
	public String getFmemo2() {
		return this.fmemo2;
	}

	public void setFmemo2(String fmemo2) {
		this.fmemo2 = fmemo2;
	}

}