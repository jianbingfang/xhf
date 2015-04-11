package com.xthena.hr.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * HrRyyj entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_ryyj"
    ,catalog="xhf"
)

public class HrRyyj  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fgzjingli;
     private String fgzyeji;
     private String fjiangfa;
     private Long fryid;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrRyyj() {
    }

    
    /** full constructor */
    public HrRyyj(String fgzjingli, String fgzyeji, String fjiangfa, Long fryid, String fmemo) {
        this.fgzjingli = fgzjingli;
        this.fgzyeji = fgzyeji;
        this.fjiangfa = fjiangfa;
        this.fryid = fryid;
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
    
    @Column(name="fgzjingli", length=2000)

    public String getFgzjingli() {
        return this.fgzjingli;
    }
    
    public void setFgzjingli(String fgzjingli) {
        this.fgzjingli = fgzjingli;
    }
    
    @Column(name="fgzyeji", length=2000)

    public String getFgzyeji() {
        return this.fgzyeji;
    }
    
    public void setFgzyeji(String fgzyeji) {
        this.fgzyeji = fgzyeji;
    }
    
    @Column(name="fjiangfa", length=2000)

    public String getFjiangfa() {
        return this.fjiangfa;
    }
    
    public void setFjiangfa(String fjiangfa) {
        this.fjiangfa = fjiangfa;
    }
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}