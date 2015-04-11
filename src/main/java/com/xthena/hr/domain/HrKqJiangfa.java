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
 * HrKqJiangfa entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_kq_jiangfa"
    ,catalog="xhf"
)

public class HrKqJiangfa  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private String fzhiwu;
     private String fyearmonth;
     private String ftype;
     private Integer fvalue;
     private Integer fmoney;
     private Integer fquanqin;
     private String fmemo;
     private Date fdate;


    // Constructors

    /** default constructor */
    public HrKqJiangfa() {
    }

    
    /** full constructor */
    public HrKqJiangfa(Long fryid, String fzhiwu, String fyearmonth, String ftype, Integer fvalue, Integer fmoney, Integer fquanqin, String fmemo, Date fdate) {
        this.fryid = fryid;
        this.fzhiwu = fzhiwu;
        this.fyearmonth = fyearmonth;
        this.ftype = ftype;
        this.fvalue = fvalue;
        this.fmoney = fmoney;
        this.fquanqin = fquanqin;
        this.fmemo = fmemo;
        this.fdate = fdate;
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
    
    @Column(name="fzhiwu", length=64)

    public String getFzhiwu() {
        return this.fzhiwu;
    }
    
    public void setFzhiwu(String fzhiwu) {
        this.fzhiwu = fzhiwu;
    }
    
    @Column(name="fyearmonth", length=64)

    public String getFyearmonth() {
        return this.fyearmonth;
    }
    
    public void setFyearmonth(String fyearmonth) {
        this.fyearmonth = fyearmonth;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fvalue")

    public Integer getFvalue() {
        return this.fvalue;
    }
    
    public void setFvalue(Integer fvalue) {
        this.fvalue = fvalue;
    }
    
    @Column(name="fmoney")

    public Integer getFmoney() {
        return this.fmoney;
    }
    
    public void setFmoney(Integer fmoney) {
        this.fmoney = fmoney;
    }
    
    @Column(name="fquanqin")

    public Integer getFquanqin() {
        return this.fquanqin;
    }
    
    public void setFquanqin(Integer fquanqin) {
        this.fquanqin = fquanqin;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
   








}