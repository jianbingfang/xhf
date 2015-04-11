package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjJlf entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_jlf"
    ,catalog="xhf"
)

public class PjJlf  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fno;
     private String fhtjk;
     private String fbcht;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjJlf() {
    }

    
    /** full constructor */
    public PjJlf(Long fxmid, String fno, String fhtjk, String fbcht, String fmemo) {
        this.fxmid = fxmid;
        this.fno = fno;
        this.fhtjk = fhtjk;
        this.fbcht = fbcht;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
    }
    
    @Column(name="fhtjk", length=64)

    public String getFhtjk() {
        return this.fhtjk;
    }
    
    public void setFhtjk(String fhtjk) {
        this.fhtjk = fhtjk;
    }
    
    @Column(name="fbcht", length=64)

    public String getFbcht() {
        return this.fbcht;
    }
    
    public void setFbcht(String fbcht) {
        this.fbcht = fbcht;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}