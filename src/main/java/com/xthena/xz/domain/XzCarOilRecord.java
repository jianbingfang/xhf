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
 * XzCarOilRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car_oil_recode"
    ,catalog="xhf"
)

public class XzCarOilRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Date foildate;
     private Double foilmoney;
     private Double foillitre;
     private String fbxry;
     private Date fbxdate;
     private Long fcarid;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Long fbxryid;


    // Constructors

    /** default constructor */
    public XzCarOilRecord() {
    }

    
    /** full constructor */
    public XzCarOilRecord(Date foildate, Double foilmoney, Double foillitre, String fbxry, Date fbxdate, Long fcarid, String fmemo, String fmemo1, String fmemo2, Long fbxryid) {
        this.foildate = foildate;
        this.foilmoney = foilmoney;
        this.foillitre = foillitre;
        this.fbxry = fbxry;
        this.fbxdate = fbxdate;
        this.fcarid = fcarid;
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
    @Temporal(TemporalType.DATE)
    @Column(name="foildate", length=10)

    public Date getFoildate() {
        return this.foildate;
    }
    
    public void setFoildate(Date foildate) {
        this.foildate = foildate;
    }
    
    @Column(name="foilmoney")

    public Double getFoilmoney() {
        return this.foilmoney;
    }
    
    public void setFoilmoney(Double foilmoney) {
        this.foilmoney = foilmoney;
    }
    
    @Column(name="foillitre")

    public Double getFoillitre() {
        return this.foillitre;
    }
    
    public void setFoillitre(Double foillitre) {
        this.foillitre = foillitre;
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
    
    @Column(name="fbxryid")

    public Long getFbxryid() {
        return this.fbxryid;
    }
    
    public void setFbxryid(Long fbxryid) {
        this.fbxryid = fbxryid;
    }
   








}