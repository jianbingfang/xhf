package com.xthena.common.domain;
// default package

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommRemindLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_remind_log"
    ,catalog="xhf"
)

public class CommRemindLog  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private Long fremindry;
     private Timestamp fremindtime;
     private String fstatus;
     private Timestamp fnexttime;
     private String fremindcontent;
     private Long fremindid;
     private String fremindurl;


    // Constructors

    /** default constructor */
    public CommRemindLog() {
    }

    
    /** full constructor */
    public CommRemindLog(String fname, Long fremindry, Timestamp fremindtime, String fstatus, Timestamp fnexttime, String fremindcontent, Long fremindid, String fremindurl) {
        this.fname = fname;
        this.fremindry = fremindry;
        this.fremindtime = fremindtime;
        this.fstatus = fstatus;
        this.fnexttime = fnexttime;
        this.fremindcontent = fremindcontent;
        this.fremindid = fremindid;
        this.fremindurl = fremindurl;
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
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fremindry")

    public Long getFremindry() {
        return this.fremindry;
    }
    
    public void setFremindry(Long fremindry) {
        this.fremindry = fremindry;
    }
    
    @Column(name="fremindtime", length=19)

    public Timestamp getFremindtime() {
        return this.fremindtime;
    }
    
    public void setFremindtime(Timestamp fremindtime) {
        this.fremindtime = fremindtime;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fnexttime", length=19)

    public Timestamp getFnexttime() {
        return this.fnexttime;
    }
    
    public void setFnexttime(Timestamp fnexttime) {
        this.fnexttime = fnexttime;
    }
    
    @Column(name="fremindcontent", length=500)

    public String getFremindcontent() {
        return this.fremindcontent;
    }
    
    public void setFremindcontent(String fremindcontent) {
        this.fremindcontent = fremindcontent;
    }
    
    @Column(name="fremindid")

    public Long getFremindid() {
        return this.fremindid;
    }
    
    public void setFremindid(Long fremindid) {
        this.fremindid = fremindid;
    }
    
    @Column(name="fremindurl", length=500)

    public String getFremindurl() {
        return this.fremindurl;
    }
    
    public void setFremindurl(String fremindurl) {
        this.fremindurl = fremindurl;
    }
   








}