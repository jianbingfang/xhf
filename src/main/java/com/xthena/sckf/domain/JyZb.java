package com.xthena.sckf.domain;
// default package

import java.sql.Timestamp;
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
 * JyZb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_zb"
    ,catalog="xhf"
)

public class JyZb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fzbwjbh;
     private Timestamp fkbdate;
     private String fsfkbtx;
     private Timestamp fzzsj;
     private String fzzsjtx;
     private Long fbzjje;
     private Date fenddate;
     private Integer fzbds;
     private Integer fstbd;
     private Integer fzjdc;
     private Integer ffrdc;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private Long fbmid;


    // Constructors

    /** default constructor */
    public JyZb() {
    }

    
    /** full constructor */
    public JyZb(String fzbwjbh, Timestamp fkbdate, String fsfkbtx, Timestamp fzzsj, String fzzsjtx, Long fbzjje, Date fenddate, Integer fzbds, Integer fstbd, Integer fzjdc, Integer ffrdc, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, Long fbmid) {
        this.fzbwjbh = fzbwjbh;
        this.fkbdate = fkbdate;
        this.fsfkbtx = fsfkbtx;
        this.fzzsj = fzzsj;
        this.fzzsjtx = fzzsjtx;
        this.fbzjje = fbzjje;
        this.fenddate = fenddate;
        this.fzbds = fzbds;
        this.fstbd = fstbd;
        this.fzjdc = fzjdc;
        this.ffrdc = ffrdc;
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
    
    @Column(name="fzbwjbh", length=128)

    public String getFzbwjbh() {
        return this.fzbwjbh;
    }
    
    public void setFzbwjbh(String fzbwjbh) {
        this.fzbwjbh = fzbwjbh;
    }
    
    @Column(name="fkbdate", length=19)

    public Timestamp getFkbdate() {
        return this.fkbdate;
    }
    
    public void setFkbdate(Timestamp fkbdate) {
        this.fkbdate = fkbdate;
    }
    
    @Column(name="fsfkbtx", length=64)

    public String getFsfkbtx() {
        return this.fsfkbtx;
    }
    
    public void setFsfkbtx(String fsfkbtx) {
        this.fsfkbtx = fsfkbtx;
    }
    
    @Column(name="fzzsj", length=19)

    public Timestamp getFzzsj() {
        return this.fzzsj;
    }
    
    public void setFzzsj(Timestamp fzzsj) {
        this.fzzsj = fzzsj;
    }
    
    @Column(name="fzzsjtx", length=64)

    public String getFzzsjtx() {
        return this.fzzsjtx;
    }
    
    public void setFzzsjtx(String fzzsjtx) {
        this.fzzsjtx = fzzsjtx;
    }
    
    @Column(name="fbzjje")

    public Long getFbzjje() {
        return this.fbzjje;
    }
    
    public void setFbzjje(Long fbzjje) {
        this.fbzjje = fbzjje;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fenddate", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    
    @Column(name="fzbds")

    public Integer getFzbds() {
        return this.fzbds;
    }
    
    public void setFzbds(Integer fzbds) {
        this.fzbds = fzbds;
    }
    
    @Column(name="fstbd")

    public Integer getFstbd() {
        return this.fstbd;
    }
    
    public void setFstbd(Integer fstbd) {
        this.fstbd = fstbd;
    }
    
    @Column(name="fzjdc")

    public Integer getFzjdc() {
        return this.fzjdc;
    }
    
    public void setFzjdc(Integer fzjdc) {
        this.fzjdc = fzjdc;
    }
    
    @Column(name="ffrdc")

    public Integer getFfrdc() {
        return this.ffrdc;
    }
    
    public void setFfrdc(Integer ffrdc) {
        this.ffrdc = ffrdc;
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