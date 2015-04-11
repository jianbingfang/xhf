package com.xthena.sckf.domain;
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
 * JyBm entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_bm"
    ,catalog="xhf"
)

public class JyBm  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftype;
     private String fname;
     private String fxmgk;
     private Integer fprovince;
     private Integer fcity;
     private String fscale;
     private Integer fjsdw;
     private String fjslxr;
     private String fjsdwtel;
     private Integer fzbdlgs;
     private String fzbdllxr;
     private String fzbdltel;
     private String fzzyq;
     private Date fbmdate;
     private Date fbmjzdate;
     private Integer fbmalert;
     private Long ftze;
     private Integer fsfdbxm;
     private String fggurl;
     private String fggzy;
     private String fxmxz;
     private String fxmlevel;
     private String fpsstatus;


    // Constructors

    /** default constructor */
    public JyBm() {
    }

    
    /** full constructor */
    public JyBm(String ftype, String fname, String fxmgk, Integer fprovince, Integer fcity, String fscale, Integer fjsdw, String fjslxr, String fjsdwtel, Integer fzbdlgs, String fzbdllxr, String fzbdltel, String fzzyq, Date fbmdate, Date fbmjzdate, Integer fbmalert, Long ftze, Integer fsfdbxm, String fggurl, String fggzy, String fxmxz, String fxmlevel, String fpsstatus) {
        this.ftype = ftype;
        this.fname = fname;
        this.fxmgk = fxmgk;
        this.fprovince = fprovince;
        this.fcity = fcity;
        this.fscale = fscale;
        this.fjsdw = fjsdw;
        this.fjslxr = fjslxr;
        this.fjsdwtel = fjsdwtel;
        this.fzbdlgs = fzbdlgs;
        this.fzbdllxr = fzbdllxr;
        this.fzbdltel = fzbdltel;
        this.fzzyq = fzzyq;
        this.fbmdate = fbmdate;
        this.fbmjzdate = fbmjzdate;
        this.fbmalert = fbmalert;
        this.ftze = ftze;
        this.fsfdbxm = fsfdbxm;
        this.fggurl = fggurl;
        this.fggzy = fggzy;
        this.fxmxz = fxmxz;
        this.fxmlevel = fxmlevel;
        this.fpsstatus = fpsstatus;
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
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="Fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fxmgk", length=128)

    public String getFxmgk() {
        return this.fxmgk;
    }
    
    public void setFxmgk(String fxmgk) {
        this.fxmgk = fxmgk;
    }
    
    @Column(name="fprovince")

    public Integer getFprovince() {
        return this.fprovince;
    }
    
    public void setFprovince(Integer fprovince) {
        this.fprovince = fprovince;
    }
    
    @Column(name="fcity")

    public Integer getFcity() {
        return this.fcity;
    }
    
    public void setFcity(Integer fcity) {
        this.fcity = fcity;
    }
    
    @Column(name="fscale", length=64)

    public String getFscale() {
        return this.fscale;
    }
    
    public void setFscale(String fscale) {
        this.fscale = fscale;
    }
    
    @Column(name="fjsdw")

    public Integer getFjsdw() {
        return this.fjsdw;
    }
    
    public void setFjsdw(Integer fjsdw) {
        this.fjsdw = fjsdw;
    }
    
    @Column(name="fjslxr", length=10)

    public String getFjslxr() {
        return this.fjslxr;
    }
    
    public void setFjslxr(String fjslxr) {
        this.fjslxr = fjslxr;
    }
    
    @Column(name="fjsdwtel", length=10)

    public String getFjsdwtel() {
        return this.fjsdwtel;
    }
    
    public void setFjsdwtel(String fjsdwtel) {
        this.fjsdwtel = fjsdwtel;
    }
    
    @Column(name="fzbdlgs")

    public Integer getFzbdlgs() {
        return this.fzbdlgs;
    }
    
    public void setFzbdlgs(Integer fzbdlgs) {
        this.fzbdlgs = fzbdlgs;
    }
    
    @Column(name="fzbdllxr", length=10)

    public String getFzbdllxr() {
        return this.fzbdllxr;
    }
    
    public void setFzbdllxr(String fzbdllxr) {
        this.fzbdllxr = fzbdllxr;
    }
    
    @Column(name="fzbdltel", length=10)

    public String getFzbdltel() {
        return this.fzbdltel;
    }
    
    public void setFzbdltel(String fzbdltel) {
        this.fzbdltel = fzbdltel;
    }
    
    @Column(name="fzzyq", length=64)

    public String getFzzyq() {
        return this.fzzyq;
    }
    
    public void setFzzyq(String fzzyq) {
        this.fzzyq = fzzyq;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmdate", length=10)

    public Date getFbmdate() {
        return this.fbmdate;
    }
    
    public void setFbmdate(Date fbmdate) {
        this.fbmdate = fbmdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmjzdate", length=10)

    public Date getFbmjzdate() {
        return this.fbmjzdate;
    }
    
    public void setFbmjzdate(Date fbmjzdate) {
        this.fbmjzdate = fbmjzdate;
    }
    
    @Column(name="fbmalert")

    public Integer getFbmalert() {
        return this.fbmalert;
    }
    
    public void setFbmalert(Integer fbmalert) {
        this.fbmalert = fbmalert;
    }
    
    @Column(name="ftze")

    public Long getFtze() {
        return this.ftze;
    }
    
    public void setFtze(Long ftze) {
        this.ftze = ftze;
    }
    
    @Column(name="fsfdbxm")

    public Integer getFsfdbxm() {
        return this.fsfdbxm;
    }
    
    public void setFsfdbxm(Integer fsfdbxm) {
        this.fsfdbxm = fsfdbxm;
    }
    
    @Column(name="fggurl", length=512)

    public String getFggurl() {
        return this.fggurl;
    }
    
    public void setFggurl(String fggurl) {
        this.fggurl = fggurl;
    }
    
    @Column(name="fggzy", length=512)

    public String getFggzy() {
        return this.fggzy;
    }
    
    public void setFggzy(String fggzy) {
        this.fggzy = fggzy;
    }
    
    @Column(name="fxmxz", length=64)

    public String getFxmxz() {
        return this.fxmxz;
    }
    
    public void setFxmxz(String fxmxz) {
        this.fxmxz = fxmxz;
    }
    
    @Column(name="fxmlevel", length=64)

    public String getFxmlevel() {
        return this.fxmlevel;
    }
    
    public void setFxmlevel(String fxmlevel) {
        this.fxmlevel = fxmlevel;
    }
    
    @Column(name="fpsstatus", length=64)

    public String getFpsstatus() {
        return this.fpsstatus;
    }
    
    public void setFpsstatus(String fpsstatus) {
        this.fpsstatus = fpsstatus;
    }
   








}