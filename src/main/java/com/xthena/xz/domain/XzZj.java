package com.xthena.xz.domain;
// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import com.xthena.xz.manager.Zj;


/**
 * XzZj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_zj"
    ,catalog="xhf"
)

public class XzZj  implements java.io.Serializable,Zj {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long fid;
     private String fcode;
     private String fname;
     private Integer fnum;
     private Date fendate;
     private String fiswarn;
     private String fzkstate;
     private String ffzwz;


    // Constructors

    /** default constructor */
    public XzZj() {
    }

	/** minimal constructor */
    public XzZj(String fname) {
        this.fname = fname;
    }
    
    /** full constructor */
    public XzZj(String fcode, String fname, Integer fnum, Date fendate, String fiswarn,String fzkstate,String ffzwz) {
        this.fcode = fcode;
        this.fname = fname;
        this.fnum = fnum;
        this.fendate = fendate;
        this.fiswarn = fiswarn;
        this.fzkstate = fzkstate;
        this.ffzwz = ffzwz;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="fid", unique=true, nullable=false)

    public Long getFid() {
        return this.fid;
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fname", nullable=false, length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fnum", nullable=false)

    public Integer getFnum() {
        return this.fnum;
    }
    
    public void setFnum(Integer fnum) {
        this.fnum = fnum;
    }
	@Temporal(TemporalType.DATE)
    @Column(name="fendate")

    public Date getFendate() {
        return this.fendate;
    }
    
    public void setFendate(Date fendate) {
        this.fendate = fendate;
    }
    
    @Column(name="fiswarn", length=4)

    public String getFiswarn() {
        return this.fiswarn;
    }
    
    public void setFiswarn(String fiswarn) {
        this.fiswarn = fiswarn;
    }
    @Column(name="fzkstate", length=4)
	public String getFzkstate() {
		return fzkstate;
	}

	public void setFzkstate(String fzkstate) {
		this.fzkstate = fzkstate;
	}
    @Column(name="ffzwz", length=20)
	public String getFfzwz() {
		return ffzwz;
	}

	public void setFfzwz(String ffzwz) {
		this.ffzwz = ffzwz;
	}
   








}