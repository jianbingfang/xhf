package com.xthena.gcgl.domain;
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
 * Pjjx entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_pjjx"
    ,catalog="xhf"
)

public class Pjjx  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fjxno;
     private String fjxqihao;
     private Date fjxdate;
     private String ffilename;
     private String ffileurl;
     private String fjingshouren;
     private Long fjingshourenid;
     private String fmemo;


    // Constructors

    /** default constructor */
    public Pjjx() {
    }

    
    /** full constructor */
    public Pjjx(String fjxno, String fjxqihao, Date fjxdate, String ffilename, String ffileurl, String fjingshouren, Long fjingshourenid, String fmemo) {
        this.fjxno = fjxno;
        this.fjxqihao = fjxqihao;
        this.fjxdate = fjxdate;
        this.ffilename = ffilename;
        this.ffileurl = ffileurl;
        this.fjingshouren = fjingshouren;
        this.fjingshourenid = fjingshourenid;
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
    
    @Column(name="fjxno", length=64)

    public String getFjxno() {
        return this.fjxno;
    }
    
    public void setFjxno(String fjxno) {
        this.fjxno = fjxno;
    }
    
    @Column(name="fjxqihao", length=64)

    public String getFjxqihao() {
        return this.fjxqihao;
    }
    
    public void setFjxqihao(String fjxqihao) {
        this.fjxqihao = fjxqihao;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fjxdate", length=10)

    public Date getFjxdate() {
        return this.fjxdate;
    }
    
    public void setFjxdate(Date fjxdate) {
        this.fjxdate = fjxdate;
    }
    
    @Column(name="ffilename", length=64)

    public String getFfilename() {
        return this.ffilename;
    }
    
    public void setFfilename(String ffilename) {
        this.ffilename = ffilename;
    }
    
    @Column(name="ffileurl", length=64)

    public String getFfileurl() {
        return this.ffileurl;
    }
    
    public void setFfileurl(String ffileurl) {
        this.ffileurl = ffileurl;
    }
    
    @Column(name="fjingshouren", length=64)

    public String getFjingshouren() {
        return this.fjingshouren;
    }
    
    public void setFjingshouren(String fjingshouren) {
        this.fjingshouren = fjingshouren;
    }
    
    @Column(name="fjingshourenid")

    public Long getFjingshourenid() {
        return this.fjingshourenid;
    }
    
    public void setFjingshourenid(Long fjingshourenid) {
        this.fjingshourenid = fjingshourenid;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}