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
 * JlWzbackAsk entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_wzbackask"
    ,catalog="xhf"
)

public class JlWzbackAsk  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long faskuser;
     private Date faskdate;
     private Long fxmid;
     private Long freceiveuser;
     private Long ffileid;
     private String fbwztype;
     private Date freceivedate;

     
    public Date getFreceivedate() {
		return freceivedate;
	}


	public void setFreceivedate(Date freceivedate) {
		this.freceivedate = freceivedate;
	}


	/** default constructor */
    public JlWzbackAsk() {
    }

    
    /** full constructor */
    public JlWzbackAsk(Long faskuser, Date faskdate, Long fxmid, Long freceiveuser, Long ffileid, String fbwztype) {
        this.faskuser = faskuser;
        this.faskdate = faskdate;
        this.fxmid = fxmid;
        this.freceiveuser = freceiveuser;
        this.ffileid = ffileid;
        this.fbwztype = fbwztype;
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
    
    @Column(name="faskuser")

    public Long getFaskuser() {
        return this.faskuser;
    }
    
    public void setFaskuser(Long faskuser) {
        this.faskuser = faskuser;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="faskdate", length=10)

    public Date getFaskdate() {
        return this.faskdate;
    }
    
    public void setFaskdate(Date faskdate) {
        this.faskdate = faskdate;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="freceiveuser")

    public Long getFreceiveuser() {
        return this.freceiveuser;
    }
    
    public void setFreceiveuser(Long freceiveuser) {
        this.freceiveuser = freceiveuser;
    }
    
    @Column(name="ffileid")

    public Long getFfileid() {
        return this.ffileid;
    }
    
    public void setFfileid(Long ffileid) {
        this.ffileid = ffileid;
    }
    
    @Column(name="fbwztype", length=64)

    public String getFbwztype() {
        return this.fbwztype;
    }
    
    public void setFbwztype(String fbwztype) {
        this.fbwztype = fbwztype;
    }
   








}