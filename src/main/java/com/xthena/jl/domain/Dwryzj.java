package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Dwryzj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_dwryzj"
    ,catalog="xhf"
)

public class Dwryzj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fgw;
     private String fdwname;
     private String fval;
     private String fstatus;
     private String fmemo;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public Dwryzj() {
    }

    
    /** full constructor */
    public Dwryzj(String fgw, String fdwname, String fval, String fstatus, String fmemo, Long fxmid) {
        this.fgw = fgw;
        this.fdwname = fdwname;
        this.fval = fval;
        this.fstatus = fstatus;
        this.fmemo = fmemo;
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
    
    @Column(name="fgw", length=64)

    public String getFgw() {
        return this.fgw;
    }
    
    public void setFgw(String fgw) {
        this.fgw = fgw;
    }
    
    @Column(name="fdwname", length=64)

    public String getFdwname() {
        return this.fdwname;
    }
    
    public void setFdwname(String fdwname) {
        this.fdwname = fdwname;
    }
    
    @Column(name="fval", length=64)

    public String getFval() {
        return this.fval;
    }
    
    public void setFval(String fval) {
        this.fval = fval;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}