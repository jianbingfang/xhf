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
 * HrKq entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_kq"
    ,catalog="xhf"
)

public class HrKq  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Date fupdatedate;
     private String fcode;
     private String fname;
     private Integer fmonth;
     private Long fmakeuserid;
     private String furl;


    // Constructors

    /** default constructor */
    public HrKq() {
    }

    
    /** full constructor */
    public HrKq(Date fupdatedate, String fcode, String fname, Integer fmonth, Long fmakeuserid, String furl) {
        this.fupdatedate = fupdatedate;
        this.fcode = fcode;
        this.fname = fname;
        this.fmonth = fmonth;
        this.fmakeuserid = fmakeuserid;
        this.furl = furl;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fupdatedate", length=10)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fmonth")

    public Integer getFmonth() {
        return this.fmonth;
    }
    
    public void setFmonth(Integer fmonth) {
        this.fmonth = fmonth;
    }
    
    @Column(name="fmakeuserid")

    public Long getFmakeuserid() {
        return this.fmakeuserid;
    }
    
    public void setFmakeuserid(Long fmakeuserid) {
        this.fmakeuserid = fmakeuserid;
    }
    
    @Column(name="furl", length=256)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
   








}