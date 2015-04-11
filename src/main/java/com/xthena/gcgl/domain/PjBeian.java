package com.xthena.gcgl.domain;
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
 * PjBeian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_beian"
    ,catalog="xhf"
)

public class PjBeian  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fpjcode;
     private Long fxmid;
     private Date fbeiandate;
     private String fjingshouren;
     private String fmemo;
     private String fxmname;
     private Long fjingshourenid;


    // Constructors

    /** default constructor */
    public PjBeian() {
    }

    
    /** full constructor */
    public PjBeian(String fpjcode, Long fxmid, Date fbeiandate, String fjingshouren, String fmemo, String fxmname, Long fjingshourenid) {
        this.fpjcode = fpjcode;
        this.fxmid = fxmid;
        this.fbeiandate = fbeiandate;
        this.fjingshouren = fjingshouren;
        this.fmemo = fmemo;
        this.fxmname = fxmname;
        this.fjingshourenid = fjingshourenid;
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
    
    @Column(name="fpjcode", length=64)

    public String getFpjcode() {
        return this.fpjcode;
    }
    
    public void setFpjcode(String fpjcode) {
        this.fpjcode = fpjcode;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbeiandate", length=10)

    public Date getFbeiandate() {
        return this.fbeiandate;
    }
    
    public void setFbeiandate(Date fbeiandate) {
        this.fbeiandate = fbeiandate;
    }
    
    @Column(name="fjingshouren", length=64)

    public String getFjingshouren() {
        return this.fjingshouren;
    }
    
    public void setFjingshouren(String fjingshouren) {
        this.fjingshouren = fjingshouren;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fxmname", length=64)

    public String getFxmname() {
        return this.fxmname;
    }
    
    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }
    
    @Column(name="fjingshourenid")

    public Long getFjingshourenid() {
        return this.fjingshourenid;
    }
    
    public void setFjingshourenid(Long fjingshourenid) {
        this.fjingshourenid = fjingshourenid;
    }
   








}