package com.xthena.gcgl.domain;
// default package

import javax.persistence.*;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;


/**
 * PjVisit entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "v_pj_visit"
        , catalog = "xhf"
)

public class PjVisitV implements java.io.Serializable {


    // Fields

    private Long fid;
    private String fvisitno;
    private Long fxmid;
    private Date fvisitdate;
    private Long fry;
    private String fhfdate;

    private String fname;
    private String fxmname;

    // Constructors

    /**
     * default constructor
     */
    public PjVisitV() {
    }


    /**
     * full constructor
     */
    public PjVisitV(String fvisitno, Long fxmid, Date fvisitdate, Long fry, String fhfdate, String fname, String fxmname) {
        this.fvisitno = fvisitno;
        this.fxmid = fxmid;
        this.fvisitdate = fvisitdate;
        this.fry = fry;
        this.fhfdate = fhfdate;
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

    @Column(name = "fvisitno", length = 64)

    public String getFvisitno() {
        return this.fvisitno;
    }

    public void setFvisitno(String fvisitno) {
        this.fvisitno = fvisitno;
    }

    @Column(name = "fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }

    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fvisitdate", length = 10)

    public Date getFvisitdate() {
        return this.fvisitdate;
    }

    public void setFvisitdate(Date fvisitdate) {
        this.fvisitdate = fvisitdate;
    }

    @Column(name = "fry")

    public Long getFry() {
        return this.fry;
    }

    public void setFry(Long fry) {
        this.fry = fry;
    }

    @Column(name = "fhfdate", length = 500)

    public String getFhfdate() {
        return this.fhfdate;
    }

    public void setFhfdate(String fhfdate) {
        this.fhfdate = fhfdate;
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