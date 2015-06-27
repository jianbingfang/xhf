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
 * HrKs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ks"
    ,catalog="xhf"
)

public class HrKs  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fkstype;
     private Date fbmdate;
     private Date fjfdate;
     private Long fjfmoney;
     private Date fzkzdate;
     private Date fksdate;
     private String fzl;
     private String fzlurl;


    // Constructors

    /** default constructor */
    public HrKs() {
    }

    
    /** full constructor */
    public HrKs(String fkstype, Date fbmdate, Date fjfdate, Long fjfmoney, Date fzkzdate, Date fksdate, String fzl,
                String fzlurl) {
        this.fkstype = fkstype;
        this.fbmdate = fbmdate;
        this.fjfdate = fjfdate;
        this.fjfmoney = fjfmoney;
        this.fzkzdate = fzkzdate;
        this.fksdate = fksdate;
        this.fzl = fzl;
        this.fzlurl = fzlurl;
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
    
    @Column(name="fkstype")

    public String getFkstype() {
        return this.fkstype;
    }
    
    public void setFkstype(String fkstype) {
        this.fkstype = fkstype;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmdate", length=10)

    public Date getFbmdate() {
        return this.fbmdate;
    }
    
    public void setFbmdate(Date fbmdate) {
        this.fbmdate = fbmdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjfdate", length=10)

    public Date getFjfdate() {
        return this.fjfdate;
    }
    
    public void setFjfdate(Date fjfdate) {
        this.fjfdate = fjfdate;
    }
    
    @Column(name="fjfmoney")

    public Long getFjfmoney() {
        return this.fjfmoney;
    }
    
    public void setFjfmoney(Long fjfmoney) {
        this.fjfmoney = fjfmoney;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzkzdate", length=10)

    public Date getFzkzdate() {
        return this.fzkzdate;
    }
    
    public void setFzkzdate(Date fzkzdate) {
        this.fzkzdate = fzkzdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fksdate", length=10)

    public Date getFksdate() {
        return this.fksdate;
    }
    
    public void setFksdate(Date fksdate) {
        this.fksdate = fksdate;
    }
    
    @Column(name="fzl", length=256)

    public String getFzl() {
        return this.fzl;
    }
    
    public void setFzl(String fzl) {
        this.fzl = fzl;
    }
    
    @Column(name="fzlurl", length=256)

    public String getFzlurl() {
        return this.fzlurl;
    }
    
    public void setFzlurl(String fzlurl) {
        this.fzlurl = fzlurl;
    }
   








}