package com.xthena.common.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommCfildsType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_cfileds_type"
    ,catalog="xhf"
)

public class CommCfildsType  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcode;
     private String fname;
     private Long fpid;
     private String ftname;


    // Constructors

    /** default constructor */
    public CommCfildsType() {
    }

    
    /** full constructor */
    public CommCfildsType(String fcode, String fname, Long fpid, String ftname) {
        this.fcode = fcode;
        this.fname = fname;
        this.fpid = fpid;
        this.ftname = ftname;
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
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fpid")

    public Long getFpid() {
        return this.fpid;
    }
    
    public void setFpid(Long fpid) {
        this.fpid = fpid;
    }
    
    @Column(name="ftname", length=64)

    public String getFtname() {
        return this.ftname;
    }
    
    public void setFtname(String ftname) {
        this.ftname = ftname;
    }
   








}