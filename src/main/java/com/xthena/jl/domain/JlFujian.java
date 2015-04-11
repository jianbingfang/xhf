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
 * JlFujian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_fujian"
    ,catalog="xhf"
)

public class JlFujian  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String furl;
     private Long fuploadry;
     private Date fuploaddate;
     private String finfo;
     private String ffileno;
     private String ffiletype;
     private String ffujiantype;
     private Long fmainid;
     private Long fxmid;
     private String fbiztype;
     private String ftablename;


    // Constructors

    /** default constructor */
    public JlFujian() {
    }

    
    /** full constructor */
    public JlFujian(String fname, String furl, Long fuploadry, Date fuploaddate, String finfo, String ffileno, String ffiletype, String ffujiantype, Long fmainid, Long fxmid, String fbiztype, String ftablename) {
        this.fname = fname;
        this.furl = furl;
        this.fuploadry = fuploadry;
        this.fuploaddate = fuploaddate;
        this.finfo = finfo;
        this.ffileno = ffileno;
        this.ffiletype = ffiletype;
        this.ffujiantype = ffujiantype;
        this.fmainid = fmainid;
        this.fxmid = fxmid;
        this.fbiztype = fbiztype;
        this.ftablename = ftablename;
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
    
    @Column(name="furl", length=500)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
    
    @Column(name="fuploadry")

    public Long getFuploadry() {
        return this.fuploadry;
    }
    
    public void setFuploadry(Long fuploadry) {
        this.fuploadry = fuploadry;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fuploaddate", length=10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }
    
    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }
    
    @Column(name="finfo", length=500)

    public String getFinfo() {
        return this.finfo;
    }
    
    public void setFinfo(String finfo) {
        this.finfo = finfo;
    }
    
    @Column(name="ffileno", length=64)

    public String getFfileno() {
        return this.ffileno;
    }
    
    public void setFfileno(String ffileno) {
        this.ffileno = ffileno;
    }
    
    @Column(name="ffiletype", length=64)

    public String getFfiletype() {
        return this.ffiletype;
    }
    
    public void setFfiletype(String ffiletype) {
        this.ffiletype = ffiletype;
    }
    
    @Column(name="ffujiantype", length=64)

    public String getFfujiantype() {
        return this.ffujiantype;
    }
    
    public void setFfujiantype(String ffujiantype) {
        this.ffujiantype = ffujiantype;
    }
    
    @Column(name="fmainid")

    public Long getFmainid() {
        return this.fmainid;
    }
    
    public void setFmainid(Long fmainid) {
        this.fmainid = fmainid;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fbiztype", length=64)

    public String getFbiztype() {
        return this.fbiztype;
    }
    
    public void setFbiztype(String fbiztype) {
        this.fbiztype = fbiztype;
    }
    
    @Column(name="ftablename", length=64)

    public String getFtablename() {
        return this.ftablename;
    }
    
    public void setFtablename(String ftablename) {
        this.ftablename = ftablename;
    }
   








}