package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjHtly entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_htly"
        , catalog = "xhf"
)

public class PjHtlyV implements java.io.Serializable {


    // Fields

    private Long fid;
    private Long fxmid;
    private String fhtje;
    private String fsjzsr;
    private String flvyuelv;
    private String fpjjd;
    private String fmemo;
    private String fhtname;

    // Constructors

    /**
     * default constructor
     */
    public PjHtlyV() {
    }


    /**
     * full constructor
     */
    public PjHtlyV(Long fxmid, String fhtje, String fsjzsr, String flvyuelv, String fpjjd, String fmemo, String fhtname) {
        this.fxmid = fxmid;
        this.fhtje = fhtje;
        this.fsjzsr = fsjzsr;
        this.flvyuelv = flvyuelv;
        this.fpjjd = fpjjd;
        this.fmemo = fmemo;
        this.fhtname = fhtname;
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

    @Column(name = "fhtje", length = 64)

    public String getFhtje() {
        return this.fhtje;
    }

    public void setFhtje(String fhtje) {
        this.fhtje = fhtje;
    }

    @Column(name = "fsjzsr", length = 64)

    public String getFsjzsr() {
        return this.fsjzsr;
    }

    public void setFsjzsr(String fsjzsr) {
        this.fsjzsr = fsjzsr;
    }

    @Column(name = "flvyuelv", length = 64)

    public String getFlvyuelv() {
        return this.flvyuelv;
    }

    public void setFlvyuelv(String flvyuelv) {
        this.flvyuelv = flvyuelv;
    }

    @Column(name = "fpjjd", length = 64)

    public String getFpjjd() {
        return this.fpjjd;
    }

    public void setFpjjd(String fpjjd) {
        this.fpjjd = fpjjd;
    }

    @Column(name = "fmemo", length = 64)

    public String getFmemo() {
        return this.fmemo;
    }

    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }

    @Column(name = "fhtname", length = 512)

    public String getFhtname() {
        return this.fhtname;
    }

    public void setFhtname(String fhtname) {
        this.fhtname = fhtname;
    }
}