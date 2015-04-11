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
 * JlZjPay entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zj_pay"
    ,catalog="xhf"
)

public class JlZjPay  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fpayno;
     private String fskdw;
     private String fskmoney;
     private Long fjingshouren;
     private Date fdate;
     private String fmemo;


    // Constructors

    /** default constructor */
    public JlZjPay() {
    }

    
    /** full constructor */
    public JlZjPay(String fpayno, String fskdw, String fskmoney, Long fjingshouren, Date fdate, String fmemo) {
        this.fpayno = fpayno;
        this.fskdw = fskdw;
        this.fskmoney = fskmoney;
        this.fjingshouren = fjingshouren;
        this.fdate = fdate;
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
    
    @Column(name="fpayno", length=64)

    public String getFpayno() {
        return this.fpayno;
    }
    
    public void setFpayno(String fpayno) {
        this.fpayno = fpayno;
    }
    
    @Column(name="fskdw", length=64)

    public String getFskdw() {
        return this.fskdw;
    }
    
    public void setFskdw(String fskdw) {
        this.fskdw = fskdw;
    }
    
    @Column(name="fskmoney", length=64)

    public String getFskmoney() {
        return this.fskmoney;
    }
    
    public void setFskmoney(String fskmoney) {
        this.fskmoney = fskmoney;
    }
    
    @Column(name="fjingshouren")

    public Long getFjingshouren() {
        return this.fjingshouren;
    }
    
    public void setFjingshouren(Long fjingshouren) {
        this.fjingshouren = fjingshouren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}