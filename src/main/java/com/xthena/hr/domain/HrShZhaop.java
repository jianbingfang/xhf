package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrShZhaop entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_shehuizhaop"
    ,catalog="xhf"
)

public class HrShZhaop  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ffbtype;
     private String fgwname;
     private String fzhiwu;
     private Integer fzhaopinnum;
     private String fgwzhize;
     private String fgwyaoqiu;
     private String fgzaddr;


    // Constructors

    /** default constructor */
    public HrShZhaop() {
    }

    
    /** full constructor */
    public HrShZhaop(String ffbtype, String fgwname, String fzhiwu, Integer fzhaopinnum, String fgwzhize, String fgwyaoqiu, String fgzaddr) {
        this.ffbtype = ffbtype;
        this.fgwname = fgwname;
        this.fzhiwu = fzhiwu;
        this.fzhaopinnum = fzhaopinnum;
        this.fgwzhize = fgwzhize;
        this.fgwyaoqiu = fgwyaoqiu;
        this.fgzaddr = fgzaddr;
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
    
    @Column(name="ffbtype", length=64)

    public String getFfbtype() {
        return this.ffbtype;
    }
    
    public void setFfbtype(String ffbtype) {
        this.ffbtype = ffbtype;
    }
    
    @Column(name="fgwname", length=64)

    public String getFgwname() {
        return this.fgwname;
    }
    
    public void setFgwname(String fgwname) {
        this.fgwname = fgwname;
    }
    
    @Column(name="fzhiwu", length=64)

    public String getFzhiwu() {
        return this.fzhiwu;
    }
    
    public void setFzhiwu(String fzhiwu) {
        this.fzhiwu = fzhiwu;
    }
    
    @Column(name="fzhaopinnum")

    public Integer getFzhaopinnum() {
        return this.fzhaopinnum;
    }
    
    public void setFzhaopinnum(Integer fzhaopinnum) {
        this.fzhaopinnum = fzhaopinnum;
    }
    
    @Column(name="fgwzhize", length=500)

    public String getFgwzhize() {
        return this.fgwzhize;
    }
    
    public void setFgwzhize(String fgwzhize) {
        this.fgwzhize = fgwzhize;
    }
    
    @Column(name="fgwyaoqiu", length=500)

    public String getFgwyaoqiu() {
        return this.fgwyaoqiu;
    }
    
    public void setFgwyaoqiu(String fgwyaoqiu) {
        this.fgwyaoqiu = fgwyaoqiu;
    }
    
    @Column(name="fgzaddr", length=64)

    public String getFgzaddr() {
        return this.fgzaddr;
    }
    
    public void setFgzaddr(String fgzaddr) {
        this.fgzaddr = fgzaddr;
    }
   








}