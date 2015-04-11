package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * jlXgdw entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_xgdw"
    ,catalog="xhf"
)

public class JlXgdw  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fdw;
     private String fcontact;
     private String ftel;
     private String fmail;
     private String fmemo;
     private String fdwtype;
     private Long fxmid;
     private String fzhiw;


    // Constructors

    /** default constructor */
    public JlXgdw() {
    }

    
    /** full constructor */
    public JlXgdw(String fdw, String fcontact, String ftel, String fmail, String fmemo, String fdwtype, Long fxmid, String fzhiw) {
        this.fdw = fdw;
        this.fcontact = fcontact;
        this.ftel = ftel;
        this.fmail = fmail;
        this.fmemo = fmemo;
        this.fdwtype = fdwtype;
        this.fxmid = fxmid;
        this.fzhiw = fzhiw;
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
    
    @Column(name="fdw", length=64)

    public String getFdw() {
        return this.fdw;
    }
    
    public void setFdw(String fdw) {
        this.fdw = fdw;
    }
    
    @Column(name="fcontact", length=64)

    public String getFcontact() {
        return this.fcontact;
    }
    
    public void setFcontact(String fcontact) {
        this.fcontact = fcontact;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="fmail", length=64)

    public String getFmail() {
        return this.fmail;
    }
    
    public void setFmail(String fmail) {
        this.fmail = fmail;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fdwtype", length=64)

    public String getFdwtype() {
        return this.fdwtype;
    }
    
    public void setFdwtype(String fdwtype) {
        this.fdwtype = fdwtype;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fzhiw", length=64)

    public String getFzhiw() {
        return this.fzhiw;
    }
    
    public void setFzhiw(String fzhiw) {
        this.fzhiw = fzhiw;
    }
   








}