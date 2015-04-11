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
 * XzKzList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_kzlist"
    ,catalog="xhf"
)

public class XzKzList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcaizhi;
     private String fprice;
     private Date flqsj;
     private Long flqr;
     private Date fghsj;
     private Long fghr;
     private Long fxmid;
     private String fmemo;


    // Constructors

    /** default constructor */
    public XzKzList() {
    }

    
    /** full constructor */
    public XzKzList(String fname, String fcaizhi, String fprice, Date flqsj, Long flqr, Date fghsj, Long fghr, Long fxmid, String fmemo) {
        this.fname = fname;
        this.fcaizhi = fcaizhi;
        this.fprice = fprice;
        this.flqsj = flqsj;
        this.flqr = flqr;
        this.fghsj = fghsj;
        this.fghr = fghr;
        this.fxmid = fxmid;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fcaizhi", length=64)

    public String getFcaizhi() {
        return this.fcaizhi;
    }
    
    public void setFcaizhi(String fcaizhi) {
        this.fcaizhi = fcaizhi;
    }
    
    @Column(name="fprice", length=64)

    public String getFprice() {
        return this.fprice;
    }
    
    public void setFprice(String fprice) {
        this.fprice = fprice;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flqsj", length=10)

    public Date getFlqsj() {
        return this.flqsj;
    }
    
    public void setFlqsj(Date flqsj) {
        this.flqsj = flqsj;
    }
    
    @Column(name="flqr")

    public Long getFlqr() {
        return this.flqr;
    }
    
    public void setFlqr(Long flqr) {
        this.flqr = flqr;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fghsj", length=10)

    public Date getFghsj() {
        return this.fghsj;
    }
    
    public void setFghsj(Date fghsj) {
        this.fghsj = fghsj;
    }
    
    @Column(name="fghr")

    public Long getFghr() {
        return this.fghr;
    }
    
    public void setFghr(Long fghr) {
        this.fghr = fghr;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}