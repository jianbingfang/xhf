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


/**
 * HrypRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_yingpin_record"
    ,catalog="xhf"
)

public class HrypRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fidno;
     private String fname;
     private String fsex;
     private Date fbirdate;
     private String fminzu;
     private String faddr;
     private String femail;
     private Date fbydate;
     private String fbyxuexiao;
     private String fbyzhuanye;
     private String fxueli;
     private String fxueli2;
     private Long fgw;
     private Date fdate;
     private String finfo;
     private String fworkaddr;
     private String fgzqiw;
     private String ftel;
     private String fcontact;
     private String fcontactr;
     private String fcontacttel;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrypRecord() {
    }

    
    /** full constructor */
    public HrypRecord(String fidno, String fname, String fsex, Date fbirdate, String fminzu, String faddr, String femail, Date fbydate, String fbyxuexiao, String fbyzhuanye, String fxueli, String fxueli2, Long fgw, Date fdate, String finfo, String fworkaddr, String fgzqiw, String ftel, String fcontact, String fcontactr, String fcontacttel, String fmemo) {
        this.fidno = fidno;
        this.fname = fname;
        this.fsex = fsex;
        this.fbirdate = fbirdate;
        this.fminzu = fminzu;
        this.faddr = faddr;
        this.femail = femail;
        this.fbydate = fbydate;
        this.fbyxuexiao = fbyxuexiao;
        this.fbyzhuanye = fbyzhuanye;
        this.fxueli = fxueli;
        this.fxueli2 = fxueli2;
        this.fgw = fgw;
        this.fdate = fdate;
        this.finfo = finfo;
        this.fworkaddr = fworkaddr;
        this.fgzqiw = fgzqiw;
        this.ftel = ftel;
        this.fcontact = fcontact;
        this.fcontactr = fcontactr;
        this.fcontacttel = fcontacttel;
        this.fmemo = fmemo;
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
    
    @Column(name="fidno", length=20)

    public String getFidno() {
        return this.fidno;
    }
    
    public void setFidno(String fidno) {
        this.fidno = fidno;
    }
    
    @Column(name="fname", length=20)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fsex", length=8)

    public String getFsex() {
        return this.fsex;
    }
    
    public void setFsex(String fsex) {
        this.fsex = fsex;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbirdate", length=10)

    public Date getFbirdate() {
        return this.fbirdate;
    }
    
    public void setFbirdate(Date fbirdate) {
        this.fbirdate = fbirdate;
    }
    
    @Column(name="fminzu", length=16)

    public String getFminzu() {
        return this.fminzu;
    }
    
    public void setFminzu(String fminzu) {
        this.fminzu = fminzu;
    }
    
    @Column(name="faddr", length=128)

    public String getFaddr() {
        return this.faddr;
    }
    
    public void setFaddr(String faddr) {
        this.faddr = faddr;
    }
    
    @Column(name="femail", length=128)

    public String getFemail() {
        return this.femail;
    }
    
    public void setFemail(String femail) {
        this.femail = femail;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbydate", length=10)

    public Date getFbydate() {
        return this.fbydate;
    }
    
    public void setFbydate(Date fbydate) {
        this.fbydate = fbydate;
    }
    
    @Column(name="fbyxuexiao", length=64)

    public String getFbyxuexiao() {
        return this.fbyxuexiao;
    }
    
    public void setFbyxuexiao(String fbyxuexiao) {
        this.fbyxuexiao = fbyxuexiao;
    }
    
    @Column(name="fbyzhuanye", length=64)

    public String getFbyzhuanye() {
        return this.fbyzhuanye;
    }
    
    public void setFbyzhuanye(String fbyzhuanye) {
        this.fbyzhuanye = fbyzhuanye;
    }
    
    @Column(name="fxueli", length=64)

    public String getFxueli() {
        return this.fxueli;
    }
    
    public void setFxueli(String fxueli) {
        this.fxueli = fxueli;
    }
    
    @Column(name="fxueli2", length=64)

    public String getFxueli2() {
        return this.fxueli2;
    }
    
    public void setFxueli2(String fxueli2) {
        this.fxueli2 = fxueli2;
    }
    
    @Column(name="fgw")

    public Long getFgw() {
        return this.fgw;
    }
    
    public void setFgw(Long fgw) {
        this.fgw = fgw;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="finfo", length=2000)

    public String getFinfo() {
        return this.finfo;
    }
    
    public void setFinfo(String finfo) {
        this.finfo = finfo;
    }
    
    @Column(name="fworkaddr", length=64)

    public String getFworkaddr() {
        return this.fworkaddr;
    }
    
    public void setFworkaddr(String fworkaddr) {
        this.fworkaddr = fworkaddr;
    }
    
    @Column(name="fgzqiw", length=64)

    public String getFgzqiw() {
        return this.fgzqiw;
    }
    
    public void setFgzqiw(String fgzqiw) {
        this.fgzqiw = fgzqiw;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="fcontact", length=64)

    public String getFcontact() {
        return this.fcontact;
    }
    
    public void setFcontact(String fcontact) {
        this.fcontact = fcontact;
    }
    
    @Column(name="fcontactr", length=64)

    public String getFcontactr() {
        return this.fcontactr;
    }
    
    public void setFcontactr(String fcontactr) {
        this.fcontactr = fcontactr;
    }
    
    @Column(name="fcontacttel", length=64)

    public String getFcontacttel() {
        return this.fcontacttel;
    }
    
    public void setFcontacttel(String fcontacttel) {
        this.fcontacttel = fcontacttel;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}