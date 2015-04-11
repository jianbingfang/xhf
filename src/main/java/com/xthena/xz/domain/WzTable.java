package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * WzTable entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_wz_table"
    ,catalog="xhf"
)

public class WzTable  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcode;
     private Long fkindid;
     private Long funit;
     private Long fnum;


    // Constructors

    /** default constructor */
    public WzTable() {
    }

	/** minimal constructor */
    public WzTable(String fname, String fcode) {
        this.fname = fname;
        this.fcode = fcode;
    }
    
    /** full constructor */
    public WzTable(String fname, String fcode, Long fkindid, Long funit, Long fnum) {
        this.fname = fname;
        this.fcode = fcode;
        this.fkindid = fkindid;
        this.funit = funit;
        this.fnum = fnum;
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
    
    @Column(name="fname", nullable=false, length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fcode", nullable=false, length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fkindid")

    public Long getFkindid() {
        return this.fkindid;
    }
    
    public void setFkindid(Long fkindid) {
        this.fkindid = fkindid;
    }
    
    @Column(name="funit")

    public Long getFunit() {
        return this.funit;
    }
    
    public void setFunit(Long funit) {
        this.funit = funit;
    }
    
    @Column(name="fnum")

    public Long getFnum() {
        return this.fnum;
    }
    
    public void setFnum(Long fnum) {
        this.fnum = fnum;
    }
   








}