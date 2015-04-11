package com.xthena.jl.domain;
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
 * PjXmJd entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_xm_jd"
    ,catalog="xhf"
)

public class PjXmJd  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fjlf;
     private Long fjd;
     private String fmemo;
     private Date fdate;
     private String fmemo1;
     private String fmemo2;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public PjXmJd() {
    }

    
    /** full constructor */
    public PjXmJd(String fjlf, Long fjd, String fmemo, Date fdate, String fmemo1, String fmemo2, Long fxmid) {
        this.fjlf = fjlf;
        this.fjd = fjd;
        this.fmemo = fmemo;
        this.fdate = fdate;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fxmid = fxmid;
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
    
    @Column(name="fjlf", length=64)

    public String getFjlf() {
        return this.fjlf;
    }
    
    public void setFjlf(String fjlf) {
        this.fjlf = fjlf;
    }
    
    @Column(name="fjd")

    public Long getFjd() {
        return this.fjd;
    }
    
    public void setFjd(Long fjd) {
        this.fjd = fjd;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fmemo1")

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2")

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}