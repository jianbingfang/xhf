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
 * HrGongchu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_gongchu"
    ,catalog="xhf"
)

public class HrGongchu  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private Long fdept;
     private String fresult;
     private Date fstartdate;
     private Date fenddate;
     private String fstatus;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrGongchu() {
    }

    
    /** full constructor */
    public HrGongchu(Long fryid, Long fdept, String fresult, Date fstartdate, Date fenddate, String fstatus, String fmemo) {
        this.fryid = fryid;
        this.fdept = fdept;
        this.fresult = fresult;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.fstatus = fstatus;
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
    
    @Column(name="fresult", length=500)

    public String getFresult() {
        return this.fresult;
    }
    
    public void setFresult(String fresult) {
        this.fresult = fresult;
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
   








}