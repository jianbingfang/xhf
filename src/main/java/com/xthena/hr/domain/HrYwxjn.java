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
 * HrYwxjn entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ywxjn"
    ,catalog="xhf"
)

public class HrYwxjn  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String ffuzeren;
     private Long frenshu;
     private String fxmry;
     private Date fstartdate;
     private Date fenddate;
     private String fjnjine;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrYwxjn() {
    }

    
    /** full constructor */
    public HrYwxjn(String fname, String ffuzeren, Long frenshu, String fxmry, Date fstartdate, Date fenddate, String fjnjine, String fmemo) {
        this.fname = fname;
        this.ffuzeren = ffuzeren;
        this.frenshu = frenshu;
        this.fxmry = fxmry;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.fjnjine = fjnjine;
        this.fmemo = fmemo;
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
    
    @Column(name="fname", length=500)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="ffuzeren", length=64)

    public String getFfuzeren() {
        return this.ffuzeren;
    }
    
    public void setFfuzeren(String ffuzeren) {
        this.ffuzeren = ffuzeren;
    }
    
    @Column(name="frenshu")

    public Long getFrenshu() {
        return this.frenshu;
    }
    
    public void setFrenshu(Long frenshu) {
        this.frenshu = frenshu;
    }
    
    @Column(name="fxmry", length=500)

    public String getFxmry() {
        return this.fxmry;
    }
    
    public void setFxmry(String fxmry) {
        this.fxmry = fxmry;
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
    
    @Column(name="fjnjine", length=64)

    public String getFjnjine() {
        return this.fjnjine;
    }
    
    public void setFjnjine(String fjnjine) {
        this.fjnjine = fjnjine;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}