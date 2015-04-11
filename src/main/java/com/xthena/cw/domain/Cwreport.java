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
 * Cwreport entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_cw_report"
    ,catalog="xhf"
)

public class Cwreport  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private Date fupdatedate;
     private Long fupdatery;
     private String fcontent;


    // Constructors

    /** default constructor */
    public Cwreport() {
    }

    
    /** full constructor */
    public Cwreport(String fname, Date fupdatedate, Long fupdatery, String fcontent) {
        this.fname = fname;
        this.fupdatedate = fupdatedate;
        this.fupdatery = fupdatery;
        this.fcontent = fcontent;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fupdatedate", length=10)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    
    @Column(name="fupdatery")

    public Long getFupdatery() {
        return this.fupdatery;
    }
    
    public void setFupdatery(Long fupdatery) {
        this.fupdatery = fupdatery;
    }
    
    @Column(name="fcontent", length=500)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
   








}