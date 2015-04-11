package com.xthena.jl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlKqDetail entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_kq_detail"
    ,catalog="xhf"
)

public class JlKqDetail  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long frykqid;
     private Integer fday;
     private Integer fbanci;
     private Integer fkq;


    // Constructors

    /** default constructor */
    public JlKqDetail() {
    }

    
    /** full constructor */
    public JlKqDetail(Long frykqid, Integer fday, Integer fbanci, Integer fkq) {
        this.frykqid = frykqid;
        this.fday = fday;
        this.fbanci = fbanci;
        this.fkq = fkq;
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
    
    @Column(name="frykqid")

    public Long getFrykqid() {
        return this.frykqid;
    }
    
    public void setFrykqid(Long frykqid) {
        this.frykqid = frykqid;
    }
    
    @Column(name="fday")

    public Integer getFday() {
        return this.fday;
    }
    
    public void setFday(Integer fday) {
        this.fday = fday;
    }
    
    @Column(name="fbanci")

    public Integer getFbanci() {
        return this.fbanci;
    }
    
    public void setFbanci(Integer fbanci) {
        this.fbanci = fbanci;
    }
    
    @Column(name="fkq")

    public Integer getFkq() {
        return this.fkq;
    }
    
    public void setFkq(Integer fkq) {
        this.fkq = fkq;
    }
   








}