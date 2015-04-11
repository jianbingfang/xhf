package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JyToubiao entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_toubiao"
    ,catalog="xhf"
)

public class JyToubiao  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fweizhi;
     private String finfo;
     private String ffilename;
     private String ffileurl;


    // Constructors

    /** default constructor */
    public JyToubiao() {
    }

    
    /** full constructor */
    public JyToubiao(String fname, String fweizhi, String finfo, String ffilename, String ffileurl) {
        this.fname = fname;
        this.fweizhi = fweizhi;
        this.finfo = finfo;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
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
    
    @Column(name="fweizhi", length=64)

    public String getFweizhi() {
        return this.fweizhi;
    }
    
    public void setFweizhi(String fweizhi) {
        this.fweizhi = fweizhi;
    }
    
    @Column(name="finfo", length=500)

    public String getFinfo() {
        return this.finfo;
    }
    
    public void setFinfo(String finfo) {
        this.finfo = finfo;
    }
    
    @Column(name="ffilename", length=128)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=500)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
   








}