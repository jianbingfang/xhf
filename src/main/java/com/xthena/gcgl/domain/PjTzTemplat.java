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
 * PjTzTemplat entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_tz_templat"
    ,catalog="xhf"
)

public class PjTzTemplat  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcontent;
     private String fstatus;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public PjTzTemplat() {
    }

    
    /** full constructor */
    public PjTzTemplat(String fname, String fcontent, String fstatus, Date fcreatedate) {
        this.fname = fname;
        this.fcontent = fcontent;
        this.fstatus = fstatus;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="fcontent", length=4000)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="fstatus", length=16)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}