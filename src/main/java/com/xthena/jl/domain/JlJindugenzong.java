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
 * JlJindugenzong entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_jindugenzong"
    ,catalog="xhf"
)

public class JlJindugenzong  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private Date fstartdate;
     private Date fenddate;
     private Date fcreatdate;
     private Long fxmid;
     private String ftype;
     private String fcode;
     private String fstatus;
     private String fanalyze;


    // Constructors

    /** default constructor */
    public JlJindugenzong() {
    }

    
    /** full constructor */
    public JlJindugenzong(String fname, Date fstartdate, Date fenddate, Date fcreatdate, Long fxmid, String ftype, String fcode, String fstatus, String fanalyze) {
        this.fname = fname;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.fcreatdate = fcreatdate;
        this.fxmid = fxmid;
        this.ftype = ftype;
        this.fcode = fcode;
        this.fstatus = fstatus;
        this.fanalyze = fanalyze;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdate", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
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
    @Column(name="fcreatdate", length=10)

    public Date getFcreatdate() {
        return this.fcreatdate;
    }
    
    public void setFcreatdate(Date fcreatdate) {
        this.fcreatdate = fcreatdate;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fanalyze", length=4000)

    public String getFanalyze() {
        return this.fanalyze;
    }
    
    public void setFanalyze(String fanalyze) {
        this.fanalyze = fanalyze;
    }
   








}