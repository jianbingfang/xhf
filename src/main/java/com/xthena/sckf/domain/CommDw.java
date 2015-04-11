package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommDw entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_dw"
    ,catalog="xhf"
)

public class CommDw  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcode;
     private String fconcact;
     private String ftel;
     private String flegal;
     private String fmemo;
     private Integer ftype;


    // Constructors

    /** default constructor */
    public CommDw() {
    }

    
    /** full constructor */
    public CommDw(String fname, String fcode, String fconcact, String ftel, String flegal, String fmemo, Integer ftype) {
        this.fname = fname;
        this.fcode = fcode;
        this.fconcact = fconcact;
        this.ftel = ftel;
        this.flegal = flegal;
        this.fmemo = fmemo;
        this.ftype = ftype;
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
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fconcact", length=64)

    public String getFconcact() {
        return this.fconcact;
    }
    
    public void setFconcact(String fconcact) {
        this.fconcact = fconcact;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="flegal", length=64)

    public String getFlegal() {
        return this.flegal;
    }
    
    public void setFlegal(String flegal) {
        this.flegal = flegal;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="ftype")

    public Integer getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Integer ftype) {
        this.ftype = ftype;
    }
   








}