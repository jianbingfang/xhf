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
 * PjDc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_dc"
    ,catalog="xhf"
)

public class PjDc  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private Date fdcdate;
     private String fdcry;
     private String fdczhuti;
     private String fdccontent;


    // Constructors

    /** default constructor */
    public PjDc() {
    }

    
    /** full constructor */
    public PjDc(Long fxmid, Date fdcdate, String fdcry, String fdczhuti, String fdccontent) {
        this.fxmid = fxmid;
        this.fdcdate = fdcdate;
        this.fdcry = fdcry;
        this.fdczhuti = fdczhuti;
        this.fdccontent = fdccontent;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fdcdate", length=10)

    public Date getFdcdate() {
        return this.fdcdate;
    }
    
    public void setFdcdate(Date fdcdate) {
        this.fdcdate = fdcdate;
    }
    
    @Column(name="fdcry", length=500)

    public String getFdcry() {
        return this.fdcry;
    }
    
    public void setFdcry(String fdcry) {
        this.fdcry = fdcry;
    }
    
    @Column(name="fdczhuti", length=64)

    public String getFdczhuti() {
        return this.fdczhuti;
    }
    
    public void setFdczhuti(String fdczhuti) {
        this.fdczhuti = fdczhuti;
    }
    
    @Column(name="fdccontent", length=500)

    public String getFdccontent() {
        return this.fdccontent;
    }
    
    public void setFdccontent(String fdccontent) {
        this.fdccontent = fdccontent;
    }
   








}