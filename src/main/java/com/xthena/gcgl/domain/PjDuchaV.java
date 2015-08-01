package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjDucha entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_ducha"
        , catalog = "xhf"
)

public class PjDuchaV implements java.io.Serializable {


    // Fields

    private Long fid;
    private String fcheckno;
    private Long fxmid;
    private Long fcheckerid;
    private Date fdate;
    private String fgoal;
    private String fproblem;
    private String fmemo;

    private String fname;
    private String fxmname;


    // Constructors

    /**
     * default constructor
     */
    public PjDuchaV() {
    }


    /**
     * full constructor
     */
    public PjDuchaV(String fcheckno, Long fxmid, Long fcheckerid, Date fdate, String fgoal, String fproblem, String fmemo, String fname, String fxmname) {
        this.fcheckno = fcheckno;
        this.fxmid = fxmid;
        this.fcheckerid = fcheckerid;
        this.fdate = fdate;
        this.fgoal = fgoal;
        this.fproblem = fproblem;
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

    @Column(name = "fcheckno", length = 64)

    public String getFcheckno() {
        return this.fcheckno;
    }

    public void setFcheckno(String fcheckno) {
        this.fcheckno = fcheckno;
    }

    @Column(name = "fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }

    @Column(name = "fcheckerid")

    public Long getFcheckerid() {
        return this.fcheckerid;
    }

    public void setFcheckerid(Long fcheckerid) {
        this.fcheckerid = fcheckerid;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fdate", length = 10)

    public Date getFdate() {
        return this.fdate;
    }

    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }

    @Column(name = "fgoal", length = 64)

    public String getFgoal() {
        return this.fgoal;
    }

    public void setFgoal(String fgoal) {
        this.fgoal = fgoal;
    }

    @Column(name = "fproblem", length = 500)

    public String getFproblem() {
        return this.fproblem;
    }

    public void setFproblem(String fproblem) {
        this.fproblem = fproblem;
    }

    @Column(name = "fmemo", length = 500)

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