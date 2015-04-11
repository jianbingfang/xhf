package com.xthena.gcgl.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * JlDocTemplate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_template"
    ,catalog="xhf"
)

public class PjTemplate  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcode;
     private String fcontent;
     private Date fcreatedate;
     private Date fupdatedate;
     private Long fcreateuser;
     private Long fupdateuser;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;


    // Constructors

    /** default constructor */
    public PjTemplate() {
    }

    
    /** full constructor */
    public PjTemplate(String fname, String fcode, String fcontent, Date fcreatedate, Date fupdatedate, Long fcreateuser, Long fupdateuser, String fmemo, String fmemo1, String fmemo2, String fmemo3) {
        this.fname = fname;
        this.fcode = fcode;
        this.fcontent = fcontent;
        this.fcreatedate = fcreatedate;
        this.fupdatedate = fupdatedate;
        this.fcreateuser = fcreateuser;
        this.fupdateuser = fupdateuser;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
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
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fcontent", length=65535)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fupdatedate", length=10)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    
    @Column(name="fcreateuser")

    public Long getFcreateuser() {
        return this.fcreateuser;
    }
    
    public void setFcreateuser(Long fcreateuser) {
        this.fcreateuser = fcreateuser;
    }
    
    @Column(name="fupdateuser")

    public Long getFupdateuser() {
        return this.fupdateuser;
    }
    
    public void setFupdateuser(Long fupdateuser) {
        this.fupdateuser = fupdateuser;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=64)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
   








}