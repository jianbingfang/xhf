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
 * PjYqcheck entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_yqcheck"
    ,catalog="xhf"
)

public class PjYqcheck  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fyiqicode;
     private Date fcheckdate;
     private String fcheckresult;
     private String fjingshouren;
     private Long fjingshourenid;


    // Constructors

    /** default constructor */
    public PjYqcheck() {
    }

    
    /** full constructor */
    public PjYqcheck(String fyiqicode, Date fcheckdate, String fcheckresult, String fjingshouren, Long fjingshourenid) {
        this.fyiqicode = fyiqicode;
        this.fcheckdate = fcheckdate;
        this.fcheckresult = fcheckresult;
        this.fjingshouren = fjingshouren;
        this.fjingshourenid = fjingshourenid;
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
    
    @Column(name="fyiqicode", length=64)

    public String getFyiqicode() {
        return this.fyiqicode;
    }
    
    public void setFyiqicode(String fyiqicode) {
        this.fyiqicode = fyiqicode;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcheckdate", length=10)

    public Date getFcheckdate() {
        return this.fcheckdate;
    }
    
    public void setFcheckdate(Date fcheckdate) {
        this.fcheckdate = fcheckdate;
    }
    
    @Column(name="fcheckresult", length=500)

    public String getFcheckresult() {
        return this.fcheckresult;
    }
    
    public void setFcheckresult(String fcheckresult) {
        this.fcheckresult = fcheckresult;
    }
    
    @Column(name="fjingshouren", length=64)

    public String getFjingshouren() {
        return this.fjingshouren;
    }
    
    public void setFjingshouren(String fjingshouren) {
        this.fjingshouren = fjingshouren;
    }
    
    @Column(name="fjingshourenid")

    public Long getFjingshourenid() {
        return this.fjingshourenid;
    }
    
    public void setFjingshourenid(Long fjingshourenid) {
        this.fjingshourenid = fjingshourenid;
    }
   








}