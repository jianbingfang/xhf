package com.xthena.common.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_menu"
    ,catalog="xhf"
)

public class CommMenu  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String furl;
     private Long fpid;
     private String fmemo;
     private Integer forder;
     private String fmenucode;


    // Constructors

    /** default constructor */
    public CommMenu() {
    }

    
    /** full constructor */
    public CommMenu(String fname, String furl, Long fpid, String fmemo, Integer forder, String fmenucode) {
        this.fname = fname;
        this.furl = furl;
        this.fpid = fpid;
        this.fmemo = fmemo;
        this.forder = forder;
        this.fmenucode = fmenucode;
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
    
    @Column(name="furl", length=512)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
    
    @Column(name="fpid")

    public Long getFpid() {
        return this.fpid;
    }
    
    public void setFpid(Long fpid) {
        this.fpid = fpid;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="forder", length=64)

    public Integer getForder() {
        return this.forder;
    }
    
    public void setForder(Integer forder) {
        this.forder = forder;
    }
    
    @Column(name="fmenucode", length=64)

    public String getFmenucode() {
        return this.fmenucode;
    }
    
    public void setFmenucode(String fmenucode) {
        this.fmenucode = fmenucode;
    }
   








}