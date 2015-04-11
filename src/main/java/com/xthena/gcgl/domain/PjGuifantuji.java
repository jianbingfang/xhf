package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjGuifantuji entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_guifantuji"
    ,catalog="xhf"
)

public class PjGuifantuji  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String ftype;
     private String ffilename;
     private String ffileurl;
     private String finfo;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjGuifantuji() {
    }

    
    /** full constructor */
    public PjGuifantuji(String fname, String ftype, String ffilename, String ffileurl, String finfo, String fmemo) {
        this.fname = fname;
        this.ftype = ftype;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.finfo = finfo;
        this.fmemo = fmemo;
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
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="ffilename", length=128)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=512)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
    
    @Column(name="finfo", length=512)

    public String getFinfo() {
        return this.finfo;
    }
    
    public void setFinfo(String finfo) {
        this.finfo = finfo;
    }
    
    @Column(name="fmemo", length=512)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}