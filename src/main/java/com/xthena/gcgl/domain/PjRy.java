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
 * PjRy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ry"
    ,catalog="xhf"
)

public class PjRy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fgangwei;
     private Long fryid;
     private String fry;
     private Date fstartdate;
     private Date fenddate;
     private String ftel;
     private String fstatus;
     private String fmemo;
     private String fzhicheng;


    // Constructors

    /** default constructor */
    public PjRy() {
    }

    
    /** full constructor */
    public PjRy(Long fxmid, String fgangwei, Long fryid, String fry, Date fstartdate, Date fenddate, String ftel, String fstatus, String fmemo, String fzhicheng) {
        this.fxmid = fxmid;
        this.fgangwei = fgangwei;
        this.fryid = fryid;
        this.fry = fry;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.ftel = ftel;
        this.fstatus = fstatus;
        this.fmemo = fmemo;
        this.fzhicheng = fzhicheng;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fgangwei", length=64)

    public String getFgangwei() {
        return this.fgangwei;
    }
    
    public void setFgangwei(String fgangwei) {
        this.fgangwei = fgangwei;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdate", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fenddate", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fzhicheng", length=64)

    public String getFzhicheng() {
        return this.fzhicheng;
    }
    
    public void setFzhicheng(String fzhicheng) {
        this.fzhicheng = fzhicheng;
    }
   








}