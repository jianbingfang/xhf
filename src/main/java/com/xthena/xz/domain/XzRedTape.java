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
 * XzRedTape entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_redtape"
    ,catalog="xhf"
)

public class XzRedTape  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcode;
     private String ftaptitle;
     private String ftapeno;
     private String ftapename;
     private String fsend;
     private String frecive;
     private Date fcreatedate;
     private String fmemo;
     private String ffzwz;
     private Integer ftype;
     private String furl;
     private String fhjxm;
     private String fzj;
     private String fzkstate;


    // Constructors

    /** default constructor */
    public XzRedTape() {
    }

	/** minimal constructor */
    public XzRedTape(String ftaptitle, String ftapeno, String ftapename) {
        this.ftaptitle = ftaptitle;
        this.ftapeno = ftapeno;
        this.ftapename = ftapename;
    }
    
    /** full constructor */
    public XzRedTape(String fcode, String ftaptitle, String ftapeno, String ftapename, String fsend, String frecive, Date fcreatedate, String fmemo, String ffzwz, Integer ftype, String furl, String fhjxm, String fzj, String fzkstate) {
        this.fcode = fcode;
        this.ftaptitle = ftaptitle;
        this.ftapeno = ftapeno;
        this.ftapename = ftapename;
        this.fsend = fsend;
        this.frecive = frecive;
        this.fcreatedate = fcreatedate;
        this.fmemo = fmemo;
        this.ffzwz = ffzwz;
        this.ftype = ftype;
        this.furl = furl;
        this.fhjxm = fhjxm;
        this.fzj = fzj;
        this.fzkstate = fzkstate;
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
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="ftaptitle", nullable=false, length=2000)

    public String getFtaptitle() {
        return this.ftaptitle;
    }
    
    public void setFtaptitle(String ftaptitle) {
        this.ftaptitle = ftaptitle;
    }
    
    @Column(name="ftapeno", nullable=false, length=64)

    public String getFtapeno() {
        return this.ftapeno;
    }
    
    public void setFtapeno(String ftapeno) {
        this.ftapeno = ftapeno;
    }
    
    @Column(name="ftapename", nullable=false, length=4000)

    public String getFtapename() {
        return this.ftapename;
    }
    
    public void setFtapename(String ftapename) {
        this.ftapename = ftapename;
    }
    
    @Column(name="fsend", length=64)

    public String getFsend() {
        return this.fsend;
    }
    
    public void setFsend(String fsend) {
        this.fsend = fsend;
    }
    
    @Column(name="frecive", length=64)

    public String getFrecive() {
        return this.frecive;
    }
    
    public void setFrecive(String frecive) {
        this.frecive = frecive;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
    
    @Column(name="fmemo", length=4000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="ffzwz", length=64)

    public String getFfzwz() {
        return this.ffzwz;
    }
    
    public void setFfzwz(String ffzwz) {
        this.ffzwz = ffzwz;
    }
    
    @Column(name="ftype")

    public Integer getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Integer ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="furl", length=4000)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
    
    @Column(name="fhjxm", length=200)

    public String getFhjxm() {
        return this.fhjxm;
    }
    
    public void setFhjxm(String fhjxm) {
        this.fhjxm = fhjxm;
    }
    
    @Column(name="fzj", length=200)

    public String getFzj() {
        return this.fzj;
    }
    
    public void setFzj(String fzj) {
        this.fzj = fzj;
    }
    
    @Column(name="fzkstate", length=64)

    public String getFzkstate() {
        return this.fzkstate;
    }
    
    public void setFzkstate(String fzkstate) {
        this.fzkstate = fzkstate;
    }
   








}