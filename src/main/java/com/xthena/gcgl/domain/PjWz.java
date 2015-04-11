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
 * PjWz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_wz"
    ,catalog="xhf"
)

public class PjWz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private Long fwzid;
     private String fwzname;
     private Long fnum;
     private String fwzcode;
     private String fwztype;
     private String fisassets;
     private Date fenddate;
     private Date fstartdate;
     private Long flyry;
     private Long fghry;
     private Integer fstatus;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjWz() {
    }

    
    /** full constructor */
    public PjWz(Long fxmid, Long fwzid, String fwzname, Long fnum, String fwzcode, String fwztype, String fisassets, Date fenddate, Date fstartdate, Long flyry, Long fghry, Integer fstatus, String fmemo) {
        this.fxmid = fxmid;
        this.fwzid = fwzid;
        this.fwzname = fwzname;
        this.fnum = fnum;
        this.fwzcode = fwzcode;
        this.fwztype = fwztype;
        this.fisassets = fisassets;
        this.fenddate = fenddate;
        this.fstartdate = fstartdate;
        this.flyry = flyry;
        this.fghry = fghry;
        this.fstatus = fstatus;
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
    
    @Column(name="fwzid")

    public Long getFwzid() {
        return this.fwzid;
    }
    
    public void setFwzid(Long fwzid) {
        this.fwzid = fwzid;
    }
    
    @Column(name="fwzname", length=64)

    public String getFwzname() {
        return this.fwzname;
    }
    
    public void setFwzname(String fwzname) {
        this.fwzname = fwzname;
    }
    
    @Column(name="fnum")

    public Long getFnum() {
        return this.fnum;
    }
    
    public void setFnum(Long fnum) {
        this.fnum = fnum;
    }
    
    @Column(name="fwzcode", length=64)

    public String getFwzcode() {
        return this.fwzcode;
    }
    
    public void setFwzcode(String fwzcode) {
        this.fwzcode = fwzcode;
    }
    
    @Column(name="fwztype", length=64)

    public String getFwztype() {
        return this.fwztype;
    }
    
    public void setFwztype(String fwztype) {
        this.fwztype = fwztype;
    }
    
    @Column(name="fisassets", length=64)

    public String getFisassets() {
        return this.fisassets;
    }
    
    public void setFisassets(String fisassets) {
        this.fisassets = fisassets;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fenddate", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdate", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    
    @Column(name="flyry")

    public Long getFlyry() {
        return this.flyry;
    }
    
    public void setFlyry(Long flyry) {
        this.flyry = flyry;
    }
    
    @Column(name="fghry")

    public Long getFghry() {
        return this.fghry;
    }
    
    public void setFghry(Long fghry) {
        this.fghry = fghry;
    }
    
    @Column(name="fstatus")

    public Integer getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(Integer fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}