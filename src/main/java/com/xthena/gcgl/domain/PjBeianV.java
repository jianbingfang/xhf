package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjBeian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="v_pj_beian"
    ,catalog="xhf"
)

public class PjBeianV implements java.io.Serializable {


    // Fields

     private Long fid;
     private Date fbeiandate;
     private String fname;
     private String fmemo;
     private String fxmname;

    // Constructors

    /** default constructor */
    public PjBeianV() {
    }


    /** full constructor */
    public PjBeianV(Long fid, Date fbeiandate, String fname, String fmemo, String fxmname) {
        this.fid = fid;
        this.fbeiandate = fbeiandate;
        this.fname = fname;
        this.fmemo = fmemo;
        this.fxmname = fxmname;
    }

    // Property accessors
    @Id

    @Column(name="fid", unique=true, nullable=false)

    public Long getFid() {
        return this.fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="fbeiandate", length=10)

    public Date getFbeiandate() {
        return this.fbeiandate;
    }
    
    public void setFbeiandate(Date fbeiandate) {
        this.fbeiandate = fbeiandate;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
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







}