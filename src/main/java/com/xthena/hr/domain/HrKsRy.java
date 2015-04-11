package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrKsRy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ks_ry"
    ,catalog="xhf"
)

public class HrKsRy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fidcode;
     private String ftel;
     private Long fxmid;
     private Integer fzcxystatus;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrKsRy() {
    }

    
    /** full constructor */
    public HrKsRy(String fname, String fidcode, String ftel, Long fxmid, Integer fzcxystatus, String fmemo) {
        this.fname = fname;
        this.fidcode = fidcode;
        this.ftel = ftel;
        this.fxmid = fxmid;
        this.fzcxystatus = fzcxystatus;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fidcode", length=64)

    public String getFidcode() {
        return this.fidcode;
    }
    
    public void setFidcode(String fidcode) {
        this.fidcode = fidcode;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fzcxystatus")

    public Integer getFzcxystatus() {
        return this.fzcxystatus;
    }
    
    public void setFzcxystatus(Integer fzcxystatus) {
        this.fzcxystatus = fzcxystatus;
    }
    
    @Column(name="fmemo", length=512)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}