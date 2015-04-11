package com.xthena.xz.domain;
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
 * XzXjpy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_xjpy"
    ,catalog="xhf"
)

public class XzXjpy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fwjno;
     private String ftitle;
     private String fzj;
     private String fjlgcs;
     private Date fdate;
     private String ffwdw;
     private String fjiangjin;
     private String fljry;
     private String fjnfy;
     private String fmemo;
     private String ffzwz;
     private String ftype;
     private String fzkstate;


    // Constructors

    /** default constructor */
    public XzXjpy() {
    }

    
    /** full constructor */
    public XzXjpy(String fwjno, String ftitle, String fzj, String fjlgcs, Date fdate, String ffwdw, String fjiangjin, String fljry, String fjnfy, String fmemo, String ffzwz, String ftype, String fzkstate) {
        this.fwjno = fwjno;
        this.ftitle = ftitle;
        this.fzj = fzj;
        this.fjlgcs = fjlgcs;
        this.fdate = fdate;
        this.ffwdw = ffwdw;
        this.fjiangjin = fjiangjin;
        this.fljry = fljry;
        this.fjnfy = fjnfy;
        this.fmemo = fmemo;
        this.ffzwz = ffzwz;
        this.ftype = ftype;
        this.fzkstate = fzkstate;
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
    
    @Column(name="fwjno", length=200)

    public String getFwjno() {
        return this.fwjno;
    }
    
    public void setFwjno(String fwjno) {
        this.fwjno = fwjno;
    }
    
    @Column(name="ftitle", length=512)

    public String getFtitle() {
        return this.ftitle;
    }
    
    public void setFtitle(String ftitle) {
        this.ftitle = ftitle;
    }
    
    @Column(name="fzj", length=198)

    public String getFzj() {
        return this.fzj;
    }
    
    public void setFzj(String fzj) {
        this.fzj = fzj;
    }
    
    @Column(name="fjlgcs", length=198)

    public String getFjlgcs() {
        return this.fjlgcs;
    }
    
    public void setFjlgcs(String fjlgcs) {
        this.fjlgcs = fjlgcs;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="ffwdw", length=64)

    public String getFfwdw() {
        return this.ffwdw;
    }
    
    public void setFfwdw(String ffwdw) {
        this.ffwdw = ffwdw;
    }
    
    @Column(name="fjiangjin", length=64)

    public String getFjiangjin() {
        return this.fjiangjin;
    }
    
    public void setFjiangjin(String fjiangjin) {
        this.fjiangjin = fjiangjin;
    }
    
    @Column(name="fljry", length=64)

    public String getFljry() {
        return this.fljry;
    }
    
    public void setFljry(String fljry) {
        this.fljry = fljry;
    }
    
    @Column(name="fjnfy", length=64)

    public String getFjnfy() {
        return this.fjnfy;
    }
    
    public void setFjnfy(String fjnfy) {
        this.fjnfy = fjnfy;
    }
    
    @Column(name="fmemo", length=200)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="ffzwz", length=64)

    public String getFfzwz() {
        return this.ffzwz;
    }
    
    public void setFfzwz(String ffzwz) {
        this.ffzwz = ffzwz;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fzkstate", length=64)

    public String getFzkstate() {
        return this.fzkstate;
    }
    
    public void setFzkstate(String fzkstate) {
        this.fzkstate = fzkstate;
    }
   








}