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
 * XzCarBxRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car_bx_recore"
    ,catalog="xhf"
)

public class XzCarBxRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fcarid;
     private String fbxtype;
     private Date ftbdate;
     private String ftbry;
     private Double fbxmoney;
     private Date fbxdate;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Long ftbryid;


    // Constructors

    /** default constructor */
    public XzCarBxRecord() {
    }

    
    /** full constructor */
    public XzCarBxRecord(Long fcarid, String fbxtype, Date ftbdate, String ftbry, Double fbxmoney, Date fbxdate, String fmemo, String fmemo1, String fmemo2, Long ftbryid) {
        this.fcarid = fcarid;
        this.fbxtype = fbxtype;
        this.ftbdate = ftbdate;
        this.ftbry = ftbry;
        this.fbxmoney = fbxmoney;
        this.fbxdate = fbxdate;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.ftbryid = ftbryid;
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
    
    @Column(name="fcarid")

    public Long getFcarid() {
        return this.fcarid;
    }
    
    public void setFcarid(Long fcarid) {
        this.fcarid = fcarid;
    }
    
    @Column(name="fbxtype", length=64)

    public String getFbxtype() {
        return this.fbxtype;
    }
    
    public void setFbxtype(String fbxtype) {
        this.fbxtype = fbxtype;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="ftbdate", length=10)

    public Date getFtbdate() {
        return this.ftbdate;
    }
    
    public void setFtbdate(Date ftbdate) {
        this.ftbdate = ftbdate;
    }
    
    @Column(name="ftbry", length=64)

    public String getFtbry() {
        return this.ftbry;
    }
    
    public void setFtbry(String ftbry) {
        this.ftbry = ftbry;
    }
    
    @Column(name="fbxmoney")

    public Double getFbxmoney() {
        return this.fbxmoney;
    }
    
    public void setFbxmoney(Double fbxmoney) {
        this.fbxmoney = fbxmoney;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbxdate", length=10)

    public Date getFbxdate() {
        return this.fbxdate;
    }
    
    public void setFbxdate(Date fbxdate) {
        this.fbxdate = fbxdate;
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
    
    @Column(name="ftbryid")

    public Long getFtbryid() {
        return this.ftbryid;
    }
    
    public void setFtbryid(Long ftbryid) {
        this.ftbryid = ftbryid;
    }
   








}