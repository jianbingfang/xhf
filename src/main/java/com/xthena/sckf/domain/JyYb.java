package com.xthena.sckf.domain;
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
 * PjYb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_yb"
    ,catalog="xhf"
)

public class JyYb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fno;
     private String fyearmonth;
     private Date fuploaddate;
     private Long fuploadry;
     private String fmemo;
     private String ffilename;
     private String ffileurl;


    // Constructors

    /** default constructor */
    public JyYb() {
    }

    
    /** full constructor */
    public JyYb(String fno, String fyearmonth, Date fuploaddate, Long fuploadry, String fmemo, String ffilename, String ffileurl) {
        this.fno = fno;
        this.fyearmonth = fyearmonth;
        this.fuploaddate = fuploaddate;
        this.fuploadry = fuploadry;
        this.fmemo = fmemo;
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
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
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
    
    @Column(name="fuploadry")

    public Long getFuploadry() {
        return this.fuploadry;
    }
    
    public void setFuploadry(Long fuploadry) {
        this.fuploadry = fuploadry;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="ffilename", length=200)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=200)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
   








}