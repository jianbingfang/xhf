package com.xthena.xz.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * XzChufa entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_chufa"
    ,catalog="xhf"
)

public class XzChufa  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fcontent;
     private String ffileno;
     private Date fdate;
     private Long fxmid;
     private String fmemo;
     private String ffwdw;//发文单位


    // Constructors

    /** default constructor */
    public XzChufa() {
    }

    
    /** full constructor */
    public XzChufa(String fname, String fcontent, String ffileno, Date fdate, Long fxmid, String fmemo ,String ffwdw) {
        this.fname = fname;
        this.fcontent = fcontent;
        this.ffileno = ffileno;
        this.fdate = fdate;
        this.fxmid = fxmid;
        this.fmemo = fmemo;
        this.ffwdw = ffwdw;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fcontent", length=4000)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="ffileno", length=4000)

    public String getFfileno() {
        return this.ffileno;
    }
    
    public void setFfileno(String ffileno) {
        this.ffileno = ffileno;
    }
    
    @Column(name="fdate", length=19)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fmemo", length=4000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }

    @Column(name="ffwdw")
	public String getFfwdw() {
		return ffwdw;
	}


	public void setFfwdw(String ffwdw) {
		this.ffwdw = ffwdw;
	}
   








}