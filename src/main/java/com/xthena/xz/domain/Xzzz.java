package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Xzzz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_zz"
    ,catalog="xhf"
)

public class Xzzz  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fzztype;
     private String fddkh;
     private String fzzsq;
     private String fzzgd;


    // Constructors

    /** default constructor */
    public Xzzz() {
    }

    
    /** full constructor */
    public Xzzz(String fzztype, String fddkh, String fzzsq, String fzzgd) {
        this.fzztype = fzztype;
        this.fddkh = fddkh;
        this.fzzsq = fzzsq;
        this.fzzgd = fzzgd;
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
    
    @Column(name="fzztype", length=64)

    public String getFzztype() {
        return this.fzztype;
    }
    
    public void setFzztype(String fzztype) {
        this.fzztype = fzztype;
    }
    
    @Column(name="fddkh", length=64)

    public String getFddkh() {
        return this.fddkh;
    }
    
    public void setFddkh(String fddkh) {
        this.fddkh = fddkh;
    }
    
    @Column(name="fzzsq", length=512)

    public String getFzzsq() {
        return this.fzzsq;
    }
    
    public void setFzzsq(String fzzsq) {
        this.fzzsq = fzzsq;
    }
    
    @Column(name="fzzgd", length=1000)

    public String getFzzgd() {
        return this.fzzgd;
    }
    
    public void setFzzgd(String fzzgd) {
        this.fzzgd = fzzgd;
    }
   








}