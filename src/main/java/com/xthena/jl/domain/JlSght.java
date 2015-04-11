package com.xthena.jl.domain;
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
 * JlSght entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_sg_ht"
    ,catalog="xhf"
)

public class JlSght  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fname;
     private String fjiafang;
     private String fyifang;
     private Date fqiandingdate;
     private String fmemo;
     private String fisyanqi;
     private String fisyanwu;
     private String fyanqiinfo;
     private String fyanwuinfo;
     private String fstatus;
     private Date fjiechudate;
     private String fjiechuyuanyin;
     private String fzyjcsm;
     private String fmemo1;
     private String fmemo2;


    // Constructors

    /** default constructor */
    public JlSght() {
    }

    
    /** full constructor */
    public JlSght(Long fxmid, String fname, String fjiafang, String fyifang, Date fqiandingdate, String fmemo, String fisyanqi, String fisyanwu, String fyanqiinfo, String fyanwuinfo, String fstatus, Date fjiechudate, String fjiechuyuanyin, String fzyjcsm, String fmemo1, String fmemo2) {
        this.fxmid = fxmid;
        this.fname = fname;
        this.fjiafang = fjiafang;
        this.fyifang = fyifang;
        this.fqiandingdate = fqiandingdate;
        this.fmemo = fmemo;
        this.fisyanqi = fisyanqi;
        this.fisyanwu = fisyanwu;
        this.fyanqiinfo = fyanqiinfo;
        this.fyanwuinfo = fyanwuinfo;
        this.fstatus = fstatus;
        this.fjiechudate = fjiechudate;
        this.fjiechuyuanyin = fjiechuyuanyin;
        this.fzyjcsm = fzyjcsm;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fjiafang", length=64)

    public String getFjiafang() {
        return this.fjiafang;
    }
    
    public void setFjiafang(String fjiafang) {
        this.fjiafang = fjiafang;
    }
    
    @Column(name="fyifang", length=64)

    public String getFyifang() {
        return this.fyifang;
    }
    
    public void setFyifang(String fyifang) {
        this.fyifang = fyifang;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fqiandingdate", length=10)

    public Date getFqiandingdate() {
        return this.fqiandingdate;
    }
    
    public void setFqiandingdate(Date fqiandingdate) {
        this.fqiandingdate = fqiandingdate;
    }
    
    @Column(name="fmemo", length=4000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fisyanqi", length=16)

    public String getFisyanqi() {
        return this.fisyanqi;
    }
    
    public void setFisyanqi(String fisyanqi) {
        this.fisyanqi = fisyanqi;
    }
    
    @Column(name="fisyanwu", length=16)

    public String getFisyanwu() {
        return this.fisyanwu;
    }
    
    public void setFisyanwu(String fisyanwu) {
        this.fisyanwu = fisyanwu;
    }
    
    @Column(name="fyanqiinfo", length=4000)

    public String getFyanqiinfo() {
        return this.fyanqiinfo;
    }
    
    public void setFyanqiinfo(String fyanqiinfo) {
        this.fyanqiinfo = fyanqiinfo;
    }
    
    @Column(name="fyanwuinfo", length=4000)

    public String getFyanwuinfo() {
        return this.fyanwuinfo;
    }
    
    public void setFyanwuinfo(String fyanwuinfo) {
        this.fyanwuinfo = fyanwuinfo;
    }
    
    @Column(name="fstatus", length=16)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjiechudate", length=10)

    public Date getFjiechudate() {
        return this.fjiechudate;
    }
    
    public void setFjiechudate(Date fjiechudate) {
        this.fjiechudate = fjiechudate;
    }
    
    @Column(name="fjiechuyuanyin", length=4000)

    public String getFjiechuyuanyin() {
        return this.fjiechuyuanyin;
    }
    
    public void setFjiechuyuanyin(String fjiechuyuanyin) {
        this.fjiechuyuanyin = fjiechuyuanyin;
    }
    
    @Column(name="fzyjcsm", length=4000)

    public String getFzyjcsm() {
        return this.fzyjcsm;
    }
    
    public void setFzyjcsm(String fzyjcsm) {
        this.fzyjcsm = fzyjcsm;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
   








}