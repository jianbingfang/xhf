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
 * HrRydb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_rydb"
    ,catalog="xhf"
)

public class HrRydb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private Long fsrcgw;
     private Long fdestgw;
     private Date fdate;
     private String fjiaojie;


    // Constructors

    /** default constructor */
    public HrRydb() {
    }

    
    /** full constructor */
    public HrRydb(Long fryid, Long fsrcgw, Long fdestgw, Date fdate, String fjiaojie) {
        this.fryid = fryid;
        this.fsrcgw = fsrcgw;
        this.fdestgw = fdestgw;
        this.fdate = fdate;
        this.fjiaojie = fjiaojie;
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
    
    @Column(name="fsrcgw")

    public Long getFsrcgw() {
        return this.fsrcgw;
    }
    
    public void setFsrcgw(Long fsrcgw) {
        this.fsrcgw = fsrcgw;
    }
    
    @Column(name="fdestgw")

    public Long getFdestgw() {
        return this.fdestgw;
    }
    
    public void setFdestgw(Long fdestgw) {
        this.fdestgw = fdestgw;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fjiaojie", length=500)

    public String getFjiaojie() {
        return this.fjiaojie;
    }
    
    public void setFjiaojie(String fjiaojie) {
        this.fjiaojie = fjiaojie;
    }
   








}