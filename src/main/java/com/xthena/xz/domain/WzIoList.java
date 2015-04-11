package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * WzIoList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_wz_io_list"
    ,catalog="xhf"
)

public class WzIoList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fwzid;
     private Long fnum;
     private Long fmoney;
     private String fname;
     private String fcode;
     private String funit;
     private String fwzcode;
     private Long fioid;


    // Constructors

    /** default constructor */
    public WzIoList() {
    }

    
    /** full constructor */
    public WzIoList(Long fwzid, Long fnum, Long fmoney, String fname, String fcode, String funit, String fwzcode, Long fioid) {
        this.fwzid = fwzid;
        this.fnum = fnum;
        this.fmoney = fmoney;
        this.fname = fname;
        this.fcode = fcode;
        this.funit = funit;
        this.fwzcode = fwzcode;
        this.fioid = fioid;
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
    
    @Column(name="fwzid")

    public Long getFwzid() {
        return this.fwzid;
    }
    
    public void setFwzid(Long fwzid) {
        this.fwzid = fwzid;
    }
    
    @Column(name="fnum")

    public Long getFnum() {
        return this.fnum;
    }
    
    public void setFnum(Long fnum) {
        this.fnum = fnum;
    }
    
    @Column(name="fmoney")

    public Long getFmoney() {
        return this.fmoney;
    }
    
    public void setFmoney(Long fmoney) {
        this.fmoney = fmoney;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="funit", length=64)

    public String getFunit() {
        return this.funit;
    }
    
    public void setFunit(String funit) {
        this.funit = funit;
    }
    
    @Column(name="fwzcode", length=64)

    public String getFwzcode() {
        return this.fwzcode;
    }
    
    public void setFwzcode(String fwzcode) {
        this.fwzcode = fwzcode;
    }
    
    @Column(name="fioid")

    public Long getFioid() {
        return this.fioid;
    }
    
    public void setFioid(Long fioid) {
        this.fioid = fioid;
    }
   








}