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
 * PrXfwj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_xfwj"
    ,catalog="xhf"
)

public class PrXfwj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fwjno;
     private Date ffabudate;
     private String fcontent;
     private String ffilename;
     private String ffileurl;
     private String fjingbanren;
     private Long fjingbanrenid;
     private String fname;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PrXfwj() {
    }

    
    /** full constructor */
    public PrXfwj(String fwjno, Date ffabudate, String fcontent, String ffilename, String ffileurl, String fjingbanren, Long fjingbanrenid, String fname, String fmemo) {
        this.fwjno = fwjno;
        this.ffabudate = ffabudate;
        this.fcontent = fcontent;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fjingbanren = fjingbanren;
        this.fjingbanrenid = fjingbanrenid;
        this.fname = fname;
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
    
    @Column(name="fwjno", length=64)

    public String getFwjno() {
        return this.fwjno;
    }
    
    public void setFwjno(String fwjno) {
        this.fwjno = fwjno;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="ffabudate", length=10)

    public Date getFfabudate() {
        return this.ffabudate;
    }
    
    public void setFfabudate(Date ffabudate) {
        this.ffabudate = ffabudate;
    }
    
    @Column(name="fcontent", length=500)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="ffilename", length=64)

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
    
    @Column(name="fjingbanren", length=64)

    public String getFjingbanren() {
        return this.fjingbanren;
    }
    
    public void setFjingbanren(String fjingbanren) {
        this.fjingbanren = fjingbanren;
    }
    
    @Column(name="fjingbanrenid")

    public Long getFjingbanrenid() {
        return this.fjingbanrenid;
    }
    
    public void setFjingbanrenid(Long fjingbanrenid) {
        this.fjingbanrenid = fjingbanrenid;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}