package com.xthena.xz.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * WzKind entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_wz_kind"
    ,catalog="xhf"
)

public class WzKind  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fkindname;
     private Long fpid;
     private String fisasset;
     private String fstatus;
     private Integer fisleaf;
     private String funit;
     private String fcode;


    // Constructors

    /** default constructor */
    public WzKind() {
    }

	/** minimal constructor */
    public WzKind(String fkindname) {
        this.fkindname = fkindname;
    }
    
    /** full constructor */
    public WzKind(String fkindname, Long fpid, String fisasset, String fstatus, Integer fisleaf,String funit) {
        this.fkindname = fkindname;
        this.fpid = fpid;
        this.fisasset = fisasset;
        this.fstatus = fstatus;
        this.funit = funit;
        this.fisleaf = fisleaf;
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
    
    @Column(name="fkindname", nullable=false, length=64)

    public String getFkindname() {
        return this.fkindname;
    }
    
    public void setFkindname(String fkindname) {
        this.fkindname = fkindname;
    }
    
    @Column(name="fpid")

    public Long getFpid() {
        return this.fpid;
    }
    
    public void setFpid(Long fpid) {
        this.fpid = fpid;
    }
    
    @Column(name="fisasset", length=8)

    public String getFisasset() {
        return this.fisasset;
    }
    
    public void setFisasset(String fisasset) {
        this.fisasset = fisasset;
    }
    
    @Column(name="fstatus", length=8)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fisleaf")

    public Integer getFisleaf() {
        return this.fisleaf;
    }
    
    public void setFisleaf(Integer fisleaf) {
        this.fisleaf = fisleaf;
    }

    @Column(name="funit")
    
	public String getFunit() {
		return funit;
	}

	public void setFunit(String funit) {
		this.funit = funit;
	}

	
    @Column(name="fcode")
	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
   








}