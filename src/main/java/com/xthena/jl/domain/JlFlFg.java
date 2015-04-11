package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlFlFg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_flfg"
    ,catalog="xhf"
)

public class JlFlFg  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftype;
     private String fname;
     private String furl;
     private String fmemo;
     private String fisshow;
     private String forder;
     private String content;


    // Constructors

    /** default constructor */
    public JlFlFg() {
    }

    
    /** full constructor */
    public JlFlFg(String ftype, String fname, String furl, String fmemo, String fisshow, String forder, String content) {
        this.ftype = ftype;
        this.fname = fname;
        this.furl = furl;
        this.fmemo = fmemo;
        this.fisshow = fisshow;
        this.forder = forder;
        this.content = content;
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
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fname", length=128)

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
    
    @Column(name="fmemo", length=512)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fisshow", length=16)

    public String getFisshow() {
        return this.fisshow;
    }
    
    public void setFisshow(String fisshow) {
        this.fisshow = fisshow;
    }
    
    @Column(name="forder", length=8)

    public String getForder() {
        return this.forder;
    }
    
    public void setForder(String forder) {
        this.forder = forder;
    }
    
    @Column(name="content", length=65535)

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
   








}