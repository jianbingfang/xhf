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
 * PjWj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_wj"
    ,catalog="xhf"
)

public class PjWj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fwenjianno;
     private String fzhuti;
     private Date ffabudate;
     private Date fshengxiaodate;
     private String fcontent;
     private String ffilename;
     private String ffileurl;
     private String fwebrul;
     private String fdanwei;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjWj() {
    }

    
    /** full constructor */
    public PjWj(String fwenjianno, String fzhuti, Date ffabudate, Date fshengxiaodate, String fcontent, String ffilename, String ffileurl, String fwebrul, String fdanwei, String fmemo) {
        this.fwenjianno = fwenjianno;
        this.fzhuti = fzhuti;
        this.ffabudate = ffabudate;
        this.fshengxiaodate = fshengxiaodate;
        this.fcontent = fcontent;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fwebrul = fwebrul;
        this.fdanwei = fdanwei;
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
    
    @Column(name="fwenjianno", length=64)

    public String getFwenjianno() {
        return this.fwenjianno;
    }
    
    public void setFwenjianno(String fwenjianno) {
        this.fwenjianno = fwenjianno;
    }
    
    @Column(name="fzhuti", length=64)

    public String getFzhuti() {
        return this.fzhuti;
    }
    
    public void setFzhuti(String fzhuti) {
        this.fzhuti = fzhuti;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="ffabudate", length=10)

    public Date getFfabudate() {
        return this.ffabudate;
    }
    
    public void setFfabudate(Date ffabudate) {
        this.ffabudate = ffabudate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fshengxiaodate", length=10)

    public Date getFshengxiaodate() {
        return this.fshengxiaodate;
    }
    
    public void setFshengxiaodate(Date fshengxiaodate) {
        this.fshengxiaodate = fshengxiaodate;
    }
    
    @Column(name="fcontent", length=4000)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="ffilename", length=128)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=500)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
    
    @Column(name="fwebrul", length=500)

    public String getFwebrul() {
        return this.fwebrul;
    }
    
    public void setFwebrul(String fwebrul) {
        this.fwebrul = fwebrul;
    }
    
    @Column(name="fdanwei", length=64)

    public String getFdanwei() {
        return this.fdanwei;
    }
    
    public void setFdanwei(String fdanwei) {
        this.fdanwei = fdanwei;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}