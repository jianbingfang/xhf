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
 * HrPzRy entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_px_ry"
    ,catalog="xhf"
)

public class HrPzRy  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fry;
     private Long frenyuan;
     private Date fpxdate;
     private Integer fksresult;
     private Integer fksfs;
     private String fmemo;


    // Constructors

    /** default constructor */
    public HrPzRy() {
    }

    
    /** full constructor */
    public HrPzRy(String fry, Long frenyuan, Date fpxdate, Integer fksresult, Integer fksfs, String fmemo) {
        this.fry = fry;
        this.frenyuan = frenyuan;
        this.fpxdate = fpxdate;
        this.fksresult = fksresult;
        this.fksfs = fksfs;
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
    
    @Column(name="fry", length=64)

    public String getFry() {
        return this.fry;
    }
    
    public void setFry(String fry) {
        this.fry = fry;
    }
    
    @Column(name="frenyuan")

    public Long getFrenyuan() {
        return this.frenyuan;
    }
    
    public void setFrenyuan(Long frenyuan) {
        this.frenyuan = frenyuan;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fpxdate", length=10)

    public Date getFpxdate() {
        return this.fpxdate;
    }
    
    public void setFpxdate(Date fpxdate) {
        this.fpxdate = fpxdate;
    }
    
    @Column(name="fksresult")

    public Integer getFksresult() {
        return this.fksresult;
    }
    
    public void setFksresult(Integer fksresult) {
        this.fksresult = fksresult;
    }
    
    @Column(name="fksfs")

    public Integer getFksfs() {
        return this.fksfs;
    }
    
    public void setFksfs(Integer fksfs) {
        this.fksfs = fksfs;
    }
    
    @Column(name="fmemo", length=512)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}