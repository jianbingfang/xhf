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
 * JlZjZlysbz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zl_zlysbz"
    ,catalog="xhf"
)

public class JlZjZlysbz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fjingbanrenid;
     private String fcontent;
     private Date fdate;


    // Constructors

    /** default constructor */
    public JlZjZlysbz() {
    }

    
    /** full constructor */
    public JlZjZlysbz(Long fjingbanrenid, String fcontent, Date fdate) {
        this.fjingbanrenid = fjingbanrenid;
        this.fcontent = fcontent;
        this.fdate = fdate;
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
    
    @Column(name="fjingbanrenid")

    public Long getFjingbanrenid() {
        return this.fjingbanrenid;
    }
    
    public void setFjingbanrenid(Long fjingbanrenid) {
        this.fjingbanrenid = fjingbanrenid;
    }
    
    @Column(name="fcontent", length=500)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
   








}