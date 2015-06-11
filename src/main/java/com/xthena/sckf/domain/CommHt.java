package com.xthena.sckf.domain;
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
 * CommHt entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_comm_hetong"
    ,catalog="xhf"
)

public class CommHt  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fxmid;
     private String fhetongno;
     private String fhtname;
     private Date fstartdate;
     private Date fenddate;
     private String fhtqi;
     private String fprojecttype;
     private String ftotalMoney;
     private String fscale;
     private String fpaytype;
     private String fgettype;
     private String fjiafang;
     private Double fjianlifei;
     private String fjianlifeilv;
     private String fzkstate;
     private String fguimo;
     private Long fqicaoren;
     private Date fqicaodate;
     private Long fqiandingren;
     private Date fqiandingdate;
     private String fqiandingstatus;
     private String fprovince;
     private String fcity;
     private String fadrr;
     private Long ftanpanren;
     private String ftouzie;
     private String fywtype;
     private String fyezhuhetongno;
     private String fyezhuname;
     private Long fyifang;
     private Long fzhubanren;
     private Long fzongjian;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fcwfzwz;
     private String fxzfzwz;
     private String fgcfzwz;
     private String fjsstate;
     private String fwgstate;
     private String ftaskid;
     private String fstatus;
     private String fcwstatus;
     private String fbgsstatus;
     private String fgcbstatus;
     private String fisf;
     private String fzjcns;
     private String fmbzrs;


    // Constructors

    /** default constructor */
    public CommHt() {
    }

    
    /** full constructor */
    public CommHt(Long fxmid, String fhetongno, String fhtname, Date fstartdate, Date fenddate, String fhtqi, String fprojecttype, String ftotalMoney, String fscale, String fpaytype, String fgettype, String fjiafang, Double fjianlifei, String fjianlifeilv, String fzkstate, String fguimo, Long fqicaoren, Date fqicaodate, Long fqiandingren, Date fqiandingdate, String fqiandingstatus, String fprovince, String fcity, String fadrr, Long ftanpanren, String ftouzie, String fywtype, String fyezhuhetongno, String fyezhuname, Long fyifang, Long fzhubanren, Long fzongjian, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fcwfzwz, String fxzfzwz, String fgcfzwz, String fjsstate, String fwgstate, String ftaskid, String fstatus, String fcwstatus, String fbgsstatus, String fgcbstatus, String fisf, String fzjcns, String fmbzrs) {
        this.fxmid = fxmid;
        this.fhetongno = fhetongno;
        this.fhtname = fhtname;
        this.fstartdate = fstartdate;
        this.fenddate = fenddate;
        this.fhtqi = fhtqi;
        this.fprojecttype = fprojecttype;
        this.ftotalMoney = ftotalMoney;
        this.fscale = fscale;
        this.fpaytype = fpaytype;
        this.fgettype = fgettype;
        this.fjiafang = fjiafang;
        this.fjianlifei = fjianlifei;
        this.fjianlifeilv = fjianlifeilv;
        this.fzkstate = fzkstate;
        this.fguimo = fguimo;
        this.fqicaoren = fqicaoren;
        this.fqicaodate = fqicaodate;
        this.fqiandingren = fqiandingren;
        this.fqiandingdate = fqiandingdate;
        this.fqiandingstatus = fqiandingstatus;
        this.fprovince = fprovince;
        this.fcity = fcity;
        this.fadrr = fadrr;
        this.ftanpanren = ftanpanren;
        this.ftouzie = ftouzie;
        this.fywtype = fywtype;
        this.fyezhuhetongno = fyezhuhetongno;
        this.fyezhuname = fyezhuname;
        this.fyifang = fyifang;
        this.fzhubanren = fzhubanren;
        this.fzongjian = fzongjian;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fcwfzwz = fcwfzwz;
        this.fxzfzwz = fxzfzwz;
        this.fgcfzwz = fgcfzwz;
        this.fjsstate = fjsstate;
        this.fwgstate = fwgstate;
        this.ftaskid = ftaskid;
        this.fstatus = fstatus;
        this.fcwstatus = fcwstatus;
        this.fbgsstatus = fbgsstatus;
        this.fgcbstatus = fgcbstatus;
        this.fisf = fisf;
        this.fzjcns = fzjcns;
        this.fmbzrs = fmbzrs;
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
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fhetongno", length=64)

    public String getFhetongno() {
        return this.fhetongno;
    }
    
    public void setFhetongno(String fhetongno) {
        this.fhetongno = fhetongno;
    }
    
    @Column(name="fhtname", length=512)

    public String getFhtname() {
        return this.fhtname;
    }
    
    public void setFhtname(String fhtname) {
        this.fhtname = fhtname;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fstartdate", length=10)

    public Date getFstartdate() {
        return this.fstartdate;
    }
    
    public void setFstartdate(Date fstartdate) {
        this.fstartdate = fstartdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fenddate", length=10)

    public Date getFenddate() {
        return this.fenddate;
    }
    
    public void setFenddate(Date fenddate) {
        this.fenddate = fenddate;
    }
    
    @Column(name="fhtqi", length=200)

    public String getFhtqi() {
        return this.fhtqi;
    }
    
    public void setFhtqi(String fhtqi) {
        this.fhtqi = fhtqi;
    }
    
    @Column(name="fprojecttype", length=64)

    public String getFprojecttype() {
        return this.fprojecttype;
    }
    
    public void setFprojecttype(String fprojecttype) {
        this.fprojecttype = fprojecttype;
    }
    
    @Column(name="ftotalMoney", length=64)

    public String getFtotalMoney() {
        return this.ftotalMoney;
    }
    
    public void setFtotalMoney(String ftotalMoney) {
        this.ftotalMoney = ftotalMoney;
    }
    
    @Column(name="fscale", length=500)

    public String getFscale() {
        return this.fscale;
    }
    
    public void setFscale(String fscale) {
        this.fscale = fscale;
    }
    
    @Column(name="fpaytype", length=4000)

    public String getFpaytype() {
        return this.fpaytype;
    }
    
    public void setFpaytype(String fpaytype) {
        this.fpaytype = fpaytype;
    }
    
    @Column(name="fgettype", length=64)

    public String getFgettype() {
        return this.fgettype;
    }
    
    public void setFgettype(String fgettype) {
        this.fgettype = fgettype;
    }
    
    @Column(name="fjiafang", length=64)

    public String getFjiafang() {
        return this.fjiafang;
    }
    
    public void setFjiafang(String fjiafang) {
        this.fjiafang = fjiafang;
    }
    
    @Column(name="fjianlifei", precision=20, scale=6)

    public Double getFjianlifei() {
        return this.fjianlifei;
    }
    
    public void setFjianlifei(Double fjianlifei) {
        this.fjianlifei = fjianlifei;
    }
    
    @Column(name="fjianlifeilv", length=64)

    public String getFjianlifeilv() {
        return this.fjianlifeilv;
    }
    
    public void setFjianlifeilv(String fjianlifeilv) {
        this.fjianlifeilv = fjianlifeilv;
    }
    
    @Column(name="fzkstate", length=64)

    public String getFzkstate() {
        return this.fzkstate;
    }
    
    public void setFzkstate(String fzkstate) {
        this.fzkstate = fzkstate;
    }
    
    @Column(name="fguimo", length=64)

    public String getFguimo() {
        return this.fguimo;
    }
    
    public void setFguimo(String fguimo) {
        this.fguimo = fguimo;
    }
    
    @Column(name="fqicaoren")

    public Long getFqicaoren() {
        return this.fqicaoren;
    }
    
    public void setFqicaoren(Long fqicaoren) {
        this.fqicaoren = fqicaoren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fqicaodate", length=10)

    public Date getFqicaodate() {
        return this.fqicaodate;
    }
    
    public void setFqicaodate(Date fqicaodate) {
        this.fqicaodate = fqicaodate;
    }
    
    @Column(name="fqiandingren")

    public Long getFqiandingren() {
        return this.fqiandingren;
    }
    
    public void setFqiandingren(Long fqiandingren) {
        this.fqiandingren = fqiandingren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fqiandingdate", length=10)

    public Date getFqiandingdate() {
        return this.fqiandingdate;
    }
    
    public void setFqiandingdate(Date fqiandingdate) {
        this.fqiandingdate = fqiandingdate;
    }
    
    @Column(name="fqiandingstatus", length=64)

    public String getFqiandingstatus() {
        return this.fqiandingstatus;
    }
    
    public void setFqiandingstatus(String fqiandingstatus) {
        this.fqiandingstatus = fqiandingstatus;
    }
    
    @Column(name="fprovince", length=64)

    public String getFprovince() {
        return this.fprovince;
    }
    
    public void setFprovince(String fprovince) {
        this.fprovince = fprovince;
    }
    
    @Column(name="fcity", length=64)

    public String getFcity() {
        return this.fcity;
    }
    
    public void setFcity(String fcity) {
        this.fcity = fcity;
    }
    
    @Column(name="fadrr", length=64)

    public String getFadrr() {
        return this.fadrr;
    }
    
    public void setFadrr(String fadrr) {
        this.fadrr = fadrr;
    }
    
    @Column(name="ftanpanren")

    public Long getFtanpanren() {
        return this.ftanpanren;
    }
    
    public void setFtanpanren(Long ftanpanren) {
        this.ftanpanren = ftanpanren;
    }
    
    @Column(name="ftouzie", length=64)

    public String getFtouzie() {
        return this.ftouzie;
    }
    
    public void setFtouzie(String ftouzie) {
        this.ftouzie = ftouzie;
    }
    
    @Column(name="fywtype", length=64)

    public String getFywtype() {
        return this.fywtype;
    }
    
    public void setFywtype(String fywtype) {
        this.fywtype = fywtype;
    }
    
    @Column(name="fyezhuhetongno", length=64)

    public String getFyezhuhetongno() {
        return this.fyezhuhetongno;
    }
    
    public void setFyezhuhetongno(String fyezhuhetongno) {
        this.fyezhuhetongno = fyezhuhetongno;
    }
    
    @Column(name="fyezhuname", length=64)

    public String getFyezhuname() {
        return this.fyezhuname;
    }
    
    public void setFyezhuname(String fyezhuname) {
        this.fyezhuname = fyezhuname;
    }
    
    @Column(name="fyifang")

    public Long getFyifang() {
        return this.fyifang;
    }
    
    public void setFyifang(Long fyifang) {
        this.fyifang = fyifang;
    }
    
    @Column(name="fzhubanren")

    public Long getFzhubanren() {
        return this.fzhubanren;
    }
    
    public void setFzhubanren(Long fzhubanren) {
        this.fzhubanren = fzhubanren;
    }
    
    @Column(name="fzongjian")

    public Long getFzongjian() {
        return this.fzongjian;
    }
    
    public void setFzongjian(Long fzongjian) {
        this.fzongjian = fzongjian;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
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
    
    @Column(name="fcwfzwz", length=64)

    public String getFcwfzwz() {
        return this.fcwfzwz;
    }
    
    public void setFcwfzwz(String fcwfzwz) {
        this.fcwfzwz = fcwfzwz;
    }
    
    @Column(name="fxzfzwz", length=64)

    public String getFxzfzwz() {
        return this.fxzfzwz;
    }
    
    public void setFxzfzwz(String fxzfzwz) {
        this.fxzfzwz = fxzfzwz;
    }
    
    @Column(name="fgcfzwz", length=64)

    public String getFgcfzwz() {
        return this.fgcfzwz;
    }
    
    public void setFgcfzwz(String fgcfzwz) {
        this.fgcfzwz = fgcfzwz;
    }
    
    @Column(name="fjsstate", length=64)

    public String getFjsstate() {
        return this.fjsstate;
    }
    
    public void setFjsstate(String fjsstate) {
        this.fjsstate = fjsstate;
    }
    
    @Column(name="fwgstate", length=64)

    public String getFwgstate() {
        return this.fwgstate;
    }
    
    public void setFwgstate(String fwgstate) {
        this.fwgstate = fwgstate;
    }
    
    @Column(name="ftaskid", length=64)

    public String getFtaskid() {
        return this.ftaskid;
    }
    
    public void setFtaskid(String ftaskid) {
        this.ftaskid = ftaskid;
    }
    
    @Column(name="fstatus", length=64)

    public String getFstatus() {
        return this.fstatus;
    }
    
    public void setFstatus(String fstatus) {
        this.fstatus = fstatus;
    }
    
    @Column(name="fcwstatus", length=64)

    public String getFcwstatus() {
        return this.fcwstatus;
    }
    
    public void setFcwstatus(String fcwstatus) {
        this.fcwstatus = fcwstatus;
    }
    
    @Column(name="fbgsstatus", length=64)

    public String getFbgsstatus() {
        return this.fbgsstatus;
    }
    
    public void setFbgsstatus(String fbgsstatus) {
        this.fbgsstatus = fbgsstatus;
    }
    
    @Column(name="fgcbstatus", length=64)

    public String getFgcbstatus() {
        return this.fgcbstatus;
    }
    
    public void setFgcbstatus(String fgcbstatus) {
        this.fgcbstatus = fgcbstatus;
    }
    
    @Column(name="fisf", length=64)

    public String getFisf() {
        return this.fisf;
    }
    
    public void setFisf(String fisf) {
        this.fisf = fisf;
    }
    
    @Column(name="fzjcns", length=64)

    public String getFzjcns() {
        return this.fzjcns;
    }
    
    public void setFzjcns(String fzjcns) {
        this.fzjcns = fzjcns;
    }
    
    @Column(name="fmbzrs", length=64)

    public String getFmbzrs() {
        return this.fmbzrs;
    }
    
    public void setFmbzrs(String fmbzrs) {
        this.fmbzrs = fmbzrs;
    }
   

}