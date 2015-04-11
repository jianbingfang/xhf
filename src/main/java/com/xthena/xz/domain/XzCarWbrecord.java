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
 * XzCarWbrecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car_wbrecord"
    ,catalog="xhf"
)

public class XzCarWbrecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fcarid;
     private Date fwbdate;
     private String fwbadrress;
     private Double fwbmoney;
     private String fwblist;
     private String fbxry;
     private Date fbxdate;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Long fbxryid;


    // Constructors

    /** default constructor */
    public XzCarWbrecord() {
    }

    
    /** full constructor */
    public XzCarWbrecord(Long fcarid, Date fwbdate, String fwbadrress, Double fwbmoney, String fwblist, String fbxry, Date fbxdate, String fmemo, String fmemo1, String fmemo2, Long fbxryid) {
        this.fcarid = fcarid;
        this.fwbdate = fwbdate;
        this.fwbadrress = fwbadrress;
        this.fwbmoney = fwbmoney;
        this.fwblist = fwblist;
        this.fbxry = fbxry;
        this.fbxdate = fbxdate;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fbxryid = fbxryid;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fwbdate", length=10)

    public Date getFwbdate() {
        return this.fwbdate;
    }
    
    public void setFwbdate(Date fwbdate) {
        this.fwbdate = fwbdate;
    }
    
    @Column(name="fwbadrress", length=128)

    public String getFwbadrress() {
        return this.fwbadrress;
    }
    
    public void setFwbadrress(String fwbadrress) {
        this.fwbadrress = fwbadrress;
    }
    
    @Column(name="fwbmoney", length=64)

    public Double getFwbmoney() {
        return this.fwbmoney;
    }
    
    public void setFwbmoney(Double fwbmoney) {
        this.fwbmoney = fwbmoney;
    }
    
    @Column(name="fwblist", length=128)

    public String getFwblist() {
        return this.fwblist;
    }
    
    public void setFwblist(String fwblist) {
        this.fwblist = fwblist;
    }
    
    @Column(name="fbxry", length=64)

    public String getFbxry() {
        return this.fbxry;
    }
    
    public void setFbxry(String fbxry) {
        this.fbxry = fbxry;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbxdate", length=10)

    public Date getFbxdate() {
        return this.fbxdate;
    }
    
    public void setFbxdate(Date fbxdate) {
        this.fbxdate = fbxdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=500)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=500)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fbxryid")

    public Long getFbxryid() {
        return this.fbxryid;
    }
    
    public void setFbxryid(Long fbxryid) {
        this.fbxryid = fbxryid;
    }
   








}