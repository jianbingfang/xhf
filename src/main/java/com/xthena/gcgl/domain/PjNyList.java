package com.xthena.gcgl.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * PjNyList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ny_list"
    ,catalog="xhf"
)

public class PjNyList  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fnyno;
     private String fnyname;
     private Long fnynum;
     private String fnymemo;
     private Long fnyid;


    // Constructors

    public Long getFnyid() {
		return fnyid;
	}


	public void setFnyid(Long fnyid) {
		this.fnyid = fnyid;
	}


	/** default constructor */
    public PjNyList() {
    }

    
    /** full constructor */
    public PjNyList(String fnyno, String fnyname, Long fnynum, String fnymemo) {
        this.fnyno = fnyno;
        this.fnyname = fnyname;
        this.fnynum = fnynum;
        this.fnymemo = fnymemo;
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
    
    @Column(name="fnyno", length=64)

    public String getFnyno() {
        return this.fnyno;
    }
    
    public void setFnyno(String fnyno) {
        this.fnyno = fnyno;
    }
    
    @Column(name="fnyname", length=20)

    public String getFnyname() {
        return this.fnyname;
    }
    
    public void setFnyname(String fnyname) {
        this.fnyname = fnyname;
    }
    
    @Column(name="fnynum")

    public Long getFnynum() {
        return this.fnynum;
    }
    
    public void setFnynum(Long fnynum) {
        this.fnynum = fnynum;
    }
    
    @Column(name="fnymemo", length=500)

    public String getFnymemo() {
        return this.fnymemo;
    }
    
    public void setFnymemo(String fnymemo) {
        this.fnymemo = fnymemo;
    }
   








}