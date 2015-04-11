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
 * PjRyRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ry_record"
    ,catalog="xhf"
)

public class PjRyRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Date fdbdate;
     private Long fdcxm;
     private Long fdrxm;
     private Long fjingbanrenid;
     private Long fryid;
     private String fjingbanren;
     private String fry;
     private String fdrgw;
     private Long flzxm;


    // Constructors

    /** default constructor */
    public PjRyRecord() {
    }

    
    /** full constructor */
    public PjRyRecord(Date fdbdate, Long fdcxm, Long fdrxm, Long fjingbanrenid, Long fryid, String fjingbanren, String fry, String fdrgw, Long flzxm) {
        this.fdbdate = fdbdate;
        this.fdcxm = fdcxm;
        this.fdrxm = fdrxm;
        this.fjingbanrenid = fjingbanrenid;
        this.fryid = fryid;
        this.fjingbanren = fjingbanren;
        this.fry = fry;
        this.fdrgw = fdrgw;
        this.flzxm = flzxm;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fdbdate", length=10)

    public Date getFdbdate() {
        return this.fdbdate;
    }
    
    public void setFdbdate(Date fdbdate) {
        this.fdbdate = fdbdate;
    }
    
    @Column(name="fdcxm")

    public Long getFdcxm() {
        return this.fdcxm;
    }
    
    public void setFdcxm(Long fdcxm) {
        this.fdcxm = fdcxm;
    }
    
    @Column(name="fdrxm")

    public Long getFdrxm() {
        return this.fdrxm;
    }
    
    public void setFdrxm(Long fdrxm) {
        this.fdrxm = fdrxm;
    }
    
    @Column(name="fjingbanrenid")

    public Long getFjingbanrenid() {
        return this.fjingbanrenid;
    }
    
    public void setFjingbanrenid(Long fjingbanrenid) {
        this.fjingbanrenid = fjingbanrenid;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fjingbanren", length=64)

    public String getFjingbanren() {
        return this.fjingbanren;
    }
    
    public void setFjingbanren(String fjingbanren) {
        this.fjingbanren = fjingbanren;
    }
    
    @Column(name="fry", length=64)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    
    @Column(name="fdrgw", length=64)

    public String getFdrgw() {
        return this.fdrgw;
    }
    
    public void setFdrgw(String fdrgw) {
        this.fdrgw = fdrgw;
    }
    
    @Column(name="flzxm")

    public Long getFlzxm() {
        return this.flzxm;
    }
    
    public void setFlzxm(Long flzxm) {
        this.flzxm = flzxm;
    }
   








}