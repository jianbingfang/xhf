package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

/**
 * PjBeian entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_beian"
        , catalog = "xhf"
)

public class PjBeianV implements java.io.Serializable {


    // Fields    

    private Long fid;
    private String fpjcode;
    private Long fxmid;
    private Date fbeiandate;
    private String fjingshouren;
    private String fmemo;
    private String fxmname;
    private Long fjingshourenid;

    private String ftel;
    private String fcydw;
    private String fbeiantype;

    // Constructors

    /**
     * default constructor
     */
    public PjBeianV() {
    }


    /**
     * full constructor
     */
    public PjBeianV(String fpjcode, Long fxmid, Date fbeiandate, String fjingshouren,
                    String fmemo, String fxmname, Long fjingshourenid, String ftel,
                    String fcydw, String fbeiantype) {
        this.fpjcode = fpjcode;
        this.fxmid = fxmid;
        this.fbeiandate = fbeiandate;
        this.fjingshouren = fjingshouren;
        this.fmemo = fmemo;
        this.fxmname = fxmname;
        this.fjingshourenid = fjingshourenid;
        this.ftel = ftel;
        this.fcydw = fcydw;
        this.fbeiantype = fbeiantype;
    }


    // Property accessors
    @Id
    @Column(name = "fid", unique = true, nullable = false)

    public Long getFid() {
        return this.fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    @Column(name = "fpjcode", length = 64)

    public String getFpjcode() {
        return this.fpjcode;
    }

    public void setFpjcode(String fpjcode) {
        this.fpjcode = fpjcode;
    }

    @Column(name = "fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fbeiandate", length = 10)

    public Date getFbeiandate() {
        return this.fbeiandate;
    }

    public void setFbeiandate(Date fbeiandate) {
        this.fbeiandate = fbeiandate;
    }

    @Column(name = "fjingshouren", length = 64)

    public String getFjingshouren() {
        return this.fjingshouren;
    }

    public void setFjingshouren(String fjingshouren) {
        this.fjingshouren = fjingshouren;
    }

    @Column(name = "fmemo", length = 500)

    public String getFmemo() {
        return this.fmemo;
    }

    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }

    @Column(name = "fxmname", length = 512)

    public String getFxmname() {
        return this.fxmname;
    }

    public void setFxmname(String fxmname) {
        this.fxmname = fxmname;
    }

    @Column(name = "fjingshourenid")

    public Long getFjingshourenid() {
        return this.fjingshourenid;
    }

    public void setFjingshourenid(Long fjingshourenid) {
        this.fjingshourenid = fjingshourenid;
    }

    @Column(name = "ftel", length = 32)

    public String getFtel() {
        return this.ftel;
    }

    public void setFtel(String ftel) {
        this.ftel = ftel;
    }

    @Column(name = "fcydw", length = 255)

    public String getFcydw() {
        return this.fcydw;
    }

    public void setFcydw(String fcydw) {
        this.fcydw = fcydw;
    }

    @Column(name = "fbeiantype", length = 255)

    public String getFbeiantype() {
        return this.fbeiantype;
    }

    public void setFbeiantype(String fbeiantype) {
        this.fbeiantype = fbeiantype;
    }
}