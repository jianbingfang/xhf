package com.xthena.sckf.domain;
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
 * Niandu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_niandu"
    ,catalog="xhf"
)

public class Niandu  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fyear;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public Niandu() {
    }

    
    /** full constructor */
    public Niandu(String fyear, Date fcreatedate) {
        this.fyear = fyear;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="fyear", length=64)

    public String getFyear() {
        return this.fyear;
    }
    
    public void setFyear(String fyear) {
        this.fyear = fyear;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}