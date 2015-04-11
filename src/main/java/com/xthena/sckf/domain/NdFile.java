package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * NdFile entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_ndfile"
    ,catalog="xhf"
)

public class NdFile  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ffilename;
     private Long fyear;
     private String ffileurl;


    // Constructors

    /** default constructor */
    public NdFile() {
    }

    
    /** full constructor */
    public NdFile(String ffilename, Long fyear, String ffileurl) {
        this.ffilename = ffilename;
        this.fyear = fyear;
        this.ffileurl = ffileurl;
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
    
    @Column(name="ffilename", length=500)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="fyear")

    public Long getFyear() {
        return this.fyear;
    }
    
    public void setFyear(Long fyear) {
        this.fyear = fyear;
    }
    
    @Column(name="ffileurl", length=500)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
   








}