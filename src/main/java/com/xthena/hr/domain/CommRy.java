package com.xthena.hr.domain;
// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * CommRy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="v_commry_order_name" ,catalog="xhf")
//@SecondaryTable(name="v_commry_order_name")
//@Table(name="t_common_ry"
//    ,catalog="xhf"
//)

public class CommRy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long userid;
     private String fcardno;
     private Integer fsex;
     private Date fbirdate;
     private String fidno;
     private Integer fismarry;
     private Integer fischildren;
     private String faddress;
     private String fbiraddress;
     private String fname;
     private String ftel;
     private String femail;
     private String fbankcode;
     private String fbank;
     private Date frzdate;
     private String fminzu;
     private Integer fzzmm;
     private Date fjobdate;
     private String fxueli;
     private String fxueli2;
     private Date fbydate;
     private String fzhuanye;
     private String flastjob;
     private String fobjyear;
     private Long fjobid;
     private String fbyyx;
     private String fpicurl;
     private String fcontact;
     private String fcontguanxi;
     private String fconttel;
     private String fjbgz;
     private String fgyxz;
     private String fprovince;
     private String fcity;
     private Date flzdate;
     private String ffzwz;


    // Constructors

    /** default constructor */
    public CommRy() {
    }

    
    /** full constructor */
    public CommRy(Long userid, String fcardno, Integer fsex, Date fbirdate, String fidno, Integer fismarry, Integer fischildren, String faddress, String fbiraddress, String fname, String ftel, String femail, String fbankcode, String fbank, Date frzdate, String fminzu, Integer fzzmm, Date fjobdate, String fxueli, String fxueli2, Date fbydate, String fzhuanye, String flastjob, String fobjyear, Long fjobid, String fbyyx, String fpicurl, String fcontact, String fcontguanxi, String fconttel, String fjbgz, String fgyxz, String fprovince, String fcity, Date flzdate, String ffzwz) {
        this.userid = userid;
        this.fcardno = fcardno;
        this.fsex = fsex;
        this.fbirdate = fbirdate;
        this.fidno = fidno;
        this.fismarry = fismarry;
        this.fischildren = fischildren;
        this.faddress = faddress;
        this.fbiraddress = fbiraddress;
        this.fname = fname;
        this.ftel = ftel;
        this.femail = femail;
        this.fbankcode = fbankcode;
        this.fbank = fbank;
        this.frzdate = frzdate;
        this.fminzu = fminzu;
        this.fzzmm = fzzmm;
        this.fjobdate = fjobdate;
        this.fxueli = fxueli;
        this.fxueli2 = fxueli2;
        this.fbydate = fbydate;
        this.fzhuanye = fzhuanye;
        this.flastjob = flastjob;
        this.fobjyear = fobjyear;
        this.fjobid = fjobid;
        this.fbyyx = fbyyx;
        this.fpicurl = fpicurl;
        this.fcontact = fcontact;
        this.fcontguanxi = fcontguanxi;
        this.fconttel = fconttel;
        this.fjbgz = fjbgz;
        this.fgyxz = fgyxz;
        this.fprovince = fprovince;
        this.fcity = fcity;
        this.flzdate = flzdate;
        this.ffzwz = ffzwz;
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
    
    @Column(name="userid")

    public Long getUserid() {
        return this.userid;
    }
    
    public void setUserid(Long userid) {
        this.userid = userid;
    }
    
    @Column(name="fcardno", length=64)

    public String getFcardno() {
        return this.fcardno;
    }
    
    public void setFcardno(String fcardno) {
        this.fcardno = fcardno;
    }
    
    @Column(name="fsex")

    public Integer getFsex() {
        return this.fsex;
    }
    
    public void setFsex(Integer fsex) {
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
    
    @Column(name="fidno", length=64)

    public String getFidno() {
        return this.fidno;
    }
    
    public void setFidno(String fidno) {
        this.fidno = fidno;
    }
    
    @Column(name="fismarry")

    public Integer getFismarry() {
        return this.fismarry;
    }
    
    public void setFismarry(Integer fismarry) {
        this.fismarry = fismarry;
    }
    
    @Column(name="fischildren")

    public Integer getFischildren() {
        return this.fischildren;
    }
    
    public void setFischildren(Integer fischildren) {
        this.fischildren = fischildren;
    }
    
    @Column(name="faddress", length=128)

    public String getFaddress() {
        return this.faddress;
    }
    
    public void setFaddress(String faddress) {
        this.faddress = faddress;
    }
    
    @Column(name="fbiraddress", length=128)

    public String getFbiraddress() {
        return this.fbiraddress;
    }
    
    public void setFbiraddress(String fbiraddress) {
        this.fbiraddress = fbiraddress;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="ftel", length=64)

    public String getFtel() {
        return this.ftel;
    }
    
    public void setFtel(String ftel) {
        this.ftel = ftel;
    }
    
    @Column(name="femail", length=64)

    public String getFemail() {
        return this.femail;
    }
    
    public void setFemail(String femail) {
        this.femail = femail;
    }
    
    @Column(name="fbankcode", length=64)

    public String getFbankcode() {
        return this.fbankcode;
    }
    
    public void setFbankcode(String fbankcode) {
        this.fbankcode = fbankcode;
    }
    
    @Column(name="fbank", length=64)

    public String getFbank() {
        return this.fbank;
    }
    
    public void setFbank(String fbank) {
        this.fbank = fbank;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="frzdate", length=10)

    public Date getFrzdate() {
        return this.frzdate;
    }
    
    public void setFrzdate(Date frzdate) {
        this.frzdate = frzdate;
    }
    
    @Column(name="fminzu", length=64)

    public String getFminzu() {
        return this.fminzu;
    }
    
    public void setFminzu(String fminzu) {
        this.fminzu = fminzu;
    }
    
    @Column(name="fzzmm")

    public Integer getFzzmm() {
        return this.fzzmm;
    }
    
    public void setFzzmm(Integer fzzmm) {
        this.fzzmm = fzzmm;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjobdate", length=10)

    public Date getFjobdate() {
        return this.fjobdate;
    }
    
    public void setFjobdate(Date fjobdate) {
        this.fjobdate = fjobdate;
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
    @Temporal(TemporalType.DATE)
    @Column(name="fbydate", length=10)

    public Date getFbydate() {
        return this.fbydate;
    }
    
    public void setFbydate(Date fbydate) {
        this.fbydate = fbydate;
    }
    
    @Column(name="fzhuanye", length=64)

    public String getFzhuanye() {
        return this.fzhuanye;
    }
    
    public void setFzhuanye(String fzhuanye) {
        this.fzhuanye = fzhuanye;
    }
    
    @Column(name="flastjob", length=64)

    public String getFlastjob() {
        return this.flastjob;
    }
    
    public void setFlastjob(String flastjob) {
        this.flastjob = flastjob;
    }
    
    @Column(name="fobjyear", length=64)

    public String getFobjyear() {
        return this.fobjyear;
    }
    
    public void setFobjyear(String fobjyear) {
        this.fobjyear = fobjyear;
    }
    
    @Column(name="fjobid")

    public Long getFjobid() {
        return this.fjobid;
    }
    
    public void setFjobid(Long fjobid) {
        this.fjobid = fjobid;
    }
    
    @Column(name="fbyyx", length=64)

    public String getFbyyx() {
        return this.fbyyx;
    }
    
    public void setFbyyx(String fbyyx) {
        this.fbyyx = fbyyx;
    }
    
    @Column(name="fpicurl", length=512)

    public String getFpicurl() {
        return this.fpicurl;
    }
    
    public void setFpicurl(String fpicurl) {
        this.fpicurl = fpicurl;
    }
    
    @Column(name="fcontact", length=64)

    public String getFcontact() {
        return this.fcontact;
    }
    
    public void setFcontact(String fcontact) {
        this.fcontact = fcontact;
    }
    
    @Column(name="fcontguanxi", length=64)

    public String getFcontguanxi() {
        return this.fcontguanxi;
    }
    
    public void setFcontguanxi(String fcontguanxi) {
        this.fcontguanxi = fcontguanxi;
    }
    
    @Column(name="fconttel", length=64)

    public String getFconttel() {
        return this.fconttel;
    }
    
    public void setFconttel(String fconttel) {
        this.fconttel = fconttel;
    }
    
    @Column(name="fjbgz", length=64)

    public String getFjbgz() {
        return this.fjbgz;
    }
    
    public void setFjbgz(String fjbgz) {
        this.fjbgz = fjbgz;
    }
    
    @Column(name="fgyxz", length=64)

    public String getFgyxz() {
        return this.fgyxz;
    }
    
    public void setFgyxz(String fgyxz) {
        this.fgyxz = fgyxz;
    }
    
    @Column(name="fprovince", length=20)

    public String getFprovince() {
        return this.fprovince;
    }
    
    public void setFprovince(String fprovince) {
        this.fprovince = fprovince;
    }
    
    @Column(name="fcity", length=20)

    public String getFcity() {
        return this.fcity;
    }
    
    public void setFcity(String fcity) {
        this.fcity = fcity;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flzdate", length=10)

    public Date getFlzdate() {
        return this.flzdate;
    }
    
    public void setFlzdate(Date flzdate) {
        this.flzdate = flzdate;
    }
    
    @Column(name="ffzwz", length=64)

    public String getFfzwz() {
        return this.ffzwz;
    }
    
    public void setFfzwz(String ffzwz) {
        this.ffzwz = ffzwz;
    }
   








}