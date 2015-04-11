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
 * PjMreport entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_mreport"
    ,catalog="xhf"
)

public class PjMreport  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String freportno;
     private String fyearmonth;
     private Date fuploaddate;
     private String ffilename;
     private String ffileurl;
     private Long fryid;
     private String fry;


    // Constructors

    /** default constructor */
    public PjMreport() {
    }

    
    /** full constructor */
    public PjMreport(String freportno, String fyearmonth, Date fuploaddate, String ffilename, String ffileurl, Long fryid, String fry) {
        this.freportno = freportno;
        this.fyearmonth = fyearmonth;
        this.fuploaddate = fuploaddate;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fryid = fryid;
        this.fry = fry;
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
    
    @Column(name="freportno", length=64)

    public String getFreportno() {
        return this.freportno;
    }
    
    public void setFreportno(String freportno) {
        this.freportno = freportno;
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
    
    @Column(name="ffilename", length=64)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=64)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fry", length=64)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
   








}