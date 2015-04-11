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
 * PjVisit entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_visit"
    ,catalog="xhf"
)

public class PjVisit  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fvisitno;
     private Long fxmid;
     private Date fvisitdate;
     private Long fry;
     private String fhfdate;


    // Constructors

    /** default constructor */
    public PjVisit() {
    }

    
    /** full constructor */
    public PjVisit(String fvisitno, Long fxmid, Date fvisitdate, Long fry, String fhfdate) {
        this.fvisitno = fvisitno;
        this.fxmid = fxmid;
        this.fvisitdate = fvisitdate;
        this.fry = fry;
        this.fhfdate = fhfdate;
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
    
    @Column(name="fvisitno", length=64)

    public String getFvisitno() {
        return this.fvisitno;
    }
    
    public void setFvisitno(String fvisitno) {
        this.fvisitno = fvisitno;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fvisitdate", length=10)

    public Date getFvisitdate() {
        return this.fvisitdate;
    }
    
    public void setFvisitdate(Date fvisitdate) {
        this.fvisitdate = fvisitdate;
    }
    
    @Column(name="fry")

    public Long getFry() {
        return this.fry;
    }
    
    public void setFry(Long fry) {
        this.fry = fry;
    }
    
    @Column(name="fhfdate", length=500)

    public String getFhfdate() {
        return this.fhfdate;
    }
    
    public void setFhfdate(String fhfdate) {
        this.fhfdate = fhfdate;
    }
   








}