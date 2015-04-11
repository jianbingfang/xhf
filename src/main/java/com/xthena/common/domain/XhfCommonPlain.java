package com.xthena.common.domain;
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
 * XhfCommonPlain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xhf_common_plain"
    ,catalog="xhf"
)

public class XhfCommonPlain  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcode;
     private String ftitle;
     private String fmonth;
     private Date fsubdate;
     private Long fuserid;
     private String fmemo;
     private Date fstartdate;
     private Date fenddate;
     private String fdetail;
     private String fmodulecode;
     private Long fdeptid;
     private Integer ffnishtype;
     private String ffnishmemo;
     private Integer ftype;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fmemo5;
     private String fcomment;
     private String fstatus;
     private String ftaskid;


    // Constructors

    /** default constructor */
    public XhfCommonPlain() {
    }

    
    /** full constructor */
    public XhfCommonPlain(String fcode, String ftitle, String fmonth, Date fsubdate, Long fuserid, String fmemo, Date fstartdate, Date fenddate, String fdetail, String fmodulecode, Long fdeptid, Integer ffnishtype, String ffnishmemo, Integer ftype, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fmemo5, String fcomment, String fstatus, String ftaskid) {
        this.fcode = fcode;
        this.ftitle = ftitle;
        this.fmonth = fmonth;
        this.fsubdate = fsubdate;
        this.fuserid = fuserid;
        this.fmemo = fmemo;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.fdetail = fdetail;
        this.fmodulecode = fmodulecode;
        this.fdeptid = fdeptid;
        this.ffnishtype = ffnishtype;
        this.ffnishmemo = ffnishmemo;
        this.ftype = ftype;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
        this.fcomment = fcomment;
        this.fstatus = fstatus;
        this.ftaskid = ftaskid;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="FID", unique=true, nullable=false)

    public Long getFid() {
        return this.fid;
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
    
    @Column(name="FCODE", length=128)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="FTITLE", length=128)

    public String getFtitle() {
        return this.ftitle;
    }
    
    public void setFtitle(String ftitle) {
        this.ftitle = ftitle;
    }
    
    @Column(name="FMONTH", length=6)

    public String getFmonth() {
        return this.fmonth;
    }
    
    public void setFmonth(String fmonth) {
        this.fmonth = fmonth;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="FSUBDATE", length=10)

    public Date getFsubdate() {
        return this.fsubdate;
    }
    
    public void setFsubdate(Date fsubdate) {
        this.fsubdate = fsubdate;
    }
    
    @Column(name="FUSERID")

    public Long getFuserid() {
        return this.fuserid;
    }
    
    public void setFuserid(Long fuserid) {
        this.fuserid = fuserid;
    }
    
    @Column(name="FMEMO", length=128)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="FSTARTDATE", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="FENDDATE", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    
    @Column(name="FDETAIL", length=4000)

    public String getFdetail() {
        return this.fdetail;
    }
    
    public void setFdetail(String fdetail) {
        this.fdetail = fdetail;
    }
    
    @Column(name="FMODULECODE", length=16)

    public String getFmodulecode() {
        return this.fmodulecode;
    }
    
    public void setFmodulecode(String fmodulecode) {
        this.fmodulecode = fmodulecode;
    }
    
    @Column(name="FDEPTID")

    public Long getFdeptid() {
        return this.fdeptid;
    }
    
    public void setFdeptid(Long fdeptid) {
        this.fdeptid = fdeptid;
    }
    
    @Column(name="FFNISHTYPE")

    public Integer getFfnishtype() {
        return this.ffnishtype;
    }
    
    public void setFfnishtype(Integer ffnishtype) {
        this.ffnishtype = ffnishtype;
    }
    
    @Column(name="FFNISHMEMO", length=128)

    public String getFfnishmemo() {
        return this.ffnishmemo;
    }
    
    public void setFfnishmemo(String ffnishmemo) {
        this.ffnishmemo = ffnishmemo;
    }
    
    @Column(name="FTYPE")

    public Integer getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Integer ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="FMEMO1")

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="FMEMO2")

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="FMEMO3")

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="FMEMO4")

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="FMEMO5")

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
    
    @Column(name="fcomment", length=500)

    public String getFcomment() {
        return this.fcomment;
    }
    
    public void setFcomment(String fcomment) {
        this.fcomment = fcomment;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="ftaskid", length=64)

    public String getFtaskid() {
        return this.ftaskid;
    }
    
    public void setFtaskid(String ftaskid) {
        this.ftaskid = ftaskid;
    }
   








}