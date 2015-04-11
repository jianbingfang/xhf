package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrZj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_zj"
    ,catalog="xhf"
)

public class HrZj  implements java.io.Serializable {

    // Fields    
     private Long fid;
     private String fname;
     private String fzy;
     private String ftype;
     private Long fbfdw;


    // Constructors

    /** default constructor */
    public HrZj() {
    }

    
    /** full constructor */
    public HrZj(String fname, String fzy, String ftype, Long fbfdw) {
        this.fname = fname;
        this.fzy = fzy;
        this.ftype = ftype;
        this.fbfdw = fbfdw;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fzy", length=64)

    public String getFzy() {
        return this.fzy;
    }
    
    public void setFzy(String fzy) {
        this.fzy = fzy;
    }
    
    @Column(name="ftype")

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fbfdw")

    public Long getFbfdw() {
        return this.fbfdw;
    }
    
    public void setFbfdw(Long fbfdw) {
        this.fbfdw = fbfdw;
    }
   


}