package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JyZhaobFile entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_zhaobfile"
    ,catalog="xhf"
)

public class JyZhaobFile  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fdahno;
     private String fweizhi;
     private String ffilename;
     private String ffileurl;


    // Constructors

    /** default constructor */
    public JyZhaobFile() {
    }

    
    /** full constructor */
    public JyZhaobFile(Long fxmid, String fdahno, String fweizhi, String ffilename, String ffileurl) {
        this.fxmid = fxmid;
        this.fdahno = fdahno;
        this.fweizhi = fweizhi;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fdahno", length=64)

    public String getFdahno() {
        return this.fdahno;
    }
    
    public void setFdahno(String fdahno) {
        this.fdahno = fdahno;
    }
    
    @Column(name="fweizhi", length=64)

    public String getFweizhi() {
        return this.fweizhi;
    }
    
    public void setFweizhi(String fweizhi) {
        this.fweizhi = fweizhi;
    }
    
    @Column(name="ffilename", length=500)

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