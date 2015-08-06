package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjJlf entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_jlf"
        , catalog = "xhf"
)

public class PjJlfV implements java.io.Serializable {


    // Fields

    private Long fid;
    private Long fxmid;
    private String fno;
    private String fhtjk;
    private String fbcht;
    private String fmemo;
    private String fxmname;

    // Constructors

    /**
     * default constructor
     */
    public PjJlfV() {
    }


    /**
     * full constructor
     */
    public PjJlfV(Long fxmid, String fno, String fhtjk, String fbcht, String fmemo, String fxmname) {
        this.fxmid = fxmid;
        this.fno = fno;
        this.fhtjk = fhtjk;
        this.fbcht = fbcht;
        this.fmemo = fmemo;
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

    @Column(name = "fno", length = 64)

    public String getFno() {
        return this.fno;
    }

    public void setFno(String fno) {
        this.fno = fno;
    }

    @Column(name = "fhtjk", length = 64)

    public String getFhtjk() {
        return this.fhtjk;
    }

    public void setFhtjk(String fhtjk) {
        this.fhtjk = fhtjk;
    }

    @Column(name = "fbcht", length = 64)

    public String getFbcht() {
        return this.fbcht;
    }

    public void setFbcht(String fbcht) {
        this.fbcht = fbcht;
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
}