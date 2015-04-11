package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JyXmYj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_xm_yj"
    ,catalog="xhf"
)

public class JyXmYj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fyijiaostatus;
     private String ffankui;
     private Long fxmid;
     private String ftbry;
     private String ftaskid;
     private Long fzj;


    // Constructors

    /** default constructor */
    public JyXmYj() {
    }

    
    /** full constructor */
    public JyXmYj(String fyijiaostatus, String ffankui, Long fxmid, String ftbry, String ftaskid, Long fzj) {
        this.fyijiaostatus = fyijiaostatus;
        this.ffankui = ffankui;
        this.fxmid = fxmid;
        this.ftbry = ftbry;
        this.ftaskid = ftaskid;
        this.fzj = fzj;
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
    
    @Column(name="fyijiaostatus", length=64)

    public String getFyijiaostatus() {
        return this.fyijiaostatus;
    }
    
    public void setFyijiaostatus(String fyijiaostatus) {
        this.fyijiaostatus = fyijiaostatus;
    }
    
    @Column(name="ffankui", length=500)

    public String getFfankui() {
        return this.ffankui;
    }
    
    public void setFfankui(String ffankui) {
        this.ffankui = ffankui;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="ftbry", length=16777215)

    public String getFtbry() {
        return this.ftbry;
    }
    
    public void setFtbry(String ftbry) {
        this.ftbry = ftbry;
    }
    
    @Column(name="ftaskid", length=64)

    public String getFtaskid() {
        return this.ftaskid;
    }
    
    public void setFtaskid(String ftaskid) {
        this.ftaskid = ftaskid;
    }
    
    @Column(name="fzj")

    public Long getFzj() {
        return this.fzj;
    }
    
    public void setFzj(Long fzj) {
        this.fzj = fzj;
    }
   








}