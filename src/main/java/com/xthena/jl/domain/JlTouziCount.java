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
@Table(name = "t_jl_touzi_count", catalog = "xhf")
public class JlTouziCount implements java.io.Serializable {

	// Fields

	private Long fid;
	private Long fxmid;
	private String fgstze;
	private String fgcjsj;
	private String fhtjk;
	private String fgck;
	private String fsjbg;
	private String fxcqz;

	// Constructors

	/** default constructor */
	public JlTouziCount() {
	}

	/** full constructor */
	public JlTouziCount(Long fxmid, String fgstze, String fgcjsj, String fhtjk,
			String fgck, String fsjbg, String fxcqz) {
		this.fxmid = fxmid;
		this.fgstze = fgstze;
		this.fgcjsj = fgcjsj;
		this.fhtjk = fhtjk;
		this.fgck = fgck;
		this.fsjbg = fsjbg;
		this.fxcqz = fxcqz;
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

	@Column(name = "fgstze")
	public String getFgstze() {
		return fgstze;
	}

	public void setFgstze(String fgstze) {
		this.fgstze = fgstze;
	}

	@Column(name = "fgcjsj")
	public String getFgcjsj() {
		return fgcjsj;
	}

	public void setFgcjsj(String fgcjsj) {
		this.fgcjsj = fgcjsj;
	}

	
	@Column(name = "fhtjk")
	public String getFhtjk() {
		return fhtjk;
	}

	public void setFhtjk(String fhtjk) {
		this.fhtjk = fhtjk;
	}

	@Column(name = "fgck")
	public String getFgck() {
		return fgck;
	}

	public void setFgck(String fgck) {
		this.fgck = fgck;
	}

	@Column(name = "fsjbg")
	public String getFsjbg() {
		return fsjbg;
	}

	public void setFsjbg(String fsjbg) {
		this.fsjbg = fsjbg;
	}

	@Column(name = "fxcqz")
	public String getFxcqz() {
		return fxcqz;
	}

	public void setFxcqz(String fxcqz) {
		this.fxcqz = fxcqz;
	}

	

}