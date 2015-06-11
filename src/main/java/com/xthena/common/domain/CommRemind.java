package com.xthena.common.domain;
// default package

import javax.persistence.*;
import java.sql.Timestamp;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * CommRemind entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_comm_remind"
        , catalog = "xhf"
)

public class CommRemind implements java.io.Serializable {


    // Fields    

    private Long fid;
    private String fname;
    private Long fremindry;
    private Timestamp fexpiretime;
    private Timestamp fremindtime;
    private String fstatus;
    private String fremindcontent;
    private Long fconfid;
    private Integer fremindcont;
    private Integer ftimes;
    private String fremindurl;
    private Long fdataid;


    // Constructors

    /**
     * default constructor
     */
    public CommRemind() {
    }


    /**
     * full constructor
     */
    public CommRemind(String fname, Long fremindry, Timestamp fexpiretime, Timestamp fremindtime, String fstatus, String fremindcontent, Long fconfid, Integer fremindcont, Integer ftimes, String fremindurl, Long fdataid) {
        this.fname = fname;
        this.fremindry = fremindry;
        this.fexpiretime = fexpiretime;
        this.fremindtime = fremindtime;
        this.fstatus = fstatus;
        this.fremindcontent = fremindcontent;
        this.fconfid = fconfid;
        this.fremindcont = fremindcont;
        this.ftimes = ftimes;
        this.fremindurl = fremindurl;
        this.fdataid = fdataid;
    }


    // Property accessors
    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "fid", unique = true, nullable = false)

    public Long getFid() {
        return this.fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Column(name = "fname", length = 64)

    public String getFname() {
        return this.fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Column(name = "fremindry")

    public Long getFremindry() {
        return this.fremindry;
    }

    public void setFremindry(Long fremindry) {
        this.fremindry = fremindry;
    }

    @Column(name = "fexpiretime", length = 19)

    public Timestamp getFexpiretime() {
        return this.fexpiretime;
    }

    public void setFexpiretime(Timestamp fexpiretime) {
        this.fexpiretime = fexpiretime;
    }

    @Column(name = "fremindtime", length = 19)

    public Timestamp getFremindtime() {
        return this.fremindtime;
    }

    public void setFremindtime(Timestamp fremindtime) {
        this.fremindtime = fremindtime;
    }

    @Column(name = "fstatus", length = 64)

    public String getFstatus() {
        return this.fstatus;
    }

    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }

    @Column(name = "fremindcontent", length = 500)

    public String getFremindcontent() {
        return this.fremindcontent;
    }

    public void setFremindcontent(String fremindcontent) {
        this.fremindcontent = fremindcontent;
    }

    @Column(name = "fconfid")

    public Long getFconfid() {
        return this.fconfid;
    }

    public void setFconfid(Long fconfid) {
        this.fconfid = fconfid;
    }

    @Column(name = "fremindcont")

    public Integer getFremindcont() {
        return this.fremindcont;
    }

    public void setFremindcont(Integer fremindcont) {
        this.fremindcont = fremindcont;
    }

    @Column(name = "ftimes")

    public Integer getFtimes() {
        return this.ftimes;
    }

    public void setFtimes(Integer ftimes) {
        this.ftimes = ftimes;
    }

    @Column(name = "fremindurl", length = 500)

    public String getFremindurl() {
        return this.fremindurl;
    }

    public void setFremindurl(String fremindurl) {
        this.fremindurl = fremindurl;
    }

    @Column(name = "fdataid")

    public Long getFdataid() {
        return this.fdataid;
    }

    public void setFdataid(Long fdataid) {
        this.fdataid = fdataid;
    }


}