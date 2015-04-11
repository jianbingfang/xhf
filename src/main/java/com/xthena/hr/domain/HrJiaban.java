package com.xthena.hr.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrJiaban entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_jiaban"
    ,catalog="xhf"
)

public class HrJiaban  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private Long fdept;
     private String fstatus;
     private Date fstartdate;
     private String fmemo;
     private Integer fhours;
     private String fjiabancontent;
     private String fresult;


    // Constructors

    /** default constructor */
    public HrJiaban() {
    }

    
    /** full constructor */
    public HrJiaban(Long fryid, Long fdept, String fstatus, Date fstartdate, String fmemo, Integer fhours, String fjiabancontent, String fresult) {
        this.fryid = fryid;
        this.fdept = fdept;
        this.fstatus = fstatus;
        this.fstartdate = fstartdate;
        this.fmemo = fmemo;
        this.fhours = fhours;
        this.fjiabancontent = fjiabancontent;
        this.fresult = fresult;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fdept")

    public Long getFdept() {
        return this.fdept;
    }
    
    public void setFdept(Long fdept) {
        this.fdept = fdept;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fstartdate", length=19)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fhours")

    public Integer getFhours() {
        return this.fhours;
    }
    
    public void setFhours(Integer fhours) {
        this.fhours = fhours;
    }
    
    @Column(name="fjiabancontent", length=500)

    public String getFjiabancontent() {
        return this.fjiabancontent;
    }
    
    public void setFjiabancontent(String fjiabancontent) {
        this.fjiabancontent = fjiabancontent;
    }
    
    @Column(name="fresult", length=500)

    public String getFresult() {
        return this.fresult;
    }
    
    public void setFresult(String fresult) {
        this.fresult = fresult;
    }
   








}