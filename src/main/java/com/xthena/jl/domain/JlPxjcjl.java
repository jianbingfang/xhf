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
 * JlTz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_pxjcjl"
    ,catalog="xhf"
)

public class JlPxjcjl  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fplatid;
     private String fcontent;
     private Date fupdatedate;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public JlPxjcjl() {
    }

    
    /** full constructor */
    public JlPxjcjl(Long fplatid, String fcontent, Date fupdatedate, Long fxmid) {
        this.fplatid = fplatid;
        this.fcontent = fcontent;
        this.fupdatedate = fupdatedate;
        this.fxmid = fxmid;
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
    
    @Column(name="fplatid")

    public Long getFplatid() {
        return this.fplatid;
    }
    
    public void setFplatid(Long fplatid) {
        this.fplatid = fplatid;
    }
    
    @Column(name="fcontent", length=16777215)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fupdatedate", length=10)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}