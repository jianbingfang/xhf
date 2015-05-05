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
 * JlShiqian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_shiqian"
    ,catalog="xhf"
)

public class JlShiqian  implements java.io.Serializable {


    // Fields    

     private Long fid;
     //private String fname;
     private String ftype;
     private String fitem;
     private String fstatus;
     private Date fuploaddate;
     private String ffujianids;
     private Long fxmid;
     private String finfo;
     private String ffilename;
     private String ffileurl;
     private String fmemo;
     private String fshstatus;


    // Constructors

    /** default constructor */
    public JlShiqian() {
    }

    
    /** full constructor */
    public JlShiqian( String ftype, String fitem, String fstatus, Date fuploaddate, String ffujianids, Long fxmid, String finfo, String ffilename, String ffileurl, String fmemo, String fshstatus) {
        //this.fname=
        this.ftype = ftype;
        this.fitem = fitem;
        this.fstatus = fstatus;
        this.fuploaddate = fuploaddate;
        this.ffujianids = ffujianids;
        this.fxmid = fxmid;
        this.finfo = finfo;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fmemo = fmemo;
        this.fshstatus = fshstatus;
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
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fitem", length=64)

    public String getFitem() {
        return this.fitem;
    }
    
    public void setFitem(String fitem) {
        this.fitem = fitem;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fuploaddate", length=10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }
    
    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }
    
    @Column(name="ffujianids", length=500)

    public String getFfujianids() {
        return this.ffujianids;
    }
    
    public void setFfujianids(String ffujianids) {
        this.ffujianids = ffujianids;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="finfo", length=500)

    public String getFinfo() {
        return this.finfo;
    }
    
    public void setFinfo(String finfo) {
        this.finfo = finfo;
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
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fshstatus", length=64)

    public String getFshstatus() {
        return this.fshstatus;
    }
    
    public void setFshstatus(String fshstatus) {
        this.fshstatus = fshstatus;
    }
   








}