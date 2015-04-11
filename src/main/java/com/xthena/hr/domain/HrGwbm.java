package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrGwbm entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_gwbm"
    ,catalog="xhf"
)

public class HrGwbm  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fjobid;
     private Long fzpsl;
     private Long fdqsl;
     private Long fyjsl;
     private Long fzssl;
     private Integer fstatus;
     private String fgwxc;
     private Long fbmid;
     private Long fpbrs;
     private String fgwzz;
     private String fgwyq;
     private String fname;


    // Constructors

    /** default constructor */
    public HrGwbm() {
    }

    
    /** full constructor */
    public HrGwbm(Long fjobid, Long fzpsl, Long fdqsl, Long fyjsl, Long fzssl, Integer fstatus, String fgwxc, Long fbmid, Long fpbrs, String fgwzz, String fgwyq, String fname) {
        this.fjobid = fjobid;
        this.fzpsl = fzpsl;
        this.fdqsl = fdqsl;
        this.fyjsl = fyjsl;
        this.fzssl = fzssl;
        this.fstatus = fstatus;
        this.fgwxc = fgwxc;
        this.fbmid = fbmid;
        this.fpbrs = fpbrs;
        this.fgwzz = fgwzz;
        this.fgwyq = fgwyq;
        this.fname = fname;
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
    
    @Column(name="fjobid")

    public Long getFjobid() {
        return this.fjobid;
    }
    
    public void setFjobid(Long fjobid) {
        this.fjobid = fjobid;
    }
    
    @Column(name="fzpsl")

    public Long getFzpsl() {
        return this.fzpsl;
    }
    
    public void setFzpsl(Long fzpsl) {
        this.fzpsl = fzpsl;
    }
    
    @Column(name="fdqsl")

    public Long getFdqsl() {
        return this.fdqsl;
    }
    
    public void setFdqsl(Long fdqsl) {
        this.fdqsl = fdqsl;
    }
    
    @Column(name="fyjsl")

    public Long getFyjsl() {
        return this.fyjsl;
    }
    
    public void setFyjsl(Long fyjsl) {
        this.fyjsl = fyjsl;
    }
    
    @Column(name="fzssl")

    public Long getFzssl() {
        return this.fzssl;
    }
    
    public void setFzssl(Long fzssl) {
        this.fzssl = fzssl;
    }
    
    @Column(name="fstatus")

    public Integer getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(Integer fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fgwxc", length=64)

    public String getFgwxc() {
        return this.fgwxc;
    }
    
    public void setFgwxc(String fgwxc) {
        this.fgwxc = fgwxc;
    }
    
    @Column(name="fbmid")

    public Long getFbmid() {
        return this.fbmid;
    }
    
    public void setFbmid(Long fbmid) {
        this.fbmid = fbmid;
    }
    
    @Column(name="fpbrs")

    public Long getFpbrs() {
        return this.fpbrs;
    }
    
    public void setFpbrs(Long fpbrs) {
        this.fpbrs = fpbrs;
    }
    
    @Column(name="fgwzz", length=4000)

    public String getFgwzz() {
        return this.fgwzz;
    }
    
    public void setFgwzz(String fgwzz) {
        this.fgwzz = fgwzz;
    }
    
    @Column(name="fgwyq", length=4000)

    public String getFgwyq() {
        return this.fgwyq;
    }
    
    public void setFgwyq(String fgwyq) {
        this.fgwyq = fgwyq;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
   








}