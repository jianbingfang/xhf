package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrZhaopPlain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_zhaopin_plian"
    ,catalog="xhf"
)

public class HrZhaopPlain  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fdept;
     private String fgw;
     private String fzhiwu;
     private Integer fcurnum;
     private Integer fplainnum;
     private String frytiaozheng;
     private String fgwzhize;
     private String fgwyaoqiu;
     private String fshenpistatus;


    // Constructors

    /** default constructor */
    public HrZhaopPlain() {
    }

    
    /** full constructor */
    public HrZhaopPlain(Long fdept, String fgw, String fzhiwu, Integer fcurnum, Integer fplainnum, String frytiaozheng, String fgwzhize, String fgwyaoqiu, String fshenpistatus) {
        this.fdept = fdept;
        this.fgw = fgw;
        this.fzhiwu = fzhiwu;
        this.fcurnum = fcurnum;
        this.fplainnum = fplainnum;
        this.frytiaozheng = frytiaozheng;
        this.fgwzhize = fgwzhize;
        this.fgwyaoqiu = fgwyaoqiu;
        this.fshenpistatus = fshenpistatus;
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
    
    @Column(name="fdept")

    public Long getFdept() {
        return this.fdept;
    }
    
    public void setFdept(Long fdept) {
        this.fdept = fdept;
    }
    
    @Column(name="fgw", length=64)

    public String getFgw() {
        return this.fgw;
    }
    
    public void setFgw(String fgw) {
        this.fgw = fgw;
    }
    
    @Column(name="fzhiwu", length=64)

    public String getFzhiwu() {
        return this.fzhiwu;
    }
    
    public void setFzhiwu(String fzhiwu) {
        this.fzhiwu = fzhiwu;
    }
    
    @Column(name="fcurnum")

    public Integer getFcurnum() {
        return this.fcurnum;
    }
    
    public void setFcurnum(Integer fcurnum) {
        this.fcurnum = fcurnum;
    }
    
    @Column(name="fplainnum")

    public Integer getFplainnum() {
        return this.fplainnum;
    }
    
    public void setFplainnum(Integer fplainnum) {
        this.fplainnum = fplainnum;
    }
    
    @Column(name="frytiaozheng", length=64)

    public String getFrytiaozheng() {
        return this.frytiaozheng;
    }
    
    public void setFrytiaozheng(String frytiaozheng) {
        this.frytiaozheng = frytiaozheng;
    }
    
    @Column(name="fgwzhize", length=500)

    public String getFgwzhize() {
        return this.fgwzhize;
    }
    
    public void setFgwzhize(String fgwzhize) {
        this.fgwzhize = fgwzhize;
    }
    
    @Column(name="fgwyaoqiu", length=500)

    public String getFgwyaoqiu() {
        return this.fgwyaoqiu;
    }
    
    public void setFgwyaoqiu(String fgwyaoqiu) {
        this.fgwyaoqiu = fgwyaoqiu;
    }
    
    @Column(name="fshenpistatus", length=64)

    public String getFshenpistatus() {
        return this.fshenpistatus;
    }
    
    public void setFshenpistatus(String fshenpistatus) {
        this.fshenpistatus = fshenpistatus;
    }
   








}