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
 * PjHuiyi entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_huiyi"
    ,catalog="xhf"
)

public class PjHuiyi  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fhyname;
     private Date fhydate;
     private String fhyaddr;
     private String fhyyc;
     private String fhyjy;
     private String fqdbname;
     private String fycname;
     private String fycurl;
     private String fqdburl;
     private String fhuiytype;


    // Constructors

    /** default constructor */
    public PjHuiyi() {
    }

    
    /** full constructor */
    public PjHuiyi(String fhyname, Date fhydate, String fhyaddr, String fhyyc, String fhyjy, String fqdbname, String fycname, String fycurl, String fqdburl, String fhuiytype) {
        this.fhyname = fhyname;
        this.fhydate = fhydate;
        this.fhyaddr = fhyaddr;
        this.fhyyc = fhyyc;
        this.fhyjy = fhyjy;
        this.fqdbname = fqdbname;
        this.fycname = fycname;
        this.fycurl = fycurl;
        this.fqdburl = fqdburl;
        this.fhuiytype = fhuiytype;
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
    
    @Column(name="fhyname", length=64)

    public String getFhyname() {
        return this.fhyname;
    }
    
    public void setFhyname(String fhyname) {
        this.fhyname = fhyname;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fhydate", length=10)

    public Date getFhydate() {
        return this.fhydate;
    }
    
    public void setFhydate(Date fhydate) {
        this.fhydate = fhydate;
    }
    
    @Column(name="fhyaddr", length=64)

    public String getFhyaddr() {
        return this.fhyaddr;
    }
    
    public void setFhyaddr(String fhyaddr) {
        this.fhyaddr = fhyaddr;
    }
    
    @Column(name="fhyyc", length=500)

    public String getFhyyc() {
        return this.fhyyc;
    }
    
    public void setFhyyc(String fhyyc) {
        this.fhyyc = fhyyc;
    }
    
    @Column(name="fhyjy", length=500)

    public String getFhyjy() {
        return this.fhyjy;
    }
    
    public void setFhyjy(String fhyjy) {
        this.fhyjy = fhyjy;
    }
    
    @Column(name="fqdbname", length=64)

    public String getFqdbname() {
        return this.fqdbname;
    }
    
    public void setFqdbname(String fqdbname) {
        this.fqdbname = fqdbname;
    }
    
    @Column(name="fycname", length=64)

    public String getFycname() {
        return this.fycname;
    }
    
    public void setFycname(String fycname) {
        this.fycname = fycname;
    }
    
    @Column(name="fycurl", length=500)

    public String getFycurl() {
        return this.fycurl;
    }
    
    public void setFycurl(String fycurl) {
        this.fycurl = fycurl;
    }
    
    @Column(name="fqdburl", length=500)

    public String getFqdburl() {
        return this.fqdburl;
    }
    
    public void setFqdburl(String fqdburl) {
        this.fqdburl = fqdburl;
    }
    
    @Column(name="fhuiytype", length=64)

    public String getFhuiytype() {
        return this.fhuiytype;
    }
    
    public void setFhuiytype(String fhuiytype) {
        this.fhuiytype = fhuiytype;
    }
   








}