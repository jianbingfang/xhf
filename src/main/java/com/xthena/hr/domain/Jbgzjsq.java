package com.xthena.hr.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;


/**
 * HrKq entity. @author MyEclipse Persistence Tools
 */
@Entity


public class Jbgzjsq  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fxueli;//学历
     private String fbyz;//毕业证
     private String fgyxz;//雇佣性质
     private Date fbysj;//毕业时间
     private Number fjbgzje;///基本工资金额


    // Constructors

    /** default constructor */
    public Jbgzjsq() {
    }

    
  /*  *//** full constructor *//*
    public Jbgzjsq(Date fupdatedate, String fcode, Long fname, Integer fmonth, String fmakeuserid, String furl) {
        this.fupdatedate = fupdatedate;
        this.fcode = fcode;
        this.fname = fname;
        this.fmonth = fmonth;
        this.fmakeuserid = fmakeuserid;
        this.furl = furl;
    }*/

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="fid", unique=true, nullable=false)

    public Long getFid() {
        return this.fid;
    }
    
    public void setFid(Long fid) {
        this.fid = fid;
    }
  //  @Temporal(TemporalType.DATE)


  /*  public Date getFupdatedate() {
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
    
    @Column(name="fname")

    public Long getFname() {
        return this.fname;
    }
    
    public void setFname(Long fname) {
        this.fname = fname;
    }
    
    @Column(name="fmonth")

    public Integer getFmonth() {
        return this.fmonth;
    }
    
    public void setFmonth(Integer fmonth) {
        this.fmonth = fmonth;
    }
    
    @Column(name="fmakeuserid", length=64)

    public String getFmakeuserid() {
        return this.fmakeuserid;
    }
    
    public void setFmakeuserid(String fmakeuserid) {
        this.fmakeuserid = fmakeuserid;
    }
    
    @Column(name="furl", length=256)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
   

*/






}