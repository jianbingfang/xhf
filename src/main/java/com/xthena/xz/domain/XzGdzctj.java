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
 * XzGdzctj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_xz_zj_gdzctj", catalog = "xhf")
public class XzGdzctj implements java.io.Serializable {

	// Fields

	private Long fid;
	private String fyuefen;
	private String fwpname;
	private String fmlx;
	private String fycfd;
	private String flqbm;
	private Long fxmb;
	private Date fdate;
	private Double fdj;
	private Integer fsl;
	private Long fzrr;
	private String fmemo;

	// Constructors

	/** default constructor */
	public XzGdzctj() {
	}

	/** full constructor */
	public XzGdzctj(String fyuefen, String fwpname, String fmlx, String fycfd,
			String flqbm, Long fxmb, Date fdate, Double fdj, Integer fsl,
			Long fzrr, String fmemo) {
		this.fyuefen = fyuefen;
		this.fwpname = fwpname;
		this.fmlx = fmlx;
		this.fycfd = fycfd;
		this.flqbm = flqbm;
		this.fxmb = fxmb;
		this.fdate = fdate;
		this.fdj = fdj;
		this.fsl = fsl;
		this.fzrr = fzrr;
		this.fmemo = fmemo;
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

	@Column(name = "fmlx", length = 100)
	public String getFmlx() {
		return this.fmlx;
	}

	public void setFmlx(String fmlx) {
		this.fmlx = fmlx;
	}

	@Column(name = "fycfd", length = 100)
	public String getFycfd() {
		return this.fycfd;
	}

	public void setFycfd(String fycfd) {
		this.fycfd = fycfd;
	}

	@Column(name = "flqbm", length = 100)
	public String getFlqbm() {
		return this.flqbm;
	}

	public void setFlqbm(String flqbm) {
		this.flqbm = flqbm;
	}

	@Column(name = "fxmb")
	public Long getFxmb() {
		return this.fxmb;
	}

	public void setFxmb(Long fxmb) {
		this.fxmb = fxmb;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fdate", length = 10)
	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	@Column(name = "fdj", precision = 20)
	public Double getFdj() {
		return this.fdj;
	}

	public void setFdj(Double fdj) {
		this.fdj = fdj;
	}

	@Column(name = "fsl")
	public Integer getFsl() {
		return this.fsl;
	}

	public void setFsl(Integer fsl) {
		this.fsl = fsl;
	}

	@Column(name = "fzrr")
	public Long getFzrr() {
		return this.fzrr;
	}

	public void setFzrr(Long fzrr) {
		this.fzrr = fzrr;
	}

	@Column(name = "fmemo", length = 64)
	public String getFmemo() {
		return this.fmemo;
	}

	public void setFmemo(String fmemo) {
		this.fmemo = fmemo;
	}

}