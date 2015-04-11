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
 * JyKb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_kb"
    ,catalog="xhf"
)

public class JyKb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fzbstatus;
     private Long fzbkzj;
     private String fothers;
     private String fzbdanwei;
     private Long fzbmoney;
     private String fwzbsy;
     private Date flqdate;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private Long fbmid;


    // Constructors

    /** default constructor */
    public JyKb() {
    }

    
    /** full constructor */
    public JyKb(String fzbstatus, Long fzbkzj, String fothers, String fzbdanwei, Long fzbmoney, String fwzbsy, Date flqdate, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4) {
        this.fzbstatus = fzbstatus;
        this.fzbkzj = fzbkzj;
        this.fothers = fothers;
        this.fzbdanwei = fzbdanwei;
        this.fzbmoney = fzbmoney;
        this.fwzbsy = fwzbsy;
        this.flqdate = flqdate;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
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
    
    @Column(name="fzbstatus", length=64)

    public String getFzbstatus() {
        return this.fzbstatus;
    }
    
    public void setFzbstatus(String fzbstatus) {
        this.fzbstatus = fzbstatus;
    }
    
    @Column(name="fzbkzj")

    public Long getFzbkzj() {
        return this.fzbkzj;
    }
    
    public void setFzbkzj(Long fzbkzj) {
        this.fzbkzj = fzbkzj;
    }
    
    @Column(name="fothers", length=500)

    public String getFothers() {
        return this.fothers;
    }
    
    public void setFothers(String fothers) {
        this.fothers = fothers;
    }
    
    @Column(name="fzbdanwei", length=64)

    public String getFzbdanwei() {
        return this.fzbdanwei;
    }
    
    public void setFzbdanwei(String fzbdanwei) {
        this.fzbdanwei = fzbdanwei;
    }
    
    @Column(name="fzbmoney")

    public Long getFzbmoney() {
        return this.fzbmoney;
    }
    
    public void setFzbmoney(Long fzbmoney) {
        this.fzbmoney = fzbmoney;
    }
    
    @Column(name="fwzbsy", length=500)

    public String getFwzbsy() {
        return this.fwzbsy;
    }
    
    public void setFwzbsy(String fwzbsy) {
        this.fwzbsy = fwzbsy;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flqdate", length=10)

    public Date getFlqdate() {
        return this.flqdate;
    }
    
    public void setFlqdate(Date flqdate) {
        this.flqdate = flqdate;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=64)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=64)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=64)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="fmemo4", length=64)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }


    @Column(name="fbmid", length=20)
	public Long getFbmid() {
		return fbmid;
	}


	/**
	 * @param fbmid the fbmid to set
	 */
	public void setFbmid(Long fbmid) {
		this.fbmid = fbmid;
	}
   








}