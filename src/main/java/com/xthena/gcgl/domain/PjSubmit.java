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
 * PjSubmit entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_submit"
    ,catalog="xhf"
)

public class PjSubmit  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fjiangx;
     private String fry;
     private Date fsubdate;
     private Long fyijiaorenid;
     private String fmemo;
     private String fyijiaoren;


    // Constructors

    /** default constructor */
    public PjSubmit() {
    }

    
    /** full constructor */
    public PjSubmit(Long fxmid, String fjiangx, String fry, Date fsubdate, Long fyijiaorenid, String fmemo, String fyijiaoren) {
        this.fxmid = fxmid;
        this.fjiangx = fjiangx;
        this.fry = fry;
        this.fsubdate = fsubdate;
        this.fyijiaorenid = fyijiaorenid;
        this.fmemo = fmemo;
        this.fyijiaoren = fyijiaoren;
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
    
    @Column(name="fjiangx", length=64)

    public String getFjiangx() {
        return this.fjiangx;
    }
    
    public void setFjiangx(String fjiangx) {
        this.fjiangx = fjiangx;
    }
    
    @Column(name="fry", length=500)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fsubdate", length=10)

    public Date getFsubdate() {
        return this.fsubdate;
    }
    
    public void setFsubdate(Date fsubdate) {
        this.fsubdate = fsubdate;
    }
    
    @Column(name="fyijiaorenid")

    public Long getFyijiaorenid() {
        return this.fyijiaorenid;
    }
    
    public void setFyijiaorenid(Long fyijiaorenid) {
        this.fyijiaorenid = fyijiaorenid;
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
   








}