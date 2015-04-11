package com.xthena.common.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CommCfilds entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_cfileds"
    ,catalog="xhf"
)

public class CommCfilds  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fcode;
     private String fname;
     private Long ftype;
     private String fvalues;
     private String fdvalue;
     private Integer fisshow;
     private String forderstr;
     private Integer flength;
     private String fcname;
     private Integer freqired;
     private Integer fissys;
     private Integer fcolwidth;
     private Integer fheight;
     private Integer fisgridshow;
     private Integer fgridwidth;
     private Integer fminlength;


    // Constructors

    /** default constructor */
    public CommCfilds() {
    }

    
    /** full constructor */
    public CommCfilds(String fcode, String fname, Long ftype, String fvalues, String fdvalue, Integer fisshow, String forderstr, Integer flength, String fcname, Integer freqired, Integer fissys, Integer fcolwidth, Integer fheight, Integer fisgridshow, Integer fgridwidth, Integer fminlength) {
        this.fcode = fcode;
        this.fname = fname;
        this.ftype = ftype;
        this.fvalues = fvalues;
        this.fdvalue = fdvalue;
        this.fisshow = fisshow;
        this.forderstr = forderstr;
        this.flength = flength;
        this.fcname = fcname;
        this.freqired = freqired;
        this.fissys = fissys;
        this.fcolwidth = fcolwidth;
        this.fheight = fheight;
        this.fisgridshow = fisgridshow;
        this.fgridwidth = fgridwidth;
        this.fminlength = fminlength;
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
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="fname", length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="ftype")

    public Long getFtype() {
        return this.ftype;
    }
    
    public void setFtype(Long ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fvalues", length=1024)

    public String getFvalues() {
        return this.fvalues;
    }
    
    public void setFvalues(String fvalues) {
        this.fvalues = fvalues;
    }
    
    @Column(name="fdvalue")

    public String getFdvalue() {
        return this.fdvalue;
    }
    
    public void setFdvalue(String fdvalue) {
        this.fdvalue = fdvalue;
    }
    
    @Column(name="fisshow")

    public Integer getFisshow() {
        return this.fisshow;
    }
    
    public void setFisshow(Integer fisshow) {
        this.fisshow = fisshow;
    }
    
    @Column(name="forderstr", length=64)

    public String getForderstr() {
        return this.forderstr;
    }
    
    public void setForderstr(String forderstr) {
        this.forderstr = forderstr;
    }
    
    @Column(name="flength")

    public Integer getFlength() {
        return this.flength;
    }
    
    public void setFlength(Integer flength) {
        this.flength = flength;
    }
    
    @Column(name="fcname", length=64)

    public String getFcname() {
        return this.fcname;
    }
    
    public void setFcname(String fcname) {
        this.fcname = fcname;
    }
    
    @Column(name="freqired")

    public Integer getFreqired() {
        return this.freqired;
    }
    
    public void setFreqired(Integer freqired) {
        this.freqired = freqired;
    }
    
    @Column(name="fissys")

    public Integer getFissys() {
        return this.fissys;
    }
    
    public void setFissys(Integer fissys) {
        this.fissys = fissys;
    }
    
    @Column(name="fcolwidth")

    public Integer getFcolwidth() {
        return this.fcolwidth;
    }
    
    public void setFcolwidth(Integer fcolwidth) {
        this.fcolwidth = fcolwidth;
    }
    
    @Column(name="fheight")

    public Integer getFheight() {
        return this.fheight;
    }
    
    public void setFheight(Integer fheight) {
        this.fheight = fheight;
    }
    
    @Column(name="fisgridshow")

    public Integer getFisgridshow() {
        return this.fisgridshow;
    }
    
    public void setFisgridshow(Integer fisgridshow) {
        this.fisgridshow = fisgridshow;
    }
    
    @Column(name="fgridwidth")

    public Integer getFgridwidth() {
        return this.fgridwidth;
    }
    
    public void setFgridwidth(Integer fgridwidth) {
        this.fgridwidth = fgridwidth;
    }
    
    @Column(name="fminlength")

    public Integer getFminlength() {
        return this.fminlength;
    }
    
    public void setFminlength(Integer fminlength) {
        this.fminlength = fminlength;
    }
   








}