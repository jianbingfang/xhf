package com.xthena.xz.domain;
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
 * XzCarRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car_record"
    ,catalog="xhf"
)

public class XzCarRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Date foutdate;
     private String fry;
     private Date fbackdate;
     private String fdriveline;
     private Double ftotalkm;
     private Double fxckm;
     private String fcarstate;
     private Long fcarid;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Long fryid;


    // Constructors

    /** default constructor */
    public XzCarRecord() {
    }

    
    /** full constructor */
    public XzCarRecord(Date foutdate, String fry, Date fbackdate, String fdriveline, Double ftotalkm, Double fxckm, String fcarstate, Long fcarid, String fmemo, String fmemo1, String fmemo2, Long fryid) {
        this.foutdate = foutdate;
        this.fry = fry;
        this.fbackdate = fbackdate;
        this.fdriveline = fdriveline;
        this.ftotalkm = ftotalkm;
        this.fxckm = fxckm;
        this.fcarstate = fcarstate;
        this.fcarid = fcarid;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fryid = fryid;
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
    @Column(name="foutdate", length=10)

    public Date getFoutdate() {
        return this.foutdate;
    }
    
    public void setFoutdate(Date foutdate) {
        this.foutdate = foutdate;
    }
    
    @Column(name="fry")

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbackdate", length=10)

    public Date getFbackdate() {
        return this.fbackdate;
    }
    
    public void setFbackdate(Date fbackdate) {
        this.fbackdate = fbackdate;
    }
    
    @Column(name="fdriveline", length=64)

    public String getFdriveline() {
        return this.fdriveline;
    }
    
    public void setFdriveline(String fdriveline) {
        this.fdriveline = fdriveline;
    }
    
    @Column(name="ftotalkm")

    public Double getFtotalkm() {
        return this.ftotalkm;
    }
    
    public void setFtotalkm(Double ftotalkm) {
        this.ftotalkm = ftotalkm;
    }
    
    @Column(name="fxckm")

    public Double getFxckm() {
        return this.fxckm;
    }
    
    public void setFxckm(Double fxckm) {
        this.fxckm = fxckm;
    }
    
    @Column(name="fcarstate", length=64)

    public String getFcarstate() {
        return this.fcarstate;
    }
    
    public void setFcarstate(String fcarstate) {
        this.fcarstate = fcarstate;
    }
    
    @Column(name="fcarid")

    public Long getFcarid() {
        return this.fcarid;
    }
    
    public void setFcarid(Long fcarid) {
        this.fcarid = fcarid;
    }
    
    @Column(name="fmemo", length=1000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=1000)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=1000)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
   








}