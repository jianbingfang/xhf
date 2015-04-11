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
 * JlfRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_jlfrecord"
    ,catalog="xhf"
)

public class JlfRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fhtid;
     private Long fxmid;
     private String fhtjlf;
     private Date fshouqudate;
     private String fshifoukaip;
     private Date fkaipiaodate;
     private String fshifoudaozhang;
     private Date fdaozhangdate;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fno;
     private Long fjingbanren;


    // Constructors

    /** default constructor */
    public JlfRecord() {
    }

    
    /** full constructor */
    public JlfRecord(Long fhtid, Long fxmid, String fhtjlf, Date fshouqudate, String fshifoukaip, Date fkaipiaodate, String fshifoudaozhang, Date fdaozhangdate, String fmemo, String fmemo1, String fmemo2, String fno, Long fjingbanren) {
        this.fhtid = fhtid;
        this.fxmid = fxmid;
        this.fhtjlf = fhtjlf;
        this.fshouqudate = fshouqudate;
        this.fshifoukaip = fshifoukaip;
        this.fkaipiaodate = fkaipiaodate;
        this.fshifoudaozhang = fshifoudaozhang;
        this.fdaozhangdate = fdaozhangdate;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fno = fno;
        this.fjingbanren = fjingbanren;
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
    
    @Column(name="fhtid")

    public Long getFhtid() {
        return this.fhtid;
    }
    
    public void setFhtid(Long fhtid) {
        this.fhtid = fhtid;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fhtjlf", length=64)

    public String getFhtjlf() {
        return this.fhtjlf;
    }
    
    public void setFhtjlf(String fhtjlf) {
        this.fhtjlf = fhtjlf;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fshouqudate", length=10)

    public Date getFshouqudate() {
        return this.fshouqudate;
    }
    
    public void setFshouqudate(Date fshouqudate) {
        this.fshouqudate = fshouqudate;
    }
    
    @Column(name="fshifoukaip", length=64)

    public String getFshifoukaip() {
        return this.fshifoukaip;
    }
    
    public void setFshifoukaip(String fshifoukaip) {
        this.fshifoukaip = fshifoukaip;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fkaipiaodate", length=10)

    public Date getFkaipiaodate() {
        return this.fkaipiaodate;
    }
    
    public void setFkaipiaodate(Date fkaipiaodate) {
        this.fkaipiaodate = fkaipiaodate;
    }
    
    @Column(name="fshifoudaozhang", length=64)

    public String getFshifoudaozhang() {
        return this.fshifoudaozhang;
    }
    
    public void setFshifoudaozhang(String fshifoudaozhang) {
        this.fshifoudaozhang = fshifoudaozhang;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdaozhangdate", length=10)

    public Date getFdaozhangdate() {
        return this.fdaozhangdate;
    }
    
    public void setFdaozhangdate(Date fdaozhangdate) {
        this.fdaozhangdate = fdaozhangdate;
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
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
    }
    
    @Column(name="fjingbanren")

    public Long getFjingbanren() {
        return this.fjingbanren;
    }
    
    public void setFjingbanren(Long fjingbanren) {
        this.fjingbanren = fjingbanren;
    }
   








}