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
 * Pjkh entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_kh"
    ,catalog="xhf"
)

public class Pjkh  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fkhno;
     private Long fxmid;
     private String fkhfuzeren;
     private Date fkhdate;
     private String fkhry;
     private String fkhscore;
     private Long fkhfuzerenid;
     private String fmemo;


    // Constructors

    /** default constructor */
    public Pjkh() {
    }

    
    /** full constructor */
    public Pjkh(String fkhno, Long fxmid, String fkhfuzeren, Date fkhdate, String fkhry, String fkhscore, Long fkhfuzerenid, String fmemo) {
        this.fkhno = fkhno;
        this.fxmid = fxmid;
        this.fkhfuzeren = fkhfuzeren;
        this.fkhdate = fkhdate;
        this.fkhry = fkhry;
        this.fkhscore = fkhscore;
        this.fkhfuzerenid = fkhfuzerenid;
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
    
    @Column(name="fkhno", length=64)

    public String getFkhno() {
        return this.fkhno;
    }
    
    public void setFkhno(String fkhno) {
        this.fkhno = fkhno;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fkhfuzeren", length=64)

    public String getFkhfuzeren() {
        return this.fkhfuzeren;
    }
    
    public void setFkhfuzeren(String fkhfuzeren) {
        this.fkhfuzeren = fkhfuzeren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fkhdate", length=10)

    public Date getFkhdate() {
        return this.fkhdate;
    }
    
    public void setFkhdate(Date fkhdate) {
        this.fkhdate = fkhdate;
    }
    
    @Column(name="fkhry", length=64)

    public String getFkhry() {
        return this.fkhry;
    }
    
    public void setFkhry(String fkhry) {
        this.fkhry = fkhry;
    }
    
    @Column(name="fkhscore", length=64)

    public String getFkhscore() {
        return this.fkhscore;
    }
    
    public void setFkhscore(String fkhscore) {
        this.fkhscore = fkhscore;
    }
    
    @Column(name="fkhfuzerenid")

    public Long getFkhfuzerenid() {
        return this.fkhfuzerenid;
    }
    
    public void setFkhfuzerenid(Long fkhfuzerenid) {
        this.fkhfuzerenid = fkhfuzerenid;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}