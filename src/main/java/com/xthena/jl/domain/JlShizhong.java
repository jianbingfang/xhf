package com.xthena.jl.domain;
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
 * JlShizhong entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_shizhong"
    ,catalog="xhf"
)

public class JlShizhong  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fno;
     private String fwarn;
     private String fwarninfo;
     private Date fuploaddate;
     private Long fuploadname;
     private Long fujianid;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private Long fxmid;
     private String fszleix;
     private String fcontent;
     private String fitem;
     private String fitemval;
     private Date fexpirydate;
     private String fastus;


    // Constructors

    /** default constructor */
    public JlShizhong() {
    }

    
    /** full constructor */
    public JlShizhong(String fno, String fwarn, String fwarninfo, Date fuploaddate, Long fuploadname, Long fujianid, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, Long fxmid, String fszleix, String fcontent, String fitem, String fitemval, Date fexpirydate, String fastus) {
        this.fno = fno;
        this.fwarn = fwarn;
        this.fwarninfo = fwarninfo;
        this.fuploaddate = fuploaddate;
        this.fuploadname = fuploadname;
        this.fujianid = fujianid;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fxmid = fxmid;
        this.fszleix = fszleix;
        this.fcontent = fcontent;
        this.fitem = fitem;
        this.fitemval = fitemval;
        this.fexpirydate = fexpirydate;
        this.fastus = fastus;
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
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
    }
    
    @Column(name="fwarn", length=64)

    public String getFwarn() {
        return this.fwarn;
    }
    
    public void setFwarn(String fwarn) {
        this.fwarn = fwarn;
    }
    
    @Column(name="fwarninfo", length=500)

    public String getFwarninfo() {
        return this.fwarninfo;
    }
    
    public void setFwarninfo(String fwarninfo) {
        this.fwarninfo = fwarninfo;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fuploaddate", length=10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }
    
    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }
    
    @Column(name="fuploadname")

    public Long getFuploadname() {
        return this.fuploadname;
    }
    
    public void setFuploadname(Long fuploadname) {
        this.fuploadname = fuploadname;
    }
    
    @Column(name="fujianid")

    public Long getFujianid() {
        return this.fujianid;
    }
    
    public void setFujianid(Long fujianid) {
        this.fujianid = fujianid;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fszleix", length=64)

    public String getFszleix() {
        return this.fszleix;
    }
    
    public void setFszleix(String fszleix) {
        this.fszleix = fszleix;
    }
    
    @Column(name="fcontent", length=65535)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="fitem", length=64)

    public String getFitem() {
        return this.fitem;
    }
    
    public void setFitem(String fitem) {
        this.fitem = fitem;
    }
    
    @Column(name="fitemval", length=64)

    public String getFitemval() {
        return this.fitemval;
    }
    
    public void setFitemval(String fitemval) {
        this.fitemval = fitemval;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fexpirydate", length=10)

    public Date getFexpirydate() {
        return this.fexpirydate;
    }
    
    public void setFexpirydate(Date fexpirydate) {
        this.fexpirydate = fexpirydate;
    }
    
    @Column(name="fastus", length=64)

    public String getFastus() {
        return this.fastus;
    }
    
    public void setFastus(String fastus) {
        this.fastus = fastus;
    }
   








}