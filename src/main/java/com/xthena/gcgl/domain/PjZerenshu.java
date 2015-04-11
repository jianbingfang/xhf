package com.xthena.gcgl.domain;
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
 * PjZerenshu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_zerenshu"
    ,catalog="xhf"
)

public class PjZerenshu  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fxmname;
     private Date fdate;
     private String fmemo;
     private String fcontent;
     private Long fryid;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public PjZerenshu() {
    }

    
    /** full constructor */
    public PjZerenshu(String fxmname, Date fdate, String fmemo, String fcontent, Long fryid, Long fxmid) {
        this.fxmname = fxmname;
        this.fdate = fdate;
        this.fmemo = fmemo;
        this.fcontent = fcontent;
        this.fryid = fryid;
        this.fxmid = fxmid;
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
    
    @Column(name="fxmname", length=64)

    public String getFxmname() {
        return this.fxmname;
    }
    
    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fcontent", length=500)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}