package com.xthena.jl.domain;
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
 * JlZjXczbrecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zl_xczbrecord"
    ,catalog="xhf"
)

public class JlZjXczbrecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fyanshoubz;
     private String fyanshouresult;
     private Date fdate;


    // Constructors

    /** default constructor */
    public JlZjXczbrecord() {
    }

    
    /** full constructor */
    public JlZjXczbrecord(String fyanshoubz, String fyanshouresult, Date fdate) {
        this.fyanshoubz = fyanshoubz;
        this.fyanshouresult = fyanshouresult;
        this.fdate = fdate;
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
    
    @Column(name="fyanshoubz", length=4096)

    public String getFyanshoubz() {
        return this.fyanshoubz;
    }
    
    public void setFyanshoubz(String fyanshoubz) {
        this.fyanshoubz = fyanshoubz;
    }
    
    @Column(name="fyanshouresult", length=512)

    public String getFyanshouresult() {
        return this.fyanshouresult;
    }
    
    public void setFyanshouresult(String fyanshouresult) {
        this.fyanshouresult = fyanshouresult;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
   








}