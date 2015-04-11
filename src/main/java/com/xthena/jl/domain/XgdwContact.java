package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * XgdwContact entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_xgdw_contact"
    ,catalog="xhf"
)

public class XgdwContact  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fdwname;
     private String fcontactname;
     private String ftel;
     private String fmail;
     private Long fxmid;
     private Long fdwid;


    // Constructors

    /** default constructor */
    public XgdwContact() {
    }

    
    /** full constructor */
    public XgdwContact(String fdwname, String fcontactname, String ftel, String fmail, Long fxmid, Long fdwid) {
        this.fdwname = fdwname;
        this.fcontactname = fcontactname;
        this.ftel = ftel;
        this.fmail = fmail;
        this.fxmid = fxmid;
        this.fdwid = fdwid;
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
    
    @Column(name="fdwname", length=64)

    public String getFdwname() {
        return this.fdwname;
    }
    
    public void setFdwname(String fdwname) {
        this.fdwname = fdwname;
    }
    
    @Column(name="fcontactname", length=64)

    public String getFcontactname() {
        return this.fcontactname;
    }
    
    public void setFcontactname(String fcontactname) {
        this.fcontactname = fcontactname;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="fmail", length=64)

    public String getFmail() {
        return this.fmail;
    }
    
    public void setFmail(String fmail) {
        this.fmail = fmail;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fdwid")

    public Long getFdwid() {
        return this.fdwid;
    }
    
    public void setFdwid(Long fdwid) {
        this.fdwid = fdwid;
    }
   








}