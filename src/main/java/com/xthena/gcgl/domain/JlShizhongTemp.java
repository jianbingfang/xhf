package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlShizhongTemp entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_shizhong_temp"
    ,catalog="xhf"
)

public class JlShizhongTemp  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String forder;
     private String ftype;
     private String fdoctemp;


    // Constructors

    /** default constructor */
    public JlShizhongTemp() {
    }

    
    /** full constructor */
    public JlShizhongTemp(String fname, String forder, String ftype, String fdoctemp) {
        this.fname = fname;
        this.forder = forder;
        this.ftype = ftype;
        this.fdoctemp = fdoctemp;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="forder", length=65)

    public String getForder() {
        return this.forder;
    }
    
    public void setForder(String forder) {
        this.forder = forder;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fdoctemp")

    public String getFdoctemp() {
        return this.fdoctemp;
    }
    
    public void setFdoctemp(String fdoctemp) {
        this.fdoctemp = fdoctemp;
    }
   








}