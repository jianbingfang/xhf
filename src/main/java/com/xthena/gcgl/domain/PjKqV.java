package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjKq entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_kq"
        , catalog = "xhf"
)

public class PjKqV implements java.io.Serializable {


    // Fields

    private Long fid;
    private String fkqno;
    private Long fxmid;
    private String fyearmonth;
    private Date fuploaddate;
    private Long fuploadid;
    private String fuploadry;
    private String fkqname;
    private String fkqurl;
    private String fstatus;
    private String fxmname;
    private String fryname;

    // Constructors

    /**
     * default constructor
     */
    public PjKqV() {
    }


    /**
     * full constructor
     */
    public PjKqV(String fkqno, Long fxmid, String fyearmonth, Date fuploaddate, Long fuploadid, String fuploadry, String fkqname, String fkqurl, String fstatus, String fxmname, String fryname) {
        this.fkqno = fkqno;
        this.fxmid = fxmid;
        this.fyearmonth = fyearmonth;
        this.fuploaddate = fuploaddate;
        this.fuploadid = fuploadid;
        this.fuploadry = fuploadry;
        this.fkqname = fkqname;
        this.fkqurl = fkqurl;
        this.fstatus = fstatus;
        this.fxmname = fxmname;
        this.fryname = fryname;
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

    @Column(name = "fkqno", length = 64)

    public String getFkqno() {
        return this.fkqno;
    }

    public void setFkqno(String fkqno) {
        this.fkqno = fkqno;
    }

    @Column(name = "fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }

    @Column(name = "fyearmonth", length = 64)

    public String getFyearmonth() {
        return this.fyearmonth;
    }

    public void setFyearmonth(String fyearmonth) {
        this.fyearmonth = fyearmonth;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fuploaddate", length = 10)

    public Date getFuploaddate() {
        return this.fuploaddate;
    }

    public void setFuploaddate(Date fuploaddate) {
        this.fuploaddate = fuploaddate;
    }

    @Column(name = "fuploadid")

    public Long getFuploadid() {
        return this.fuploadid;
    }

    public void setFuploadid(Long fuploadid) {
        this.fuploadid = fuploadid;
    }

    @Column(name = "fuploadry", length = 64)

    public String getFuploadry() {
        return this.fuploadry;
    }

    public void setFuploadry(String fuploadry) {
        this.fuploadry = fuploadry;
    }

    @Column(name = "fkqname", length = 64)

    public String getFkqname() {
        return this.fkqname;
    }

    public void setFkqname(String fkqname) {
        this.fkqname = fkqname;
    }

    @Column(name = "fkqurl", length = 500)

    public String getFkqurl() {
        return this.fkqurl;
    }

    public void setFkqurl(String fkqurl) {
        this.fkqurl = fkqurl;
    }

    @Column(name = "fstatus", length = 500)

    public String getFstatus() {
        return this.fstatus;
    }

    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }

    @Column(name = "fxmname", length = 512)

    public String getFxmname() {
        return this.fxmname;
    }

    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }

    @Column(name = "fryname", length = 64)

    public String getFryname() {
        return this.fryname;
    }

    public void setFryname(String fryname) {
        this.fryname = fryname;
    }
}