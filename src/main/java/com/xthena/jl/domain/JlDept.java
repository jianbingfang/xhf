package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlDept entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_dept"
    ,catalog="xhf"
)

public class JlDept  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private Long fxmid;
     private String floginname;
     private String floginpass;
     private String fstatus;
     private String fmemo;
     private String fmemo1;


    // Constructors

    /** default constructor */
    public JlDept() {
    }

    
    /** full constructor */
    public JlDept(String fname, Long fxmid, String floginname, String floginpass, String fstatus, String fmemo, String fmemo1) {
        this.fname = fname;
        this.fxmid = fxmid;
        this.floginname = floginname;
        this.floginpass = floginpass;
        this.fstatus = fstatus;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="floginname", length=64)

    public String getFloginname() {
        return this.floginname;
    }
    
    public void setFloginname(String floginname) {
        this.floginname = floginname;
    }
    
    @Column(name="floginpass", length=64)

    public String getFloginpass() {
        return this.floginpass;
    }
    
    public void setFloginpass(String floginpass) {
        this.floginpass = floginpass;
    }
    
    @Column(name="fstatus", length=4)

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
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
   








}