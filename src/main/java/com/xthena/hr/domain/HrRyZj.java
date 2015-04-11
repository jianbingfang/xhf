package com.xthena.hr.domain;
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

import com.xthena.xz.manager.Zj;


/**
 * HrRyZj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ry_zj"
    ,catalog="xhf"
)

public class HrRyZj  implements java.io.Serializable,Zj {


    // Fields    

     private Long fid;
     private Date fyxqks;
     private Date fyxjs;
     private Long userid;
     private String fstatus;
     private String fwz;
     private String fname;
     private String fzhuanye;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fmemo5;
     private Date flingqudate;
     private String fzhengjianno;
     private String fstatus2;
     private String fzcno;


    // Constructors

    /** default constructor */
    public HrRyZj() {
    }

    
    /** full constructor */
    public HrRyZj(Date fyxqks, Date fyxjs, Long userid, String fstatus, String fwz, String fname, String fzhuanye, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fzcno,String fmemo4, String fmemo5, Date flingqudate, String fzhengjianno, String fstatus2) {
        this.fyxqks = fyxqks;
        this.fyxjs = fyxjs;
        this.userid = userid;
        this.fstatus = fstatus;
        this.fwz = fwz;
        this.fname = fname;
        this.fzhuanye = fzhuanye;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
        this.flingqudate = flingqudate;
        this.fzhengjianno = fzhengjianno;
        this.fstatus2 = fstatus2;
        this.fzcno = fzcno;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fyxqks")

    public Date getFyxqks() {
        return this.fyxqks;
    }
    
    public void setFyxqks(Date fyxqks) {
        this.fyxqks = fyxqks;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fyxjs")

    public Date getFyxjs() {
        return this.fyxjs;
    }
    
    public void setFyxjs(Date fyxjs) {
        this.fyxjs = fyxjs;
    }
    
    @Column(name="userid")

    public Long getUserid() {
        return this.userid;
    }
    
    public void setUserid(Long userid) {
        this.userid = userid;
    }
    
    @Column(name="fstatus")

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fwz", length=128)

    public String getFwz() {
        return this.fwz;
    }
    
    public void setFwz(String fwz) {
        this.fwz = fwz;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fzhuanye", length=64)

    public String getFzhuanye() {
        return this.fzhuanye;
    }
    
    public void setFzhuanye(String fzhuanye) {
        this.fzhuanye = fzhuanye;
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
    
    @Column(name="fmemo4", length=64)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="fmemo5", length=64)

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flingqudate", length=10)

    public Date getFlingqudate() {
        return this.flingqudate;
    }
    
    public void setFlingqudate(Date flingqudate) {
        this.flingqudate = flingqudate;
    }
    
    @Column(name="fzhengjianno", length=64)

    public String getFzhengjianno() {
        return this.fzhengjianno;
    }
    
    public void setFzhengjianno(String fzhengjianno) {
        this.fzhengjianno = fzhengjianno;
    }
    
    @Column(name="fstatus2", length=64)

    public String getFstatus2() {
        return this.fstatus2;
    }
    
    public void setFstatus2(String fstatus2) {
        this.fstatus2 = fstatus2;
    }

    @Column(name="fzcno", length=64)
	public String getFzcno() {
		return fzcno;
	}


	public void setFzcno(String fzcno) {
		this.fzcno = fzcno;
	}
   








}