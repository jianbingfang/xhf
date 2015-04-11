package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjXmImg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_xmimg"
    ,catalog="xhf"
)

public class PjXmImg  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fdescribe;
     private String fimgurl;
     private String fmemo;
     private Long fxmid;
     private String forder;
     private String ftype;


    // Constructors

    /** default constructor */
    public PjXmImg() {
    }

    
    /** full constructor */
    public PjXmImg(String fname, String fdescribe, String fimgurl, String fmemo, Long fxmid, String forder, String ftype) {
        this.fname = fname;
        this.fdescribe = fdescribe;
        this.fimgurl = fimgurl;
        this.fmemo = fmemo;
        this.fxmid = fxmid;
        this.forder = forder;
        this.ftype = ftype;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fdescribe", length=500)

    public String getFdescribe() {
        return this.fdescribe;
    }
    
    public void setFdescribe(String fdescribe) {
        this.fdescribe = fdescribe;
    }
    
    @Column(name="fimgurl", length=500)

    public String getfimgurl() {
        return this.fimgurl;
    }
    
    public void setfimgurl(String fimgurl) {
        this.fimgurl = fimgurl;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="forder", length=16)

    public String getForder() {
        return this.forder;
    }
    
    public void setForder(String forder) {
        this.forder = forder;
    }
    
    @Column(name="ftype", length=16)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
   








}