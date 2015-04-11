package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjCheckdinfe entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_check_dinfe"
    ,catalog="xhf"
)

public class PjCheckdinfe  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcheckcode;
     private String fcheckname;
     private String fresulttype;
     private String fresultselect;
     private Integer fchecktype;


    // Constructors

    /** default constructor */
    public PjCheckdinfe() {
    }

    
    /** full constructor */
    public PjCheckdinfe(String fcheckcode, String fcheckname, String fresulttype, String fresultselect, Integer fchecktype) {
        this.fcheckcode = fcheckcode;
        this.fcheckname = fcheckname;
        this.fresulttype = fresulttype;
        this.fresultselect = fresultselect;
        this.fchecktype = fchecktype;
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
    
    @Column(name="fcheckcode", length=64)

    public String getFcheckcode() {
        return this.fcheckcode;
    }
    
    public void setFcheckcode(String fcheckcode) {
        this.fcheckcode = fcheckcode;
    }
    
    @Column(name="fcheckname", length=64)

    public String getFcheckname() {
        return this.fcheckname;
    }
    
    public void setFcheckname(String fcheckname) {
        this.fcheckname = fcheckname;
    }
    
    @Column(name="fresulttype", length=64)

    public String getFresulttype() {
        return this.fresulttype;
    }
    
    public void setFresulttype(String fresulttype) {
        this.fresulttype = fresulttype;
    }
    
    @Column(name="fresultselect", length=64)

    public String getFresultselect() {
        return this.fresultselect;
    }
    
    public void setFresultselect(String fresultselect) {
        this.fresultselect = fresultselect;
    }
    
    @Column(name="fchecktype")

    public Integer getFchecktype() {
        return this.fchecktype;
    }
    
    public void setFchecktype(Integer fchecktype) {
        this.fchecktype = fchecktype;
    }
   








}