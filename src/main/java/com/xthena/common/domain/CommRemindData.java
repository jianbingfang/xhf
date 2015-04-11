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
 * CommRemindData entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_remind_data"
    ,catalog="xhf"
)

public class CommRemindData  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fdataid;
     private String fstatus;
     private Long fconfid;
     private Timestamp freminddate;


    // Constructors

    /** default constructor */
    public CommRemindData() {
    }

    
    /** full constructor */
    public CommRemindData(String fdataid, String fstatus, Long fconfid, Timestamp freminddate) {
        this.fdataid = fdataid;
        this.fstatus = fstatus;
        this.fconfid = fconfid;
        this.freminddate = freminddate;
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
    
    @Column(name="fdataid", length=500)

    public String getFdataid() {
        return this.fdataid;
    }
    
    public void setFdataid(String fdataid) {
        this.fdataid = fdataid;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fconfid")

    public Long getFconfid() {
        return this.fconfid;
    }
    
    public void setFconfid(Long fconfid) {
        this.fconfid = fconfid;
    }
    
    @Column(name="freminddate", length=19)

    public Timestamp getFreminddate() {
        return this.freminddate;
    }
    
    public void setFreminddate(Timestamp freminddate) {
        this.freminddate = freminddate;
    }
   








}