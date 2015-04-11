package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjXm entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_xm"
    ,catalog="xhf"
)

public class PjXm  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fxmname;
     private String fxmno;
     private String fnbno;
     private String fxmtype;
     private String fprovince;
     private String fcity;
     private String fxmstatus;
     private String fxmaddr;
     private Long fjsdwid;
     private String fxmmoney;
     private String fxmgaikuang;
     private Long fxmzongjianid;
     private Long fxmzhubanrenid;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fxmzhubanren;
     private String fxmzongjian;
     private String fjsdw;
     private String fjzgm;
     private String fzgd;
     private String fcengshu;
     private String fjggm;
     private Integer fxmjd;
     private Long fhtid;
     private String fonline;
     private String ftaskid;
     private String fstatus;


    // Constructors

    /** default constructor */
    public PjXm() {
    }

    
    /** full constructor */
    public PjXm(String fxmname, String fxmno, String fnbno, String fxmtype, String fprovince, String fcity, String fxmstatus, String fxmaddr, Long fjsdwid, String fxmmoney, String fxmgaikuang, Long fxmzongjianid, Long fxmzhubanrenid, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fxmzhubanren, String fxmzongjian, String fjsdw, String fjzgm, String fzgd, String fcengshu, String fjggm, Integer fxmjd, Long fhtid, String fonline, String ftaskid, String fstatus) {
        this.fxmname = fxmname;
        this.fxmno = fxmno;
        this.fnbno = fnbno;
        this.fxmtype = fxmtype;
        this.fprovince = fprovince;
        this.fcity = fcity;
        this.fxmstatus = fxmstatus;
        this.fxmaddr = fxmaddr;
        this.fjsdwid = fjsdwid;
        this.fxmmoney = fxmmoney;
        this.fxmgaikuang = fxmgaikuang;
        this.fxmzongjianid = fxmzongjianid;
        this.fxmzhubanrenid = fxmzhubanrenid;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fxmzhubanren = fxmzhubanren;
        this.fxmzongjian = fxmzongjian;
        this.fjsdw = fjsdw;
        this.fjzgm = fjzgm;
        this.fzgd = fzgd;
        this.fcengshu = fcengshu;
        this.fjggm = fjggm;
        this.fxmjd = fxmjd;
        this.fhtid = fhtid;
        this.fonline = fonline;
        this.ftaskid = ftaskid;
        this.fstatus = fstatus;
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
    
    @Column(name="fxmname", length=512)

    public String getFxmname() {
        return this.fxmname;
    }
    
    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }
    
    @Column(name="fxmno", length=64)

    public String getFxmno() {
        return this.fxmno;
    }
    
    public void setFxmno(String fxmno) {
        this.fxmno = fxmno;
    }
    
    @Column(name="fnbno", length=64)

    public String getFnbno() {
        return this.fnbno;
    }
    
    public void setFnbno(String fnbno) {
        this.fnbno = fnbno;
    }
    
    @Column(name="fxmtype", length=64)

    public String getFxmtype() {
        return this.fxmtype;
    }
    
    public void setFxmtype(String fxmtype) {
        this.fxmtype = fxmtype;
    }
    
    @Column(name="fprovince", length=64)

    public String getFprovince() {
        return this.fprovince;
    }
    
    public void setFprovince(String fprovince) {
        this.fprovince = fprovince;
    }
    
    @Column(name="fcity", length=64)

    public String getFcity() {
        return this.fcity;
    }
    
    public void setFcity(String fcity) {
        this.fcity = fcity;
    }
    
    @Column(name="fxmstatus", length=64)

    public String getFxmstatus() {
        return this.fxmstatus;
    }
    
    public void setFxmstatus(String fxmstatus) {
        this.fxmstatus = fxmstatus;
    }
    
    @Column(name="fxmaddr", length=64)

    public String getFxmaddr() {
        return this.fxmaddr;
    }
    
    public void setFxmaddr(String fxmaddr) {
        this.fxmaddr = fxmaddr;
    }
    
    @Column(name="fjsdwid")

    public Long getFjsdwid() {
        return this.fjsdwid;
    }
    
    public void setFjsdwid(Long fjsdwid) {
        this.fjsdwid = fjsdwid;
    }
    
    @Column(name="fxmmoney", length=64)

    public String getFxmmoney() {
        return this.fxmmoney;
    }
    
    public void setFxmmoney(String fxmmoney) {
        this.fxmmoney = fxmmoney;
    }
    
    @Column(name="fxmgaikuang", length=500)

    public String getFxmgaikuang() {
        return this.fxmgaikuang;
    }
    
    public void setFxmgaikuang(String fxmgaikuang) {
        this.fxmgaikuang = fxmgaikuang;
    }
    
    @Column(name="fxmzongjianid")

    public Long getFxmzongjianid() {
        return this.fxmzongjianid;
    }
    
    public void setFxmzongjianid(Long fxmzongjianid) {
        this.fxmzongjianid = fxmzongjianid;
    }
    
    @Column(name="fxmzhubanrenid")

    public Long getFxmzhubanrenid() {
        return this.fxmzhubanrenid;
    }
    
    public void setFxmzhubanrenid(Long fxmzhubanrenid) {
        this.fxmzhubanrenid = fxmzhubanrenid;
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
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=64)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="fmemo4", length=64)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="fxmzhubanren", length=64)

    public String getFxmzhubanren() {
        return this.fxmzhubanren;
    }
    
    public void setFxmzhubanren(String fxmzhubanren) {
        this.fxmzhubanren = fxmzhubanren;
    }
    
    @Column(name="fxmzongjian", length=64)

    public String getFxmzongjian() {
        return this.fxmzongjian;
    }
    
    public void setFxmzongjian(String fxmzongjian) {
        this.fxmzongjian = fxmzongjian;
    }
    
    @Column(name="fjsdw", length=64)

    public String getFjsdw() {
        return this.fjsdw;
    }
    
    public void setFjsdw(String fjsdw) {
        this.fjsdw = fjsdw;
    }
    
    @Column(name="fjzgm", length=64)

    public String getFjzgm() {
        return this.fjzgm;
    }
    
    public void setFjzgm(String fjzgm) {
        this.fjzgm = fjzgm;
    }
    
    @Column(name="fzgd", length=64)

    public String getFzgd() {
        return this.fzgd;
    }
    
    public void setFzgd(String fzgd) {
        this.fzgd = fzgd;
    }
    
    @Column(name="fcengshu", length=64)

    public String getFcengshu() {
        return this.fcengshu;
    }
    
    public void setFcengshu(String fcengshu) {
        this.fcengshu = fcengshu;
    }
    
    @Column(name="fjggm", length=64)

    public String getFjggm() {
        return this.fjggm;
    }
    
    public void setFjggm(String fjggm) {
        this.fjggm = fjggm;
    }
    
    @Column(name="fxmjd")

    public Integer getFxmjd() {
        return this.fxmjd;
    }
    
    public void setFxmjd(Integer fxmjd) {
        this.fxmjd = fxmjd;
    }
    
    @Column(name="fhtid")

    public Long getFhtid() {
        return this.fhtid;
    }
    
    public void setFhtid(Long fhtid) {
        this.fhtid = fhtid;
    }
    
    @Column(name="fonline", length=64)

    public String getFonline() {
        return this.fonline;
    }
    
    public void setFonline(String fonline) {
        this.fonline = fonline;
    }
    
    @Column(name="ftaskid", length=64)

    public String getFtaskid() {
        return this.ftaskid;
    }
    
    public void setFtaskid(String ftaskid) {
        this.ftaskid = ftaskid;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
   








}