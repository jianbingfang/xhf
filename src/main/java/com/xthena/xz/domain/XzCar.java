package com.xthena.xz.domain;
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
 * XzCar entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_xz_car"
    ,catalog="xhf"
)

public class XzCar  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcarno;
     private String fbrand;
     private String ftype;
     private Double fprice;
     private Double fcurrentprice;
     private Double ftotalkm;
     private String fdrivelicense;
     private String fowner;
     private String fuser;
     private Date fwbdate;
     private Date fbxdate;
     private Date fscdate;
     private Double fzjmoney;
     private Integer fzjnum;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private Long fownerid;
     private Long fuserid;
     private String frybz;


    // Constructors

    /** default constructor */
    public XzCar() {
    }

    
    /** full constructor */
    public XzCar(String fcarno, String fbrand, String ftype, Double fprice, Double fcurrentprice, Double ftotalkm, String fdrivelicense, String fowner, String fuser, Date fwbdate, Date fbxdate, Date fscdate, Double fzjmoney, Integer fzjnum, String fmemo, String fmemo1, String fmemo2, Long fownerid, Long fuserid,String frybz) {
        this.fcarno = fcarno;
        this.fbrand = fbrand;
        this.ftype = ftype;
        this.fprice = fprice;
        this.fcurrentprice = fcurrentprice;
        this.ftotalkm = ftotalkm;
        this.fdrivelicense = fdrivelicense;
        this.fowner = fowner;
        this.fuser = fuser;
        this.fwbdate = fwbdate;
        this.fbxdate = fbxdate;
        this.fscdate = fscdate;
        this.fzjmoney = fzjmoney;
        this.fzjnum = fzjnum;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fownerid = fownerid;
        this.fuserid = fuserid;
        this.frybz = frybz;
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
    
    @Column(name="fcarno", length=64)

    public String getFcarno() {
        return this.fcarno;
    }
    
    public void setFcarno(String fcarno) {
        this.fcarno = fcarno;
    }
    
    @Column(name="fbrand", length=64)

    public String getFbrand() {
        return this.fbrand;
    }
    
    public void setFbrand(String fbrand) {
        this.fbrand = fbrand;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fprice")

    public Double getFprice() {
        return this.fprice;
    }
    
    public void setFprice(Double fprice) {
        this.fprice = fprice;
    }
    
    @Column(name="fcurrentprice")

    public Double getFcurrentprice() {
        return this.fcurrentprice;
    }
    
    public void setFcurrentprice(Double fcurrentprice) {
        this.fcurrentprice = fcurrentprice;
    }
    
    @Column(name="ftotalkm")

    public Double getFtotalkm() {
        return this.ftotalkm;
    }
    
    public void setFtotalkm(Double ftotalkm) {
        this.ftotalkm = ftotalkm;
    }
    
    @Column(name="fdrivelicense", length=512)

    public String getFdrivelicense() {
        return this.fdrivelicense;
    }
    
    public void setFdrivelicense(String fdrivelicense) {
        this.fdrivelicense = fdrivelicense;
    }
    
    @Column(name="fowner", length=64)

    public String getFowner() {
        return this.fowner;
    }
    
    public void setFowner(String fowner) {
        this.fowner = fowner;
    }
    
    @Column(name="fuser", length=64)

    public String getFuser() {
        return this.fuser;
    }
    
    public void setFuser(String fuser) {
        this.fuser = fuser;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fwbdate", length=10)

    public Date getFwbdate() {
        return this.fwbdate;
    }
    
    public void setFwbdate(Date fwbdate) {
        this.fwbdate = fwbdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbxdate", length=10)

    public Date getFbxdate() {
        return this.fbxdate;
    }
    
    public void setFbxdate(Date fbxdate) {
        this.fbxdate = fbxdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fscdate", length=10)

    public Date getFscdate() {
        return this.fscdate;
    }
    
    public void setFscdate(Date fscdate) {
        this.fscdate = fscdate;
    }
    
    @Column(name="fzjmoney")

    public Double getFzjmoney() {
        return this.fzjmoney;
    }
    
    public void setFzjmoney(Double fzjmoney) {
        this.fzjmoney = fzjmoney;
    }
    
    @Column(name="fzjnum")

    public Integer getFzjnum() {
        return this.fzjnum;
    }
    
    public void setFzjnum(Integer fzjnum) {
        this.fzjnum = fzjnum;
    }
    
    @Column(name="fmemo", length=1000)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=1000)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=1000)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fownerid")

    public Long getFownerid() {
        return this.fownerid;
    }
    
    public void setFownerid(Long fownerid) {
        this.fownerid = fownerid;
    }
    
    @Column(name="fuserid")

    public Long getFuserid() {
        return this.fuserid;
    }
    
    public void setFuserid(Long fuserid) {
        this.fuserid = fuserid;
    }


	/**
	 * @return the frybz
	 */
    @Column(name="frybz", length=64)
	public String getFrybz() {
		return frybz;
	}


	/**
	 * @param frybz the frybz to set
	 */
	public void setFrybz(String frybz) {
		this.frybz = frybz;
	}
   








}