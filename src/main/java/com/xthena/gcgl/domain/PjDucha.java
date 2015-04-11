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
 * PjDucha entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ducha"
    ,catalog="xhf"
)

public class PjDucha  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcheckno;
     private Long fxmid;
     private Long fcheckerid;
     private Date fdate;
     private String fgoal;
     private String fproblem;
     private String fmemo;


    // Constructors

    /** default constructor */
    public PjDucha() {
    }

    
    /** full constructor */
    public PjDucha(String fcheckno, Long fxmid, Long fcheckerid, Date fdate, String fgoal, String fproblem, String fmemo) {
        this.fcheckno = fcheckno;
        this.fxmid = fxmid;
        this.fcheckerid = fcheckerid;
        this.fdate = fdate;
        this.fgoal = fgoal;
        this.fproblem = fproblem;
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
    
    @Column(name="fcheckno", length=64)

    public String getFcheckno() {
        return this.fcheckno;
    }
    
    public void setFcheckno(String fcheckno) {
        this.fcheckno = fcheckno;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fcheckerid")

    public Long getFcheckerid() {
        return this.fcheckerid;
    }
    
    public void setFcheckerid(Long fcheckerid) {
        this.fcheckerid = fcheckerid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fdate", length=10)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fgoal", length=64)

    public String getFgoal() {
        return this.fgoal;
    }
    
    public void setFgoal(String fgoal) {
        this.fgoal = fgoal;
    }
    
    @Column(name="fproblem", length=500)

    public String getFproblem() {
        return this.fproblem;
    }
    
    public void setFproblem(String fproblem) {
        this.fproblem = fproblem;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}