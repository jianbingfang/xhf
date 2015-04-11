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
 * XhfCommonDoc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xhf_common_doc"
    ,catalog="xhf"
)

public class XhfCommonDoc  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftitle;
     private Integer ftype;
     private Integer fstatus;
     private Date fstartdate;
     private Date fupdatedate;
     private Date fenddate;
     private Long fcreator;
     private String fmodule;
     private String fmemo;
     private Long fdept;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fmemo5;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public XhfCommonDoc() {
    }

    
    /** full constructor */
    public XhfCommonDoc(String ftitle, Integer ftype, Integer fstatus, Date fstartdate, Date fupdatedate, Date fenddate, Long fcreator, String fmodule, String fmemo, Long fdept, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fmemo5, Date fcreatedate) {
        this.ftitle = ftitle;
        this.ftype = ftype;
        this.fstatus = fstatus;
        this.fstartdate = fstartdate;
        this.fupdatedate = fupdatedate;
        this.fenddate = fenddate;
        this.fcreator = fcreator;
        this.fmodule = fmodule;
        this.fmemo = fmemo;
        this.fdept = fdept;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="FTITLE", length=128)

    public String getFtitle() {
        return this.ftitle;
    }
    
    public void setFtitle(String ftitle) {
        this.ftitle = ftitle;
    }
    
    @Column(name="FTYPE")

    public Integer getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Integer ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="FSTATUS")

    public Integer getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(Integer fstatus) {
        this.fstatus = fstatus;
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
    @Column(name="FUPDATEDATE", length=10)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="FENDDATE", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    
    @Column(name="FCREATOR")

    public Long getFcreator() {
        return this.fcreator;
    }
    
    public void setFcreator(Long fcreator) {
        this.fcreator = fcreator;
    }
    
    @Column(name="FMODULE", length=64)

    public String getFmodule() {
        return this.fmodule;
    }
    
    public void setFmodule(String fmodule) {
        this.fmodule = fmodule;
    }
    
    @Column(name="FMEMO", length=128)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="FDEPT")

    public Long getFdept() {
        return this.fdept;
    }
    
    public void setFdept(Long fdept) {
        this.fdept = fdept;
    }
    
    @Column(name="FMEMO1", length=128)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="FMEMO2", length=128)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="FMEMO3", length=128)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="FMEMO4", length=128)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="FMEMO5", length=128)

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="FCREATEDATE", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}