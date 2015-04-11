package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjFirstList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_first_list"
    ,catalog="xhf"
)

public class PjFirstList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcheckcode;
     private String fcheckname;
     private String fcheckresult;
     private String fcheckinfo;
     private String fiswarn;


    // Constructors

    /** default constructor */
    public PjFirstList() {
    }

    
    /** full constructor */
    public PjFirstList(String fcheckcode, String fcheckname, String fcheckresult, String fcheckinfo, String fiswarn) {
        this.fcheckcode = fcheckcode;
        this.fcheckname = fcheckname;
        this.fcheckresult = fcheckresult;
        this.fcheckinfo = fcheckinfo;
        this.fiswarn = fiswarn;
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
    
    @Column(name="fcheckresult", length=500)

    public String getFcheckresult() {
        return this.fcheckresult;
    }
    
    public void setFcheckresult(String fcheckresult) {
        this.fcheckresult = fcheckresult;
    }
    
    @Column(name="fcheckinfo", length=500)

    public String getFcheckinfo() {
        return this.fcheckinfo;
    }
    
    public void setFcheckinfo(String fcheckinfo) {
        this.fcheckinfo = fcheckinfo;
    }
    
    @Column(name="fiswarn", length=64)

    public String getFiswarn() {
        return this.fiswarn;
    }
    
    public void setFiswarn(String fiswarn) {
        this.fiswarn = fiswarn;
    }
   








}