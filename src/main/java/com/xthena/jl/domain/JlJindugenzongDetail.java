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
 * JlJindugenzongDetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_jindugenzong_detail"
    ,catalog="xhf"
)

public class JlJindugenzongDetail  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private Date fstartdate;
     private Date fenddate;
     private Date feditdate;
     private Date fcompdate;
     private Date frealstart;
     private Date frealend;
     private String fanalyze;
     private String ftype;
     private String fstatus;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Integer fpercent;
     private Integer frealpercent;
     private Long fgzid;


    // Constructors

    /** default constructor */
    public JlJindugenzongDetail() {
    }

    
    /** full constructor */
    public JlJindugenzongDetail(String fname, Date fstartdate, Date fenddate, Date feditdate, Date fcompdate, Date frealstart, Date frealend, String fanalyze, String ftype, String fstatus, String fmemo, String fmemo1, String fmemo2, Integer fpercent, Integer frealpercent, Long fgzid) {
        this.fname = fname;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.feditdate = feditdate;
        this.fcompdate = fcompdate;
        this.frealstart = frealstart;
        this.frealend = frealend;
        this.fanalyze = fanalyze;
        this.ftype = ftype;
        this.fstatus = fstatus;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fpercent = fpercent;
        this.frealpercent = frealpercent;
        this.fgzid = fgzid;
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
    @Column(name="feditdate", length=10)

    public Date getFeditdate() {
        return this.feditdate;
    }
    
    public void setFeditdate(Date feditdate) {
        this.feditdate = feditdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcompdate", length=10)

    public Date getFcompdate() {
        return this.fcompdate;
    }
    
    public void setFcompdate(Date fcompdate) {
        this.fcompdate = fcompdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="frealstart", length=10)

    public Date getFrealstart() {
        return this.frealstart;
    }
    
    public void setFrealstart(Date frealstart) {
        this.frealstart = frealstart;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="frealend", length=10)

    public Date getFrealend() {
        return this.frealend;
    }
    
    public void setFrealend(Date frealend) {
        this.frealend = frealend;
    }
    
    @Column(name="fanalyze", length=5000)

    public String getFanalyze() {
        return this.fanalyze;
    }
    
    public void setFanalyze(String fanalyze) {
        this.fanalyze = fanalyze;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=500)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=500)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fpercent")

    public Integer getFpercent() {
        return this.fpercent;
    }
    
    public void setFpercent(Integer fpercent) {
        this.fpercent = fpercent;
    }
    
    @Column(name="frealpercent")

    public Integer getFrealpercent() {
        return this.frealpercent;
    }
    
    public void setFrealpercent(Integer frealpercent) {
        this.frealpercent = frealpercent;
    }
    
    @Column(name="fgzid")

    public Long getFgzid() {
        return this.fgzid;
    }
    
    public void setFgzid(Long fgzid) {
        this.fgzid = fgzid;
    }
   








}