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
 * CwHtbg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_cw_htbg"
    ,catalog="xhf"
)

public class CwHtbg  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fhtid;
     private Long fbgmoney;
     private String fbgresult;
     private Date fbgdate;
     private String fbgdetail;
     private Long foprator;
     private String fmemo1;
     private String fmemo;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;


    // Constructors

    /** default constructor */
    public CwHtbg() {
    }

    
    /** full constructor */
    public CwHtbg(Long fhtid, Long fbgmoney, String fbgresult, Date fbgdate, String fbgdetail, Long foprator, String fmemo1, String fmemo, String fmemo2, String fmemo3, String fmemo4) {
        this.fhtid = fhtid;
        this.fbgmoney = fbgmoney;
        this.fbgresult = fbgresult;
        this.fbgdate = fbgdate;
        this.fbgdetail = fbgdetail;
        this.foprator = foprator;
        this.fmemo1 = fmemo1;
        this.fmemo = fmemo;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
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
    
    @Column(name="fhtid")

    public Long getFhtid() {
        return this.fhtid;
    }
    
    public void setFhtid(Long fhtid) {
        this.fhtid = fhtid;
    }
    
    @Column(name="fbgmoney")

    public Long getFbgmoney() {
        return this.fbgmoney;
    }
    
    public void setFbgmoney(Long fbgmoney) {
        this.fbgmoney = fbgmoney;
    }
    
    @Column(name="fbgresult", length=64)

    public String getFbgresult() {
        return this.fbgresult;
    }
    
    public void setFbgresult(String fbgresult) {
        this.fbgresult = fbgresult;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbgdate", length=10)

    public Date getFbgdate() {
        return this.fbgdate;
    }
    
    public void setFbgdate(Date fbgdate) {
        this.fbgdate = fbgdate;
    }
    
    @Column(name="fbgdetail", length=500)

    public String getFbgdetail() {
        return this.fbgdetail;
    }
    
    public void setFbgdetail(String fbgdetail) {
        this.fbgdetail = fbgdetail;
    }
    
    @Column(name="foprator")

    public Long getFoprator() {
        return this.foprator;
    }
    
    public void setFoprator(Long foprator) {
        this.foprator = foprator;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=64)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="fmemo4", length=64)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
   








}