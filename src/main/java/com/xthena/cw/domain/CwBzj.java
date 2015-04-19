package com.xthena.cw.domain;
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
 * CwBzj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_cw_bzj"
    ,catalog="xhf"
)

public class CwBzj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fhtname;
     private String fyzname;
     private Date fjndate;

    private Double fjnbksmoney;
    private Double fjnyingsmoney;
    private Double fjnyismoney;

     private String fjnmethod;
     private Long foprator;
     private Date fbackdate;
     private Long fbackoprator;
     private Date fmoneydate;
     private String fbzjtype;
     private String fskdw;
     private String fzh;
     private String fkhh;
     private String fmemo;
     private String fmemo4;
     private Long ffzr;
     private String fzjyw;
     private String ftaskid;
     private String fstatus;
     private String fcontact;
     private String fcontacttel;
     private String fcontentc;
     private String fissj;
     private String fzhubanren;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public CwBzj() {
    }

    
    /** full constructor */
    public CwBzj(Long fxmid, String fhtname, String fyzname, Date fjndate, Double fjnbksmoney, Double fjnyingsmoney, Double fjnyismoney, String fjnmethod, Long foprator, Date fbackdate, Long fbackoprator, Date fmoneydate, String fbzjtype, String fskdw, String fzh, String fkhh, String fmemo, String fmemo4, Long ffzr, String fzjyw, String ftaskid, String fstatus, String fcontact, String fcontacttel, String fcontentc, String fissj, String fzhubanren, Date fcreatedate) {
        this.fxmid = fxmid;
        this.fhtname = fhtname;
        this.fyzname = fyzname;
        this.fjndate = fjndate;
        // 应收 不可收 已收 账款
        this.fjnbksmoney = fjnbksmoney;
        this.fjnyingsmoney = fjnyingsmoney;
        this.fjnyismoney= fjnyismoney;

        this.fjnmethod = fjnmethod;
        this.foprator = foprator;
        this.fbackdate = fbackdate;
        this.fbackoprator = fbackoprator;
        this.fmoneydate = fmoneydate;
        this.fbzjtype = fbzjtype;
        this.fskdw = fskdw;
        this.fzh = fzh;
        this.fkhh = fkhh;
        this.fmemo = fmemo;
        this.fmemo4 = fmemo4;
        this.ffzr = ffzr;
        this.fzjyw = fzjyw;
        this.ftaskid = ftaskid;
        this.fstatus = fstatus;
        this.fcontact = fcontact;
        this.fcontacttel = fcontacttel;
        this.fcontentc = fcontentc;
        this.fissj = fissj;
        this.fzhubanren = fzhubanren;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="fhtname", length=64)

    public String getFhtname() {
        return this.fhtname;
    }
    
    public void setFhtname(String fhtname) {
        this.fhtname = fhtname;
    }
    
    @Column(name="fyzname", length=64)

    public String getFyzname() {
        return this.fyzname;
    }
    
    public void setFyzname(String fyzname) {
        this.fyzname = fyzname;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjndate", length=10)

    public Date getFjndate() {
        return this.fjndate;
    }
    
    public void setFjndate(Date fjndate) {
        this.fjndate = fjndate;
    }
    
    @Column(name="fjnbksmoney", precision=20)
    public Double getFjnbksmoney() {return this.fjnbksmoney;}
    public void setFjnbksmoney(Double fjnbksmoney) {this.fjnbksmoney = fjnbksmoney;}

    @Column(name="fjnyingsmoney", precision=20)
    public Double getFjnyingsmoney() { return this.fjnyingsmoney;}
    public void setFjnyingsmoney(Double fjnyingsmoney) {this.fjnyingsmoney = fjnyingsmoney;}

    @Column(name="fjnyismoney", precision=20)
    public Double getFjnyismoney() { return this.fjnyismoney;}
    public void setFjnyismoney(Double fjnyismoney) {
        this.fjnyismoney = fjnyismoney;
    }

    @Column(name="fjnmethod", length=64)
    public String getFjnmethod() {
        return this.fjnmethod;
    }
    public void setFjnmethod(String fjnmethod) {
        this.fjnmethod = fjnmethod;
    }
    
    @Column(name="foprator")

    public Long getFoprator() {
        return this.foprator;
    }
    
    public void setFoprator(Long foprator) {
        this.foprator = foprator;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbackdate", length=10)

    public Date getFbackdate() {
        return this.fbackdate;
    }
    
    public void setFbackdate(Date fbackdate) {
        this.fbackdate = fbackdate;
    }
    
    @Column(name="fbackoprator")

    public Long getFbackoprator() {
        return this.fbackoprator;
    }
    
    public void setFbackoprator(Long fbackoprator) {
        this.fbackoprator = fbackoprator;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fmoneydate", length=10)

    public Date getFmoneydate() {
        return this.fmoneydate;
    }
    
    public void setFmoneydate(Date fmoneydate) {
        this.fmoneydate = fmoneydate;
    }
    
    @Column(name="fbzjtype", length=64)

    public String getFbzjtype() {
        return this.fbzjtype;
    }
    
    public void setFbzjtype(String fbzjtype) {
        this.fbzjtype = fbzjtype;
    }
    
    @Column(name="fskdw", length=64)

    public String getFskdw() {
        return this.fskdw;
    }
    
    public void setFskdw(String fskdw) {
        this.fskdw = fskdw;
    }
    
    @Column(name="fzh", length=64)

    public String getFzh() {
        return this.fzh;
    }
    
    public void setFzh(String fzh) {
        this.fzh = fzh;
    }
    
    @Column(name="fkhh", length=64)

    public String getFkhh() {
        return this.fkhh;
    }
    
    public void setFkhh(String fkhh) {
        this.fkhh = fkhh;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo4", length=64)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="ffzr")

    public Long getFfzr() {
        return this.ffzr;
    }
    
    public void setFfzr(Long ffzr) {
        this.ffzr = ffzr;
    }
    
    @Column(name="fzjyw", length=64)

    public String getFzjyw() {
        return this.fzjyw;
    }
    
    public void setFzjyw(String fzjyw) {
        this.fzjyw = fzjyw;
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
    
    @Column(name="fcontact", length=64)

    public String getFcontact() {
        return this.fcontact;
    }
    
    public void setFcontact(String fcontact) {
        this.fcontact = fcontact;
    }
    
    @Column(name="fcontacttel", length=64)

    public String getFcontacttel() {
        return this.fcontacttel;
    }
    
    public void setFcontacttel(String fcontacttel) {
        this.fcontacttel = fcontacttel;
    }
    
    @Column(name="fcontentc", length=128)

    public String getFcontentc() {
        return this.fcontentc;
    }
    
    public void setFcontentc(String fcontentc) {
        this.fcontentc = fcontentc;
    }
    
    @Column(name="fissj", length=64)

    public String getFissj() {
        return this.fissj;
    }
    
    public void setFissj(String fissj) {
        this.fissj = fissj;
    }
    
    @Column(name="fzhubanren", length=64)

    public String getFzhubanren() {
        return this.fzhubanren;
    }
    
    public void setFzhubanren(String fzhubanren) {
        this.fzhubanren = fzhubanren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}