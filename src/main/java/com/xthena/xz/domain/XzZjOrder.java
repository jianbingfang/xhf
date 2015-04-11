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
 * XzZjOrder entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_zj_order"
    ,catalog="xhf"
)

public class XzZjOrder  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String forderno;
     private String fstatus;
     private Date fcreatetime;
     private Date fstarttime;
     private Date fendtime;
     private Long ffzrid;
     private Long fxmid;
     private String fmemo;
     private Date fbackdate;


    // Constructors

    /** default constructor */
    public XzZjOrder() {
    }

    
    /** full constructor */
    public XzZjOrder(String forderno, String fstatus, Date fcreatetime, Date fstarttime, Date fendtime, Long ffzrid, Long fxmid, String fmemo, Date fbackdate) {
        this.forderno = forderno;
        this.fstatus = fstatus;
        this.fcreatetime = fcreatetime;
        this.fstarttime = fstarttime;
        this.fendtime = fendtime;
        this.ffzrid = ffzrid;
        this.fxmid = fxmid;
        this.fmemo = fmemo;
        this.fbackdate = fbackdate;
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
    
    @Column(name="forderno", length=64)

    public String getForderno() {
        return this.forderno;
    }
    
    public void setForderno(String forderno) {
        this.forderno = forderno;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatetime", length=10)

    public Date getFcreatetime() {
        return this.fcreatetime;
    }
    
    public void setFcreatetime(Date fcreatetime) {
        this.fcreatetime = fcreatetime;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstarttime", length=10)

    public Date getFstarttime() {
        return this.fstarttime;
    }
    
    public void setFstarttime(Date fstarttime) {
        this.fstarttime = fstarttime;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fendtime", length=10)

    public Date getFendtime() {
        return this.fendtime;
    }
    
    public void setFendtime(Date fendtime) {
        this.fendtime = fendtime;
    }
    
    @Column(name="ffzrid")

    public Long getFfzrid() {
        return this.ffzrid;
    }
    
    public void setFfzrid(Long ffzrid) {
        this.ffzrid = ffzrid;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbackdate", length=10)

    public Date getFbackdate() {
        return this.fbackdate;
    }
    
    public void setFbackdate(Date fbackdate) {
        this.fbackdate = fbackdate;
    }
   








}