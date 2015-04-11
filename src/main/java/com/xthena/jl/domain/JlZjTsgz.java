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
 * JlZjTsgz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zl_tsgz"
    ,catalog="xhf"
)

public class JlZjTsgz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fno;
     private String fname;
     private String fgongz;
     private String fzjcode;
     private Date fexpdate;
     private String fmemo;


    // Constructors

    /** default constructor */
    public JlZjTsgz() {
    }

    
    /** full constructor */
    public JlZjTsgz(String fno, String fname, String fgongz, String fzjcode, Date fexpdate, String fmemo) {
        this.fno = fno;
        this.fname = fname;
        this.fgongz = fgongz;
        this.fzjcode = fzjcode;
        this.fexpdate = fexpdate;
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
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fgongz", length=64)

    public String getFgongz() {
        return this.fgongz;
    }
    
    public void setFgongz(String fgongz) {
        this.fgongz = fgongz;
    }
    
    @Column(name="fzjcode", length=64)

    public String getFzjcode() {
        return this.fzjcode;
    }
    
    public void setFzjcode(String fzjcode) {
        this.fzjcode = fzjcode;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fexpdate", length=10)

    public Date getFexpdate() {
        return this.fexpdate;
    }
    
    public void setFexpdate(Date fexpdate) {
        this.fexpdate = fexpdate;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}