package com.xthena.xz.domain;
// default package

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.xthena.xz.manager.Zj;


/**
 * XzRyzs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_ryzs"
    ,catalog="xhf"
)

public class XzRyzs  implements java.io.Serializable,Zj {


    // Fields    

     private Long fid;
     private String ftype;
     private String fcode;
     private String ffileno;
     private String ffilename;
     private String fhjname;
     private String fbfdanw;
     private String fmemo;
     private String fyear;
     private String fcallname;
     private Long fhuojiangr;
     private String fleibie;
     private String ffzwz;
     private String fzstype;


    // Constructors

    /** default constructor */
    public XzRyzs() {
    }

    
    /** full constructor */
    public XzRyzs(String ftype, String fcode, String ffileno, String ffilename, String fhjname, String fbfdanw, String fmemo, String fyear, String fcallname, Long fhuojiangr,String fleibie,String ffzwz,String fzstype) {
        this.ftype = ftype;
        this.fcode = fcode;
        this.ffileno = ffileno;
        this.ffilename = ffilename;
        this.fhjname = fhjname;
        this.fbfdanw = fbfdanw;
        this.fmemo = fmemo;
        this.fyear = fyear;
        this.fcallname = fcallname;
        this.fhuojiangr = fhuojiangr;
        this.fleibie = fleibie;
        this.ffzwz = ffzwz;
        this.fzstype = fzstype;
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
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="ffileno", length=64)

    public String getFfileno() {
        return this.ffileno;
    }
    
    public void setFfileno(String ffileno) {
        this.ffileno = ffileno;
    }
    
    @Column(name="ffilename", length=64)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="fhjname", length=64)

    public String getFhjname() {
        return this.fhjname;
    }
    
    public void setFhjname(String fhjname) {
        this.fhjname = fhjname;
    }
    
    @Column(name="fbfdanw", length=64)

    public String getFbfdanw() {
        return this.fbfdanw;
    }
    
    public void setFbfdanw(String fbfdanw) {
        this.fbfdanw = fbfdanw;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fyear", length=64)

    public String getFyear() {
        return this.fyear;
    }
    
    public void setFyear(String fyear) {
        this.fyear = fyear;
    }
    
    @Column(name="fcallname", length=64)

    public String getFcallname() {
        return this.fcallname;
    }
    
    public void setFcallname(String fcallname) {
        this.fcallname = fcallname;
    }
    
    @Column(name="fhuojiangr")
    public Long getFhuojiangr() {
        return this.fhuojiangr;
    }
    
    public void setFhuojiangr(Long fhuojiangr) {
        this.fhuojiangr = fhuojiangr;
    }

    @Column(name="fleibie")
	public String getFleibie() {
		return fleibie;
	}


	public void setFleibie(String fleibie) {
		this.fleibie = fleibie;
	}

    @Column(name="ffzwz")
	public String getFfzwz() {
		return ffzwz;
	}


	public void setFfzwz(String ffzwz) {
		this.ffzwz = ffzwz;
	}


	/**
	 * @return the fzstype
	 */
	public String getFzstype() {
		return fzstype;
	}


	/**
	 * @param fzstype the fzstype to set
	 */
	public void setFzstype(String fzstype) {
		this.fzstype = fzstype;
	}
   








}