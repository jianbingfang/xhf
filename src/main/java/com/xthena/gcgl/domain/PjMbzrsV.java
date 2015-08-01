package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjMbzrs entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_mbzes"
        , catalog = "xhf"
)

public class PjMbzrsV implements java.io.Serializable {


    // Fields

    private Long fid;
    private Long fxmid;
    private Long fryid;
    private Date fdate;
    private String fmemo;
    private String fname;
    private String fxmname;

    // Constructors

    /**
     * default constructor
     */
    public PjMbzrsV() {
    }


    /**
     * full constructor
     */
    public PjMbzrsV(Long fxmid, Long fryid, Date fdate, String fmemo, String fname, String fxmname) {
        this.fxmid = fxmid;
        this.fryid = fryid;
        this.fdate = fdate;
        this.fmemo = fmemo;
        this.fname = fname;
        this.fxmname = fxmname;
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

    @Column(name = "fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }

    @Column(name = "fryid")

    public Long getFryid() {
        return this.fryid;
    }

    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fdate", length = 10)

    public Date getFdate() {
        return this.fdate;
    }

    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }

    @Column(name = "fmemo", length = 512)

    public String getFmemo() {
        return this.fmemo;
    }

    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }

    @Column(name = "fname", length = 512)

    public String getFname() {
        return this.fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Column(name = "fxmname", length = 512)

    public String getFxmname() {
        return this.fxmname;
    }

    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }
}