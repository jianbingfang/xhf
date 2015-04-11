package com.xthena.cw.domain;
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
 * Cwfujian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_cw_fujian"
    ,catalog="xhf"
)

public class Cwfujian  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ffilename;
     private String ffileurl;
     private String ftype;
     private Date fuploaddate;


    // Constructors

    /** default constructor */
    public Cwfujian() {
    }

    
    /** full constructor */
    public Cwfujian(String ffilename, String ffileurl, String ftype, Date fuploaddate) {
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.ftype = ftype;
        this.fuploaddate = fuploaddate;
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
    
    @Column(name="ftype", length=500)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fuploaddate", length=10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }
    
    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }
   








}