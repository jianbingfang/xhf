package com.xthena.common.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommRemindConf entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_remind_conf"
    ,catalog="xhf"
)

public class CommRemindConf  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fname;
     private String fbeforeunit;
     private Integer fbeforeval;
     private String fremindtytype;
     private Long fremindry;
     private String fintervalunit;
     private Integer finterval;
     private Integer ftimes;
     private String fcontent;
     private String fsql;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fexpireunit;
     private String fremindurl;
     private Integer fexpireval;
     private String fexpiresql;


    // Constructors

    /** default constructor */
    public CommRemindConf() {
    }

    
    /** full constructor */
    public CommRemindConf(String fname, String fbeforeunit, Integer fbeforeval, String fremindtytype, Long fremindry, String fintervalunit, Integer finterval, Integer ftimes, String fcontent, String fsql, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fexpireunit, String fremindurl, Integer fexpireval, String fexpiresql) {
        this.fname = fname;
        this.fbeforeunit = fbeforeunit;
        this.fbeforeval = fbeforeval;
        this.fremindtytype = fremindtytype;
        this.fremindry = fremindry;
        this.fintervalunit = fintervalunit;
        this.finterval = finterval;
        this.ftimes = ftimes;
        this.fcontent = fcontent;
        this.fsql = fsql;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fexpireunit = fexpireunit;
        this.fremindurl = fremindurl;
        this.fexpireval = fexpireval;
        this.fexpiresql = fexpiresql;
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
    
    @Column(name="fbeforeunit", length=64)

    public String getFbeforeunit() {
        return this.fbeforeunit;
    }
    
    public void setFbeforeunit(String fbeforeunit) {
        this.fbeforeunit = fbeforeunit;
    }
    
    @Column(name="fbeforeval")

    public Integer getFbeforeval() {
        return this.fbeforeval;
    }
    
    public void setFbeforeval(Integer fbeforeval) {
        this.fbeforeval = fbeforeval;
    }
    
    @Column(name="fremindtytype", length=64)

    public String getFremindtytype() {
        return this.fremindtytype;
    }
    
    public void setFremindtytype(String fremindtytype) {
        this.fremindtytype = fremindtytype;
    }
    
    @Column(name="fremindry")

    public Long getFremindry() {
        return this.fremindry;
    }
    
    public void setFremindry(Long fremindry) {
        this.fremindry = fremindry;
    }
    
    @Column(name="fintervalunit", length=20)

    public String getFintervalunit() {
        return this.fintervalunit;
    }
    
    public void setFintervalunit(String fintervalunit) {
        this.fintervalunit = fintervalunit;
    }
    
    @Column(name="finterval")

    public Integer getFinterval() {
        return this.finterval;
    }
    
    public void setFinterval(Integer finterval) {
        this.finterval = finterval;
    }
    
    @Column(name="ftimes")

    public Integer getFtimes() {
        return this.ftimes;
    }
    
    public void setFtimes(Integer ftimes) {
        this.ftimes = ftimes;
    }
    
    @Column(name="fcontent", length=1024)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="fsql", length=4000)

    public String getFsql() {
        return this.fsql;
    }
    
    public void setFsql(String fsql) {
        this.fsql = fsql;
    }
    
    @Column(name="fmemo", length=64)

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
    
    @Column(name="fexpireunit", length=64)

    public String getFexpireunit() {
        return this.fexpireunit;
    }
    
    public void setFexpireunit(String fexpireunit) {
        this.fexpireunit = fexpireunit;
    }
    
    @Column(name="fremindurl", length=500)

    public String getFremindurl() {
        return this.fremindurl;
    }
    
    public void setFremindurl(String fremindurl) {
        this.fremindurl = fremindurl;
    }
    
    @Column(name="fexpireval")

    public Integer getFexpireval() {
        return this.fexpireval;
    }
    
    public void setFexpireval(Integer fexpireval) {
        this.fexpireval = fexpireval;
    }
    
    @Column(name="fexpiresql", length=4000)

    public String getFexpiresql() {
        return this.fexpiresql;
    }
    
    public void setFexpiresql(String fexpiresql) {
        this.fexpiresql = fexpiresql;
    }
   








}