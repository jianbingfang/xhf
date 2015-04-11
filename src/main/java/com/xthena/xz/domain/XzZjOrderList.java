package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * XzZjOrderList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_zj_orderlist"
    ,catalog="xhf"
)

public class XzZjOrderList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fzjid;
     private Long forderid;
     private String ftype;


    // Constructors

    /** default constructor */
    public XzZjOrderList() {
    }

    
    /** full constructor */
    public XzZjOrderList(Long fzjid, Long forderid, String ftype) {
        this.fzjid = fzjid;
        this.forderid = forderid;
        this.ftype = ftype;
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
    
    @Column(name="fzjid")

    public Long getFzjid() {
        return this.fzjid;
    }
    
    public void setFzjid(Long fzjid) {
        this.fzjid = fzjid;
    }
    
    @Column(name="forderid")

    public Long getForderid() {
        return this.forderid;
    }
    
    public void setForderid(Long forderid) {
        this.forderid = forderid;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
   








}