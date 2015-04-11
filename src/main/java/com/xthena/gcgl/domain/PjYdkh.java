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
 * PjYdkh entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ydkh"
    ,catalog="xhf"
)

public class PjYdkh  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fkhno;
     private String fyearmonth;
     private Date fuploaddate;
     private Long fryid;
     private String ffilename;
     private String ffileurl;
     private String fry;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public PjYdkh() {
    }

    
    /** full constructor */
    public PjYdkh(String fkhno, String fyearmonth, Date fuploaddate, Long fryid, String ffilename, String ffileurl, String fry, Long fxmid) {
        this.fkhno = fkhno;
        this.fyearmonth = fyearmonth;
        this.fuploaddate = fuploaddate;
        this.fryid = fryid;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fry = fry;
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
    
    @Column(name="fkhno", length=64)

    public String getFkhno() {
        return this.fkhno;
    }
    
    public void setFkhno(String fkhno) {
        this.fkhno = fkhno;
    }
    
    @Column(name="fyearmonth", length=64)

    public String getFyearmonth() {
        return this.fyearmonth;
    }
    
    public void setFyearmonth(String fyearmonth) {
        this.fyearmonth = fyearmonth;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fuploaddate", length=10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }
    
    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="ffilename", length=64)

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
    
    @Column(name="fry", length=64)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}