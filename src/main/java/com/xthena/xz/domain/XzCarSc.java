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
 * XzCarSc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car_sc"
    ,catalog="xhf"
)

public class XzCarSc  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Date fscdate;
     private Date fnextdate;
     private String fry;
     private Double fscmoney;
     private String fmemo;
     private Long fcarid;
     private String fmemo1;
     private String fmemo2;
     private Long fryid;


    // Constructors

    /** default constructor */
    public XzCarSc() {
    }

    
    /** full constructor */
    public XzCarSc(Date fscdate, Date fnextdate, String fry, Double fscmoney, String fmemo, Long fcarid, String fmemo1, String fmemo2, Long fryid) {
        this.fscdate = fscdate;
        this.fnextdate = fnextdate;
        this.fry = fry;
        this.fscmoney = fscmoney;
        this.fmemo = fmemo;
        this.fcarid = fcarid;
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
    @Column(name="fscdate", length=10)

    public Date getFscdate() {
        return this.fscdate;
    }
    
    public void setFscdate(Date fscdate) {
        this.fscdate = fscdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fnextdate", length=10)

    public Date getFnextdate() {
        return this.fnextdate;
    }
    
    public void setFnextdate(Date fnextdate) {
        this.fnextdate = fnextdate;
    }
    
    @Column(name="fry", length=64)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    
    @Column(name="fscmoney")

    public Double getFscmoney() {
        return this.fscmoney;
    }
    
    public void setFscmoney(Double fscmoney) {
        this.fscmoney = fscmoney;
    }
    
    @Column(name="fmemo", length=1000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fcarid")

    public Long getFcarid() {
        return this.fcarid;
    }
    
    public void setFcarid(Long fcarid) {
        this.fcarid = fcarid;
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