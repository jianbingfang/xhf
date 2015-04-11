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
 * XzCommNews entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_comm_news"
    ,catalog="xhf"
)

public class XzCommNews  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String flanmu;
     private String froles;
     private String fitop;
     private String ffaburen;
     private String ftuijian;
     private String forder;
     private Date fcreatedate;
     private Date fupdatedate;
     private Integer freadnum;
     private String fnewcontent;
     private String furl;


    // Constructors

    /** default constructor */
    public XzCommNews() {
    }

	/** minimal constructor */
    public XzCommNews(String fname, String flanmu, String fnewcontent) {
        this.fname = fname;
        this.flanmu = flanmu;
        this.fnewcontent = fnewcontent;
    }
    
    /** full constructor */
    public XzCommNews(String fname, String flanmu, String froles, String fitop, String ffaburen, String ftuijian, String forder, Date fcreatedate, Date fupdatedate, Integer freadnum, String fnewcontent, String furl) {
        this.fname = fname;
        this.flanmu = flanmu;
        this.froles = froles;
        this.fitop = fitop;
        this.ffaburen = ffaburen;
        this.ftuijian = ftuijian;
        this.forder = forder;
        this.fcreatedate = fcreatedate;
        this.fupdatedate = fupdatedate;
        this.freadnum = freadnum;
        this.fnewcontent = fnewcontent;
        this.furl = furl;
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
    
    @Column(name="fname", nullable=false, length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="flanmu", nullable=false, length=64)

    public String getFlanmu() {
        return this.flanmu;
    }
    
    public void setFlanmu(String flanmu) {
        this.flanmu = flanmu;
    }
    
    @Column(name="froles", length=64)

    public String getFroles() {
        return this.froles;
    }
    
    public void setFroles(String froles) {
        this.froles = froles;
    }
    
    @Column(name="fitop", length=4)

    public String getFitop() {
        return this.fitop;
    }
    
    public void setFitop(String fitop) {
        this.fitop = fitop;
    }
    
    @Column(name="ffaburen", length=64)

    public String getFfaburen() {
        return this.ffaburen;
    }
    
    public void setFfaburen(String ffaburen) {
        this.ffaburen = ffaburen;
    }
    
    @Column(name="ftuijian", length=4)

    public String getFtuijian() {
        return this.ftuijian;
    }
    
    public void setFtuijian(String ftuijian) {
        this.ftuijian = ftuijian;
    }
    
    @Column(name="forder", length=64)

    public String getForder() {
        return this.forder;
    }
    
    public void setForder(String forder) {
        this.forder = forder;
    }
    
    @Column(name="fcreatedate", length=19)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
    
    @Column(name="fupdatedate", length=19)

    public Date getFupdatedate() {
        return this.fupdatedate;
    }
    
    public void setFupdatedate(Date fupdatedate) {
        this.fupdatedate = fupdatedate;
    }
    
    @Column(name="freadnum")

    public Integer getFreadnum() {
        return this.freadnum;
    }
    
    public void setFreadnum(Integer freadnum) {
        this.freadnum = freadnum;
    }
    
    @Column(name="fnewcontent", nullable=false, length=4000)

    public String getFnewcontent() {
        return this.fnewcontent;
    }
    
    public void setFnewcontent(String fnewcontent) {
        this.fnewcontent = fnewcontent;
    }
    
    @Column(name="furl", length=512)

    public String getFurl() {
        return this.furl;
    }
    
    public void setFurl(String furl) {
        this.furl = furl;
    }
   








}