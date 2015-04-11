package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * WzAskList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_wz_ask_list"
    ,catalog="xhf"
)

public class WzAskList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long faskid;
     private String fwzname;
     private Long fnum;
     private String fmemo;
     private String fwzcode;
     private Long fwzid;
     private String fmemo1;
     private String fmemo2;


    // Constructors

    /** default constructor */
    public WzAskList() {
    }

    
    /** full constructor */
    public WzAskList(Long faskid, String fwzname, Long fnum, String fmemo, String fwzcode, Long fwzid, String fmemo1, String fmemo2) {
        this.faskid = faskid;
        this.fwzname = fwzname;
        this.fnum = fnum;
        this.fmemo = fmemo;
        this.fwzcode = fwzcode;
        this.fwzid = fwzid;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
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
    
    @Column(name="faskid")

    public Long getFaskid() {
        return this.faskid;
    }
    
    public void setFaskid(Long faskid) {
        this.faskid = faskid;
    }
    
    @Column(name="fwzname", length=64)

    public String getFwzname() {
        return this.fwzname;
    }
    
    public void setFwzname(String fwzname) {
        this.fwzname = fwzname;
    }
    
    @Column(name="fnum")

    public Long getFnum() {
        return this.fnum;
    }
    
    public void setFnum(Long fnum) {
        this.fnum = fnum;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fwzcode", length=64)

    public String getFwzcode() {
        return this.fwzcode;
    }
    
    public void setFwzcode(String fwzcode) {
        this.fwzcode = fwzcode;
    }
    
    @Column(name="fwzid")

    public Long getFwzid() {
        return this.fwzid;
    }
    
    public void setFwzid(Long fwzid) {
        this.fwzid = fwzid;
    }
    
    @Column(name="fmemo1", length=500)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=500)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
   








}