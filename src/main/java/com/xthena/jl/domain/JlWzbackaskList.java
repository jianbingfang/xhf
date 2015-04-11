package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlWzbackaskList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_wzbackask_list"
    ,catalog="xhf"
)

public class JlWzbackaskList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fbackid;
     private Long fwzid;
     private Long fnum;
     private String fmemo;


    // Constructors

    /** default constructor */
    public JlWzbackaskList() {
    }

    
    /** full constructor */
    public JlWzbackaskList(Long fbackid, Long fwzid, Long fnum, String fmemo) {
        this.fbackid = fbackid;
        this.fwzid = fwzid;
        this.fnum = fnum;
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
    
    @Column(name="fbackid")

    public Long getFbackid() {
        return this.fbackid;
    }
    
    public void setFbackid(Long fbackid) {
        this.fbackid = fbackid;
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
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}