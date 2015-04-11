package com.xthena.common.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommMenuRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_menu_role"
    ,catalog="xhf"
)

public class CommMenuRole  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fmenuid;
     private Long froleid;
     private String fmemo;


    // Constructors

    /** default constructor */
    public CommMenuRole() {
    }

    
    /** full constructor */
    public CommMenuRole(Long fmenuid, Long froleid, String fmemo) {
        this.fmenuid = fmenuid;
        this.froleid = froleid;
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
    
    @Column(name="fmenuid")

    public Long getFmenuid() {
        return this.fmenuid;
    }
    
    public void setFmenuid(Long fmenuid) {
        this.fmenuid = fmenuid;
    }
    
    @Column(name="froleid")

    public Long getFroleid() {
        return this.froleid;
    }
    
    public void setFroleid(Long froleid) {
        this.froleid = froleid;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}