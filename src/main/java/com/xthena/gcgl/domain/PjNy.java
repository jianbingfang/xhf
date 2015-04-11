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
 * PjNy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pj_ny"
    ,catalog="xhf"
)

public class PjNy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private Long fyijiaorenid;
     private Date fyijiaodate;
     private Long fjieshourenid;
     private String fyjdname;
     private String fyjdurl;
     private String fyijioaren;
     private String fjieshouren;
     private Date fjieshoudate;


    // Constructors

    /** default constructor */
    public PjNy() {
    }

    
    /** full constructor */
    public PjNy(Long fxmid, Long fyijiaorenid, Date fyijiaodate, Long fjieshourenid, String fyjdname, String fyjdurl, String fyijioaren, String fjieshouren, Date fjieshoudate) {
        this.fxmid = fxmid;
        this.fyijiaorenid = fyijiaorenid;
        this.fyijiaodate = fyijiaodate;
        this.fjieshourenid = fjieshourenid;
        this.fyjdname = fyjdname;
        this.fyjdurl = fyjdurl;
        this.fyijioaren = fyijioaren;
        this.fjieshouren = fjieshouren;
        this.fjieshoudate = fjieshoudate;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fyijiaorenid")

    public Long getFyijiaorenid() {
        return this.fyijiaorenid;
    }
    
    public void setFyijiaorenid(Long fyijiaorenid) {
        this.fyijiaorenid = fyijiaorenid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fyijiaodate", length=10)

    public Date getFyijiaodate() {
        return this.fyijiaodate;
    }
    
    public void setFyijiaodate(Date fyijiaodate) {
        this.fyijiaodate = fyijiaodate;
    }
    
    @Column(name="fjieshourenid")

    public Long getFjieshourenid() {
        return this.fjieshourenid;
    }
    
    public void setFjieshourenid(Long fjieshourenid) {
        this.fjieshourenid = fjieshourenid;
    }
    
    @Column(name="fyjdname", length=64)

    public String getFyjdname() {
        return this.fyjdname;
    }
    
    public void setFyjdname(String fyjdname) {
        this.fyjdname = fyjdname;
    }
    
    @Column(name="fyjdurl", length=64)

    public String getFyjdurl() {
        return this.fyjdurl;
    }
    
    public void setFyjdurl(String fyjdurl) {
        this.fyjdurl = fyjdurl;
    }
    
    @Column(name="fyijioaren", length=64)

    public String getFyijioaren() {
        return this.fyijioaren;
    }
    
    public void setFyijioaren(String fyijioaren) {
        this.fyijioaren = fyijioaren;
    }
    
    @Column(name="fjieshouren", length=64)

    public String getFjieshouren() {
        return this.fjieshouren;
    }
    
    public void setFjieshouren(String fjieshouren) {
        this.fjieshouren = fjieshouren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjieshoudate", length=10)

    public Date getFjieshoudate() {
        return this.fjieshoudate;
    }
    
    public void setFjieshoudate(Date fjieshoudate) {
        this.fjieshoudate = fjieshoudate;
    }
   








}