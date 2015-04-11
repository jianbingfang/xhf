package com.xthena.cw.domain;
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
 * Cwyingshou entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_cw_yingshou"
    ,catalog="xhf"
)

public class CwYingShou  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String finviocecode;
     private String freceiptcode;
     private Date finvoicedate;
     private Date fdzdate;
     private Double fdebit;
     private Double fcreditor;
     private Long foprator;
     private Long fqmmoney;
     private String fhjjdfx;
     private String fhjje;
     private Double fsjzsr;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fopratorname;


    // Constructors

    /** default constructor */
    public CwYingShou() {
    }

    
    /** full constructor */
    public CwYingShou(Long fxmid, String finviocecode, String freceiptcode, Date finvoicedate, Date fdzdate, Double fdebit, Double fcreditor, Long foprator, Long fqmmoney, String fhjjdfx, String fhjje, Double fsjzsr, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fopratorname) {
        this.fxmid = fxmid;
        this.finviocecode = finviocecode;
        this.freceiptcode = freceiptcode;
        this.finvoicedate = finvoicedate;
        this.fdzdate = fdzdate;
        this.fdebit = fdebit;
        this.fcreditor = fcreditor;
        this.foprator = foprator;
        this.fqmmoney = fqmmoney;
        this.fhjjdfx = fhjjdfx;
        this.fhjje = fhjje;
        this.fsjzsr = fsjzsr;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fopratorname = fopratorname;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="finviocecode", length=500)

    public String getFinviocecode() {
        return this.finviocecode;
    }
    
    public void setFinviocecode(String finviocecode) {
        this.finviocecode = finviocecode;
    }
    
    @Column(name="freceiptcode", length=500)

    public String getFreceiptcode() {
        return this.freceiptcode;
    }
    
    public void setFreceiptcode(String freceiptcode) {
        this.freceiptcode = freceiptcode;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="finvoicedate", length=10)

    public Date getFinvoicedate() {
        return this.finvoicedate;
    }
    
    public void setFinvoicedate(Date finvoicedate) {
        this.finvoicedate = finvoicedate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdzdate", length=10)

    public Date getFdzdate() {
        return this.fdzdate;
    }
    
    public void setFdzdate(Date fdzdate) {
        this.fdzdate = fdzdate;
    }
    
    @Column(name="fdebit", precision=20)

    public Double getFdebit() {
        return this.fdebit;
    }
    
    public void setFdebit(Double fdebit) {
        this.fdebit = fdebit;
    }
    
    @Column(name="fcreditor", precision=20)

    public Double getFcreditor() {
        return this.fcreditor;
    }
    
    public void setFcreditor(Double fcreditor) {
        this.fcreditor = fcreditor;
    }
    
    @Column(name="foprator")

    public Long getFoprator() {
        return this.foprator;
    }
    
    public void setFoprator(Long foprator) {
        this.foprator = foprator;
    }
    
    @Column(name="fqmmoney")

    public Long getFqmmoney() {
        return this.fqmmoney;
    }
    
    public void setFqmmoney(Long fqmmoney) {
        this.fqmmoney = fqmmoney;
    }
    
    @Column(name="fhjjdfx", length=100)

    public String getFhjjdfx() {
        return this.fhjjdfx;
    }
    
    public void setFhjjdfx(String fhjjdfx) {
        this.fhjjdfx = fhjjdfx;
    }
    
    @Column(name="fhjje", length=100)

    public String getFhjje() {
        return this.fhjje;
    }
    
    public void setFhjje(String fhjje) {
        this.fhjje = fhjje;
    }
    
    @Column(name="fsjzsr", precision=20, scale=6)

    public Double getFsjzsr() {
        return this.fsjzsr;
    }
    
    public void setFsjzsr(Double fsjzsr) {
        this.fsjzsr = fsjzsr;
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
    
    @Column(name="fopratorname", length=64)

    public String getFopratorname() {
        return this.fopratorname;
    }
    
    public void setFopratorname(String fopratorname) {
        this.fopratorname = fopratorname;
    }
   








}