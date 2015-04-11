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
 * PjXmz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_xmz"
    ,catalog="xhf"
)

public class PjXmz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fxmzno;
     private Long fxmid;
     private Long fyijiaorenid;
     private Long fjieshourenid;
     private Date fyijiaodate;
     private String fmemo;
     private String fyijiaoren;
     private String fjieshouren;
     private Date fguihuadate;
     private String fxmzname;
     private Long fxmzid;
     private String fstatus;


    // Constructors

    /** default constructor */
    public PjXmz() {
    }

    
    /** full constructor */
    public PjXmz(String fxmzno, Long fxmid, Long fyijiaorenid, Long fjieshourenid, Date fyijiaodate, String fmemo, String fyijiaoren, String fjieshouren, Date fguihuadate, String fxmzname, Long fxmzid, String fstatus) {
        this.fxmzno = fxmzno;
        this.fxmid = fxmid;
        this.fyijiaorenid = fyijiaorenid;
        this.fjieshourenid = fjieshourenid;
        this.fyijiaodate = fyijiaodate;
        this.fmemo = fmemo;
        this.fyijiaoren = fyijiaoren;
        this.fjieshouren = fjieshouren;
        this.fguihuadate = fguihuadate;
        this.fxmzname = fxmzname;
        this.fxmzid = fxmzid;
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
    
    @Column(name="fxmzno", length=64)

    public String getFxmzno() {
        return this.fxmzno;
    }
    
    public void setFxmzno(String fxmzno) {
        this.fxmzno = fxmzno;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fyijiaorenid")

    public Long getFyijiaorenid() {
        return this.fyijiaorenid;
    }
    
    public void setFyijiaorenid(Long fyijiaorenid) {
        this.fyijiaorenid = fyijiaorenid;
    }
    
    @Column(name="fjieshourenid")

    public Long getFjieshourenid() {
        return this.fjieshourenid;
    }
    
    public void setFjieshourenid(Long fjieshourenid) {
        this.fjieshourenid = fjieshourenid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fyijiaodate", length=10)

    public Date getFyijiaodate() {
        return this.fyijiaodate;
    }
    
    public void setFyijiaodate(Date fyijiaodate) {
        this.fyijiaodate = fyijiaodate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fyijiaoren", length=64)

    public String getFyijiaoren() {
        return this.fyijiaoren;
    }
    
    public void setFyijiaoren(String fyijiaoren) {
        this.fyijiaoren = fyijiaoren;
    }
    
    @Column(name="fjieshouren", length=64)

    public String getFjieshouren() {
        return this.fjieshouren;
    }
    
    public void setFjieshouren(String fjieshouren) {
        this.fjieshouren = fjieshouren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fguihuadate", length=10)

    public Date getFguihuadate() {
        return this.fguihuadate;
    }
    
    public void setFguihuadate(Date fguihuadate) {
        this.fguihuadate = fguihuadate;
    }
    
    @Column(name="fxmzname", length=64)

    public String getFxmzname() {
        return this.fxmzname;
    }
    
    public void setFxmzname(String fxmzname) {
        this.fxmzname = fxmzname;
    }
    
    @Column(name="fxmzid")

    public Long getFxmzid() {
        return this.fxmzid;
    }
    
    public void setFxmzid(Long fxmzid) {
        this.fxmzid = fxmzid;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
   








}