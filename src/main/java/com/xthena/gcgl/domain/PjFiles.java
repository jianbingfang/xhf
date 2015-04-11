package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjFiles entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_files"
    ,catalog="xhf"
)

public class PjFiles  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fimgname;
     private String fimageurl;
     private Long fxmid;


    // Constructors

    /** default constructor */
    public PjFiles() {
    }

    
    /** full constructor */
    public PjFiles(String fimgname, String fimageurl, Long fxmid) {
        this.fimgname = fimgname;
        this.fimageurl = fimageurl;
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
    
    @Column(name="fimgname", length=64)

    public String getFimgname() {
        return this.fimgname;
    }
    
    public void setFimgname(String fimgname) {
        this.fimgname = fimgname;
    }
    
    @Column(name="fimageurl", length=500)

    public String getFimageurl() {
        return this.fimageurl;
    }
    
    public void setFimageurl(String fimageurl) {
        this.fimageurl = fimageurl;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
   








}