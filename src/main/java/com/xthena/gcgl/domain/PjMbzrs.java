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
 * PjMbzrs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_mbzes"
    ,catalog="xhf"
)

public class PjMbzrs  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private Long fryid;
     private Date fdate;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjMbzrs() {
    }

    
    /** full constructor */
    public PjMbzrs(Long fxmid, Long fryid, Date fdate, String fmemo) {
        this.fxmid = fxmid;
        this.fryid = fryid;
        this.fdate = fdate;
        this.fmemo = fmemo;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fmemo", length=512)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}