package com.xthena.hr.domain;
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
 * HrLz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_lz"
    ,catalog="xhf"
)

public class HrLz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fry;
     private Date fstartdate;
     private String freason;
     private String fczbg;
     private String fjy;
     private Integer fspstatus;
     private Integer fsbstatus;
     private Integer fywstatus;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fmemo5;


    // Constructors

    /** default constructor */
    public HrLz() {
    }

    
    /** full constructor */
    public HrLz(Long fry, Date fstartdate, String freason, String fczbg, String fjy, Integer fspstatus, Integer fsbstatus, Integer fywstatus, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fmemo5) {
        this.fry = fry;
        this.fstartdate = fstartdate;
        this.freason = freason;
        this.fczbg = fczbg;
        this.fjy = fjy;
        this.fspstatus = fspstatus;
        this.fsbstatus = fsbstatus;
        this.fywstatus = fywstatus;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
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
    
    @Column(name="fry")

    public Long getFry() {
        return this.fry;
    }
    
    public void setFry(Long fry) {
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
    
    @Column(name="freason", length=512)

    public String getFreason() {
        return this.freason;
    }
    
    public void setFreason(String freason) {
        this.freason = freason;
    }
    
    @Column(name="fczbg", length=512)

    public String getFczbg() {
        return this.fczbg;
    }
    
    public void setFczbg(String fczbg) {
        this.fczbg = fczbg;
    }
    
    @Column(name="fjy", length=512)

    public String getFjy() {
        return this.fjy;
    }
    
    public void setFjy(String fjy) {
        this.fjy = fjy;
    }
    
    @Column(name="fspstatus")

    public Integer getFspstatus() {
        return this.fspstatus;
    }
    
    public void setFspstatus(Integer fspstatus) {
        this.fspstatus = fspstatus;
    }
    
    @Column(name="fsbstatus")

    public Integer getFsbstatus() {
        return this.fsbstatus;
    }
    
    public void setFsbstatus(Integer fsbstatus) {
        this.fsbstatus = fsbstatus;
    }
    
    @Column(name="fywstatus")

    public Integer getFywstatus() {
        return this.fywstatus;
    }
    
    public void setFywstatus(Integer fywstatus) {
        this.fywstatus = fywstatus;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
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
    
    @Column(name="fmemo5", length=64)

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
   








}