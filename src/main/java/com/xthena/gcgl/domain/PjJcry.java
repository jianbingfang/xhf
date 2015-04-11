package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjJcry entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_jc_ry"
    ,catalog="xhf"
)

public class PjJcry  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fjcid;
     private Long fryid;
     private String fry;


    // Constructors

    /** default constructor */
    public PjJcry() {
    }

    
    /** full constructor */
    public PjJcry(Long fjcid, Long fryid, String fry) {
        this.fjcid = fjcid;
        this.fryid = fryid;
        this.fry = fry;
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
    
    @Column(name="fjcid")

    public Long getFjcid() {
        return this.fjcid;
    }
    
    public void setFjcid(Long fjcid) {
        this.fjcid = fjcid;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fry", length=500)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
   








}