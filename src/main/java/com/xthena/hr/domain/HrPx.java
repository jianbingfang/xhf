package com.xthena.hr.domain;
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
 * HrPx entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_px"
    ,catalog="xhf"
)

public class HrPx  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fpxzt;
     private String fpxdd;
     private String fzzdw;
     private Long fcjrs;
     private Long ftgrs;
     private Integer fpxtype;
     private Integer fpxfs;
     private Long fzzbm;
     private Long ffzr;
     private String fpxnrzy;
     private Integer fsfks;
     private Integer fksfs;
     private String fksjg;
     private String fzlurl;
     private String fzlmc;
     private Integer fzjlq;
     private Date fdate;
     private Integer ffplq;
     private Date fdjdate;
     private String fmemo;
     private String fmemo1;
     private Integer fnwb;
     private String fmemo2;


    // Constructors

    /** default constructor */
    public HrPx() {
    }

    
    /** full constructor */
    public HrPx(String fpxzt, String fpxdd, String fzzdw, Long fcjrs, Long ftgrs, Integer fpxtype, Integer fpxfs, Long fzzbm, Long ffzr, String fpxnrzy, Integer fsfks, Integer fksfs, String fksjg, String fzlurl, String fzlmc, Integer fzjlq, Date fdate, Integer ffplq, Date fdjdate, String fmemo, String fmemo1, Integer fnwb, String fmemo2) {
        this.fpxzt = fpxzt;
        this.fpxdd = fpxdd;
        this.fzzdw = fzzdw;
        this.fcjrs = fcjrs;
        this.ftgrs = ftgrs;
        this.fpxtype = fpxtype;
        this.fpxfs = fpxfs;
        this.fzzbm = fzzbm;
        this.ffzr = ffzr;
        this.fpxnrzy = fpxnrzy;
        this.fsfks = fsfks;
        this.fksfs = fksfs;
        this.fksjg = fksjg;
        this.fzlurl = fzlurl;
        this.fzlmc = fzlmc;
        this.fzjlq = fzjlq;
        this.fdate = fdate;
        this.ffplq = ffplq;
        this.fdjdate = fdjdate;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fnwb = fnwb;
        this.fmemo2 = fmemo2;
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
    
    @Column(name="fpxzt", length=128)

    public String getFpxzt() {
        return this.fpxzt;
    }
    
    public void setFpxzt(String fpxzt) {
        this.fpxzt = fpxzt;
    }
    
    @Column(name="fpxdd", length=128)

    public String getFpxdd() {
        return this.fpxdd;
    }
    
    public void setFpxdd(String fpxdd) {
        this.fpxdd = fpxdd;
    }
    
    @Column(name="fzzdw", length=128)

    public String getFzzdw() {
        return this.fzzdw;
    }
    
    public void setFzzdw(String fzzdw) {
        this.fzzdw = fzzdw;
    }
    
    @Column(name="fcjrs")

    public Long getFcjrs() {
        return this.fcjrs;
    }
    
    public void setFcjrs(Long fcjrs) {
        this.fcjrs = fcjrs;
    }
    
    @Column(name="ftgrs")

    public Long getFtgrs() {
        return this.ftgrs;
    }
    
    public void setFtgrs(Long ftgrs) {
        this.ftgrs = ftgrs;
    }
    
    @Column(name="fpxtype")

    public Integer getFpxtype() {
        return this.fpxtype;
    }
    
    public void setFpxtype(Integer fpxtype) {
        this.fpxtype = fpxtype;
    }
    
    @Column(name="fpxfs")

    public Integer getFpxfs() {
        return this.fpxfs;
    }
    
    public void setFpxfs(Integer fpxfs) {
        this.fpxfs = fpxfs;
    }
    
    @Column(name="fzzbm")

    public Long getFzzbm() {
        return this.fzzbm;
    }
    
    public void setFzzbm(Long fzzbm) {
        this.fzzbm = fzzbm;
    }
    
    @Column(name="ffzr")

    public Long getFfzr() {
        return this.ffzr;
    }
    
    public void setFfzr(Long ffzr) {
        this.ffzr = ffzr;
    }
    
    @Column(name="fpxnrzy", length=4000)

    public String getFpxnrzy() {
        return this.fpxnrzy;
    }
    
    public void setFpxnrzy(String fpxnrzy) {
        this.fpxnrzy = fpxnrzy;
    }
    
    @Column(name="fsfks")

    public Integer getFsfks() {
        return this.fsfks;
    }
    
    public void setFsfks(Integer fsfks) {
        this.fsfks = fsfks;
    }
    
    @Column(name="fksfs")

    public Integer getFksfs() {
        return this.fksfs;
    }
    
    public void setFksfs(Integer fksfs) {
        this.fksfs = fksfs;
    }
    
    @Column(name="fksjg", length=256)

    public String getFksjg() {
        return this.fksjg;
    }
    
    public void setFksjg(String fksjg) {
        this.fksjg = fksjg;
    }
    
    @Column(name="fzlurl", length=256)

    public String getFzlurl() {
        return this.fzlurl;
    }
    
    public void setFzlurl(String fzlurl) {
        this.fzlurl = fzlurl;
    }
    
    @Column(name="fzlmc", length=256)

    public String getFzlmc() {
        return this.fzlmc;
    }
    
    public void setFzlmc(String fzlmc) {
        this.fzlmc = fzlmc;
    }
    
    @Column(name="fzjlq")

    public Integer getFzjlq() {
        return this.fzjlq;
    }
    
    public void setFzjlq(Integer fzjlq) {
        this.fzjlq = fzjlq;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="ffplq")

    public Integer getFfplq() {
        return this.ffplq;
    }
    
    public void setFfplq(Integer ffplq) {
        this.ffplq = ffplq;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdjdate", length=10)

    public Date getFdjdate() {
        return this.fdjdate;
    }
    
    public void setFdjdate(Date fdjdate) {
        this.fdjdate = fdjdate;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fnwb")

    public Integer getFnwb() {
        return this.fnwb;
    }
    
    public void setFnwb(Integer fnwb) {
        this.fnwb = fnwb;
    }
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
   








}