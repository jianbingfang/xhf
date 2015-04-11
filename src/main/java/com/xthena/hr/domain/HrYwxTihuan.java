package com.xthena.hr.domain;
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
 * HrYwxTihuan entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ywxtihuan"
    ,catalog="xhf"
)

public class HrYwxTihuan  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private Long fnewryid;
     private Date frdate;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrYwxTihuan() {
    }

    
    /** full constructor */
    public HrYwxTihuan(Long fryid, Long fnewryid, Date frdate, String fmemo) {
        this.fryid = fryid;
        this.fnewryid = fnewryid;
        this.frdate = frdate;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fnewryid")

    public Long getFnewryid() {
        return this.fnewryid;
    }
    
    public void setFnewryid(Long fnewryid) {
        this.fnewryid = fnewryid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="frdate", length=10)

    public Date getFrdate() {
        return this.frdate;
    }
    
    public void setFrdate(Date frdate) {
        this.frdate = frdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}