package com.xthena.jl.domain;
// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlTouzi entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_touzi"
    ,catalog="xhf"
)

public class JlTouzi  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fmemo;
     private Integer ftype;
     private String fjine;
     private Long fxmid;
     private Long fhtid;
     private Date fdate;
     private String fdwname;


    // Constructors

    /** default constructor */
    public JlTouzi() {
    }

    
    /** full constructor */
 
    public JlTouzi(Long fid, String fmemo, Integer ftype, String fjine,
			Long fxmid, Long fhtid, Date fdate, String fdwname) {
		super();
		this.fid = fid;
		this.fmemo = fmemo;
		this.ftype = ftype;
		this.fjine = fjine;
		this.fxmid = fxmid;
		this.fhtid = fhtid;
		this.fdate = fdate;
		this.fdwname = fdwname;
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
    
    @Column(name="fmemo", length=128)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="ftype")

    public Integer getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Integer ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fjine", length=64)

    public String getFjine() {
        return this.fjine;
    }
    
    public void setFjine(String fjine) {
        this.fjine = fjine;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fhtid")

    public Long getFhtid() {
        return this.fhtid;
    }
    
    public void setFhtid(Long fhtid) {
        this.fhtid = fhtid;
    }

    @Column(name="fdate")
	public Date getFdate() {
		return fdate;
	}


	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

    @Column(name="fdwname")
	public String getFdwname() {
		return fdwname;
	}


	public void setFdwname(String fdwname) {
		this.fdwname = fdwname;
	}
   








}