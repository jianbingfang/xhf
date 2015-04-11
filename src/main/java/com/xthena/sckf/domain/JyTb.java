package com.xthena.sckf.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JyTb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_tb"
    ,catalog="xhf"
)

public class JyTb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftbwjbh;
     private Integer fzbfs;
     private Integer ffbfs;
     private Integer fdzbfs;
     private String ftbts;
     private String fispass;
     private Long fpingshenren;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private Long fbmid;


    // Constructors

    /** default constructor */
    public JyTb() {
    }

    
    /** full constructor */
    public JyTb(String ftbwjbh, Integer fzbfs, Integer ffbfs, Integer fdzbfs, String ftbts, String fispass, Long fpingshenren, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, Long fbmid) {
        this.ftbwjbh = ftbwjbh;
        this.fzbfs = fzbfs;
        this.ffbfs = ffbfs;
        this.fdzbfs = fdzbfs;
        this.ftbts = ftbts;
        this.fispass = fispass;
        this.fpingshenren = fpingshenren;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fbmid = fbmid;
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
    
    @Column(name="ftbwjbh", length=64)

    public String getFtbwjbh() {
        return this.ftbwjbh;
    }
    
    public void setFtbwjbh(String ftbwjbh) {
        this.ftbwjbh = ftbwjbh;
    }
    
    @Column(name="fzbfs")

    public Integer getFzbfs() {
        return this.fzbfs;
    }
    
    public void setFzbfs(Integer fzbfs) {
        this.fzbfs = fzbfs;
    }
    
    @Column(name="ffbfs")

    public Integer getFfbfs() {
        return this.ffbfs;
    }
    
    public void setFfbfs(Integer ffbfs) {
        this.ffbfs = ffbfs;
    }
    
    @Column(name="fdzbfs")

    public Integer getFdzbfs() {
        return this.fdzbfs;
    }
    
    public void setFdzbfs(Integer fdzbfs) {
        this.fdzbfs = fdzbfs;
    }
    
    @Column(name="ftbts", length=64)

    public String getFtbts() {
        return this.ftbts;
    }
    
    public void setFtbts(String ftbts) {
        this.ftbts = ftbts;
    }
    
    @Column(name="fispass", length=64)

    public String getFispass() {
        return this.fispass;
    }
    
    public void setFispass(String fispass) {
        this.fispass = fispass;
    }
    
    @Column(name="fpingshenren")

    public Long getFpingshenren() {
        return this.fpingshenren;
    }
    
    public void setFpingshenren(Long fpingshenren) {
        this.fpingshenren = fpingshenren;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=500)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=500)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=500)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="fmemo4", length=500)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="fbmid")

    public Long getFbmid() {
        return this.fbmid;
    }
    
    public void setFbmid(Long fbmid) {
        this.fbmid = fbmid;
    }
   








}