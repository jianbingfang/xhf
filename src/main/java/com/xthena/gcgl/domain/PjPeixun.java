package com.xthena.gcgl.domain;
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
 * PjPeixun entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_peixun"
    ,catalog="xhf"
)

public class PjPeixun  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fpxzt;
     private Date fpxdate;
     private String fpxaddr;
     private String fzhuchiren;
     private String fpxtype;
     private String fpxmethod;
     private Long frs;
     private String frylist;
     private String fziliaoname;
     private String fziliaourl;
     private String fpxno;
     private String fcontent;


    // Constructors

    /** default constructor */
    public PjPeixun() {
    }

    
    /** full constructor */
    public PjPeixun(String fpxzt, Date fpxdate, String fpxaddr, String fzhuchiren, String fpxtype, String fpxmethod, Long frs, String frylist, String fziliaoname, String fziliaourl, String fpxno, String fcontent) {
        this.fpxzt = fpxzt;
        this.fpxdate = fpxdate;
        this.fpxaddr = fpxaddr;
        this.fzhuchiren = fzhuchiren;
        this.fpxtype = fpxtype;
        this.fpxmethod = fpxmethod;
        this.frs = frs;
        this.frylist = frylist;
        this.fziliaoname = fziliaoname;
        this.fziliaourl = fziliaourl;
        this.fpxno = fpxno;
        this.fcontent = fcontent;
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
    
    @Column(name="fpxzt", length=64)

    public String getFpxzt() {
        return this.fpxzt;
    }
    
    public void setFpxzt(String fpxzt) {
        this.fpxzt = fpxzt;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fpxdate", length=10)

    public Date getFpxdate() {
        return this.fpxdate;
    }
    
    public void setFpxdate(Date fpxdate) {
        this.fpxdate = fpxdate;
    }
    
    @Column(name="fpxaddr", length=64)

    public String getFpxaddr() {
        return this.fpxaddr;
    }
    
    public void setFpxaddr(String fpxaddr) {
        this.fpxaddr = fpxaddr;
    }
    
    @Column(name="fzhuchiren", length=64)

    public String getFzhuchiren() {
        return this.fzhuchiren;
    }
    
    public void setFzhuchiren(String fzhuchiren) {
        this.fzhuchiren = fzhuchiren;
    }
    
    @Column(name="fpxtype", length=64)

    public String getFpxtype() {
        return this.fpxtype;
    }
    
    public void setFpxtype(String fpxtype) {
        this.fpxtype = fpxtype;
    }
    
    @Column(name="fpxmethod", length=64)

    public String getFpxmethod() {
        return this.fpxmethod;
    }
    
    public void setFpxmethod(String fpxmethod) {
        this.fpxmethod = fpxmethod;
    }
    
    @Column(name="frs")

    public Long getFrs() {
        return this.frs;
    }
    
    public void setFrs(Long frs) {
        this.frs = frs;
    }
    
    @Column(name="frylist", length=500)

    public String getFrylist() {
        return this.frylist;
    }
    
    public void setFrylist(String frylist) {
        this.frylist = frylist;
    }
    
    @Column(name="fziliaoname", length=64)

    public String getFziliaoname() {
        return this.fziliaoname;
    }
    
    public void setFziliaoname(String fziliaoname) {
        this.fziliaoname = fziliaoname;
    }
    
    @Column(name="fziliaourl", length=500)

    public String getFziliaourl() {
        return this.fziliaourl;
    }
    
    public void setFziliaourl(String fziliaourl) {
        this.fziliaourl = fziliaourl;
    }
    
    @Column(name="fpxno", length=64)

    public String getFpxno() {
        return this.fpxno;
    }
    
    public void setFpxno(String fpxno) {
        this.fpxno = fpxno;
    }
    
    @Column(name="fcontent", length=4000)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
   








}