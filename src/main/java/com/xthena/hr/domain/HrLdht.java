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
 * HrLdht entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ldht"
    ,catalog="xhf"
)

public class HrLdht  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private Long fzw;
     private Integer fht;
     private Long fdept;
     private String fmoney;
     private Date fsystart;
     private Date fsyend;
     private Date fhtstart;
     private Date fhtend;
     private String fmemo;
     private String fcode;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fmemo5;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public HrLdht() {
    }

    
    /** full constructor */
    public HrLdht(Long fryid, Long fzw, Integer fht, Long fdept, String fmoney, Date fsystart, Date fsyend, Date fhtstart, Date fhtend, String fmemo, String fcode, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fmemo5, Date fcreatedate) {
        this.fryid = fryid;
        this.fzw = fzw;
        this.fht = fht;
        this.fdept = fdept;
        this.fmoney = fmoney;
        this.fsystart = fsystart;
        this.fsyend = fsyend;
        this.fhtstart = fhtstart;
        this.fhtend = fhtend;
        this.fmemo = fmemo;
        this.fcode = fcode;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fzw")

    public Long getFzw() {
        return this.fzw;
    }
    
    public void setFzw(Long fzw) {
        this.fzw = fzw;
    }
    
    @Column(name="fht")

    public Integer getFht() {
        return this.fht;
    }
    
    public void setFht(Integer fht) {
        this.fht = fht;
    }
    
    @Column(name="fdept")

    public Long getFdept() {
        return this.fdept;
    }
    
    public void setFdept(Long fdept) {
        this.fdept = fdept;
    }
    
    @Column(name="fmoney", length=64)

    public String getFmoney() {
        return this.fmoney;
    }
    
    public void setFmoney(String fmoney) {
        this.fmoney = fmoney;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fsystart", length=10)

    public Date getFsystart() {
        return this.fsystart;
    }
    
    public void setFsystart(Date fsystart) {
        this.fsystart = fsystart;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fsyend", length=10)

    public Date getFsyend() {
        return this.fsyend;
    }
    
    public void setFsyend(Date fsyend) {
        this.fsyend = fsyend;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fhtstart", length=10)

    public Date getFhtstart() {
        return this.fhtstart;
    }
    
    public void setFhtstart(Date fhtstart) {
        this.fhtstart = fhtstart;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fhtend", length=10)

    public Date getFhtend() {
        return this.fhtend;
    }
    
    public void setFhtend(Date fhtend) {
        this.fhtend = fhtend;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
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
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}