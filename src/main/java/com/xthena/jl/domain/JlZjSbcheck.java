package com.xthena.jl.domain;
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
 * JlZjSbcheck entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zl_sbcheck"
    ,catalog="xhf"
)

public class JlZjSbcheck  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fyqid;
     private String fcheckpoint;
     private String fcheckresult;
     private Date fcheckdate;
     private Long fjingbanrenid;


    // Constructors

    /** default constructor */
    public JlZjSbcheck() {
    }

    
    /** full constructor */
    public JlZjSbcheck(Long fyqid, String fcheckpoint, String fcheckresult, Date fcheckdate, Long fjingbanrenid) {
        this.fyqid = fyqid;
        this.fcheckpoint = fcheckpoint;
        this.fcheckresult = fcheckresult;
        this.fcheckdate = fcheckdate;
        this.fjingbanrenid = fjingbanrenid;
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
    
    @Column(name="fyqid")

    public Long getFyqid() {
        return this.fyqid;
    }
    
    public void setFyqid(Long fyqid) {
        this.fyqid = fyqid;
    }
    
    @Column(name="fcheckpoint", length=500)

    public String getFcheckpoint() {
        return this.fcheckpoint;
    }
    
    public void setFcheckpoint(String fcheckpoint) {
        this.fcheckpoint = fcheckpoint;
    }
    
    @Column(name="fcheckresult", length=500)

    public String getFcheckresult() {
        return this.fcheckresult;
    }
    
    public void setFcheckresult(String fcheckresult) {
        this.fcheckresult = fcheckresult;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcheckdate", length=10)

    public Date getFcheckdate() {
        return this.fcheckdate;
    }
    
    public void setFcheckdate(Date fcheckdate) {
        this.fcheckdate = fcheckdate;
    }
    
    @Column(name="fjingbanrenid")

    public Long getFjingbanrenid() {
        return this.fjingbanrenid;
    }
    
    public void setFjingbanrenid(Long fjingbanrenid) {
        this.fjingbanrenid = fjingbanrenid;
    }
   








}