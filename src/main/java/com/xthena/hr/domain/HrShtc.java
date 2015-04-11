package com.xthena.hr.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * HrShtc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_hr_shtc"
    ,catalog="xhf"
)

public class HrShtc  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fryid;
     private String fzlurl;
     private String ftctype;
     private Date fstartdate;
     private String fjnjs;
     private String fbryj;
     private String fgsyj;
     private Date flastdate;
     private Long fjsr;
     private String femo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3 ;
     private String fmemo4;
     private String fmemo5;
     private String ftctypeyl;
     private Date fstartdateyl;
     private String fjnjsyl;
     private String fbryjyl;
     private String fgsyjyl;
     private Date flastdateyl;
     private String ftctypeyw;
     private Date fstartdateyw;
     private String fjnjsyw;
     private String fbryjyw;
     private String fgsyjyw;
     private Date flastdateyw;
     private String ftype;
     private Date fcreatedate;


    // Constructors

    /** default constructor */
    public HrShtc() {
    }

    
    /** full constructor */
    public HrShtc(Long fryid, String fzlurl, String ftctype, Date fstartdate, String fjnjs, String fbryj, String fgsyj, Date flastdate, Long fjsr, String femo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fmemo5, String ftctypeyl, Date fstartdateyl, String fjnjsyl, String fbryjyl, String fgsyjyl, Date flastdateyl, String ftctypeyw, Date fstartdateyw, String fjnjsyw, String fbryjyw, String fgsyjyw, Date flastdateyw, String ftype, Date fcreatedate) {
        this.fryid = fryid;
        this.fzlurl = fzlurl;
        this.ftctype = ftctype;
        this.fstartdate = fstartdate;
        this.fjnjs = fjnjs;
        this.fbryj = fbryj;
        this.fgsyj = fgsyj;
        this.flastdate = flastdate;
        this.fjsr = fjsr;
        this.femo = femo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fmemo5 = fmemo5;
        this.ftctypeyl = ftctypeyl;
        this.fstartdateyl = fstartdateyl;
        this.fjnjsyl = fjnjsyl;
        this.fbryjyl = fbryjyl;
        this.fgsyjyl = fgsyjyl;
        this.flastdateyl = flastdateyl;
        this.ftctypeyw = ftctypeyw;
        this.fstartdateyw = fstartdateyw;
        this.fjnjsyw = fjnjsyw;
        this.fbryjyw = fbryjyw;
        this.fgsyjyw = fgsyjyw;
        this.flastdateyw = flastdateyw;
        this.ftype = ftype;
        this.fcreatedate = fcreatedate;
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
    
    @Column(name="fryid")

    public Long getFryid() {
        return this.fryid;
    }
    
    public void setFryid(Long fryid) {
        this.fryid = fryid;
    }
    
    @Column(name="fzlurl", length=256)

    public String getFzlurl() {
        return this.fzlurl;
    }
    
    public void setFzlurl(String fzlurl) {
        this.fzlurl = fzlurl;
    }
    
    @Column(name="ftctype", length=64)

    public String getFtctype() {
        return this.ftctype;
    }
    
    public void setFtctype(String ftctype) {
        this.ftctype = ftctype;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdate", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    
    @Column(name="fjnjs", length=64)

    public String getFjnjs() {
        return this.fjnjs;
    }
    
    public void setFjnjs(String fjnjs) {
        this.fjnjs = fjnjs;
    }
    
    @Column(name="fbryj", length=64)

    public String getFbryj() {
        return this.fbryj;
    }
    
    public void setFbryj(String fbryj) {
        this.fbryj = fbryj;
    }
    
    @Column(name="fgsyj", length=64)

    public String getFgsyj() {
        return this.fgsyj;
    }
    
    public void setFgsyj(String fgsyj) {
        this.fgsyj = fgsyj;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flastdate", length=10)

    public Date getFlastdate() {
        return this.flastdate;
    }
    
    public void setFlastdate(Date flastdate) {
        this.flastdate = flastdate;
    }
    
    @Column(name="fjsr")

    public Long getFjsr() {
        return this.fjsr;
    }
    
    public void setFjsr(Long fjsr) {
        this.fjsr = fjsr;
    }
    
    @Column(name="femo", length=64)

    public String getFemo() {
        return this.femo;
    }
    
    public void setFemo(String femo) {
        this.femo = femo;
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
    
    @Column(name="fmemo5", length=64)

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
    
    @Column(name="ftctypeyl", length=64)

    public String getFtctypeyl() {
        return this.ftctypeyl;
    }
    
    public void setFtctypeyl(String ftctypeyl) {
        this.ftctypeyl = ftctypeyl;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdateyl", length=10)

    public Date getFstartdateyl() {
        return this.fstartdateyl;
    }
    
    public void setFstartdateyl(Date fstartdateyl) {
        this.fstartdateyl = fstartdateyl;
    }
    
    @Column(name="fjnjsyl", length=64)

    public String getFjnjsyl() {
        return this.fjnjsyl;
    }
    
    public void setFjnjsyl(String fjnjsyl) {
        this.fjnjsyl = fjnjsyl;
    }
    
    @Column(name="fbryjyl", length=64)

    public String getFbryjyl() {
        return this.fbryjyl;
    }
    
    public void setFbryjyl(String fbryjyl) {
        this.fbryjyl = fbryjyl;
    }
    
    @Column(name="fgsyjyl", length=64)

    public String getFgsyjyl() {
        return this.fgsyjyl;
    }
    
    public void setFgsyjyl(String fgsyjyl) {
        this.fgsyjyl = fgsyjyl;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flastdateyl", length=10)

    public Date getFlastdateyl() {
        return this.flastdateyl;
    }
    
    public void setFlastdateyl(Date flastdateyl) {
        this.flastdateyl = flastdateyl;
    }
    
    @Column(name="ftctypeyw", length=64)

    public String getFtctypeyw() {
        return this.ftctypeyw;
    }
    
    public void setFtctypeyw(String ftctypeyw) {
        this.ftctypeyw = ftctypeyw;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdateyw", length=10)

    public Date getFstartdateyw() {
        return this.fstartdateyw;
    }
    
    public void setFstartdateyw(Date fstartdateyw) {
        this.fstartdateyw = fstartdateyw;
    }
    
    @Column(name="fjnjsyw", length=64)

    public String getFjnjsyw() {
        return this.fjnjsyw;
    }
    
    public void setFjnjsyw(String fjnjsyw) {
        this.fjnjsyw = fjnjsyw;
    }
    
    @Column(name="fbryjyw", length=64)

    public String getFbryjyw() {
        return this.fbryjyw;
    }
    
    public void setFbryjyw(String fbryjyw) {
        this.fbryjyw = fbryjyw;
    }
    
    @Column(name="fgsyjyw", length=64)

    public String getFgsyjyw() {
        return this.fgsyjyw;
    }
    
    public void setFgsyjyw(String fgsyjyw) {
        this.fgsyjyw = fgsyjyw;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="flastdateyw", length=10)

    public Date getFlastdateyw() {
        return this.flastdateyw;
    }
    
    public void setFlastdateyw(Date flastdateyw) {
        this.flastdateyw = flastdateyw;
    }
    
    @Column(name="ftype", length=64)

    public String getFtype() {
        return this.ftype;
    }
    
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fcreatedate", length=10)

    public Date getFcreatedate() {
        return this.fcreatedate;
    }
    
    public void setFcreatedate(Date fcreatedate) {
        this.fcreatedate = fcreatedate;
    }
   








}