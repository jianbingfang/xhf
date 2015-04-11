package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JyZhongbTaizhang entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_zhongb_taizhang"
    ,catalog="xhf"
)

public class JyZhongbTaizhang  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fwz;
     private Long fzbcount;
     private String fzbje;
     private String fyear;


    // Constructors

    /** default constructor */
    public JyZhongbTaizhang() {
    }

    
    /** full constructor */
    public JyZhongbTaizhang(String fwz, Long fzbcount, String fzbje, String fyear) {
        this.fwz = fwz;
        this.fzbcount = fzbcount;
        this.fzbje = fzbje;
        this.fyear = fyear;
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
    
    @Column(name="fwz", length=64)

    public String getFwz() {
        return this.fwz;
    }
    
    public void setFwz(String fwz) {
        this.fwz = fwz;
    }
    
    @Column(name="fzbcount")

    public Long getFzbcount() {
        return this.fzbcount;
    }
    
    public void setFzbcount(Long fzbcount) {
        this.fzbcount = fzbcount;
    }
    
    @Column(name="fzbje", length=64)

    public String getFzbje() {
        return this.fzbje;
    }
    
    public void setFzbje(String fzbje) {
        this.fzbje = fzbje;
    }
    
    @Column(name="fyear", length=64)

    public String getFyear() {
        return this.fyear;
    }
    
    public void setFyear(String fyear) {
        this.fyear = fyear;
    }
   








}