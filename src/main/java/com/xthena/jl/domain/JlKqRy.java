package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlKqRy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_kq_ry"
    ,catalog="xhf"
)

public class JlKqRy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private String fmemo;
     private Long fkqid;


    // Constructors

    /** default constructor */
    public JlKqRy() {
    }

    
    /** full constructor */
    public JlKqRy(Long fryid, String fmemo, Long fkqid) {
        this.fryid = fryid;
        this.fmemo = fmemo;
        this.fkqid = fkqid;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fkqid")

    public Long getFkqid() {
        return this.fkqid;
    }
    
    public void setFkqid(Long fkqid) {
        this.fkqid = fkqid;
    }
   








}