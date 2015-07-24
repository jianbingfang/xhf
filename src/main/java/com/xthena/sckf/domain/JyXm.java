package com.xthena.sckf.domain;
// default package

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * JyXm entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_xm"
    ,catalog="xhf"
)

public class JyXm  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftype;
     private String fstate;
     private String fname;
     private String fxmgk;
     private String fprovince;
     private String fcity;
     private String fscale;
     private Double ftze;
     private String fjsdw;
     private String fzbdldw;
     private Long fweituoren;
     private String ffuzeren;
     private Date fbmksdate;
     private Date fbmjzdate;
     private String fbaomingren;
     private Date fbeiandate;
     private Long fzgyszbr;
     private Date fzgysdate;
     private String fzgysstatus;
     private Long fbeianry;
     private String fbeianstatus;
     private String fbeianname;
     private String fbeianurl;
     private String fisdaban;
     private String ftbwjbh;
     private Long fbszzren;
     private Integer fzbfs;
     private Integer ffbfs;
     private Integer fdzbfs;
     private String ftbts;
     private String fispass;
     private Long fzbgoumairen;
     private Date fzbgmdate;
     private String fzbwjbh;
     private Date fkbdate;
     private String fzzyq;
     private Long fbzjje;
     private Date fbzjjnjzdate;
     private Integer fzbds;
     private String fstbd;
     private Integer fzjdc;
     private Integer ffrdc;
     private Double fzbkzj;
     private String fothers;
     private String fzbdanwei;
     private Double fzbmoney;
     private String fwzbsy;
     private Date fzblqdate;
     private Date fgmzbwjdate;
     private Long fpsren;
     private String fzjtel;
     private Long fzj;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private String fbmmemo;
     private Long fbmzhubanren;
     private Long fbmzlzbr;
     private String fbmry;
     private Date fbmdate;
     private String fbmzlname;
     private String fbmzlurl;
     private String fzbggurl;
     private String fmemo5;
     private String fzhaobtype;
     private Long fshenpiren;
     private Date fshenpidate;
     private String fshenpimemo;
     private String fshenpiresult;
     private String ftoubiaostatus;
     private String fzbtzslqr;
     private Date fzbtzsdate;
     private String fjieshouren;
     private String fkbaddress;
     private String ftbzjsfdc;
     private String ffuzerentel;
     private String fbzjstatus;
     private String fdzbtype;
     private String ftbwxh;
     private String ftbgzs;
     private String ftbjwzm;
     private String ftbwxhzb;
     private String ftbgzszb;
     private String ftbjwzmzb;
     private String ftbbab;
     private String ffbtj;
     private String ftbtjf;
     private String fzbstatus;
     private String fshuxing;
     private String ffbstatus;
     private String ffbreason;
    // Constructors

    /** default constructor */
    public JyXm() {
    }

	/** minimal constructor */
    public JyXm(String fname) {
        this.fname = fname;
    }
    
    /** full constructor */
    public JyXm(String ftype, String fstate, String fname, String fxmgk, String fprovince, String fcity, String fscale, Double ftze, String fjsdw, String fzbdldw, Long fweituoren, String ffuzeren, Date fbmksdate, Date fbmjzdate, String fbaomingren, Date fbeiandate, Long fzgyszbr, Date fzgysdate, String fzgysstatus, Long fbeianry, String fbeianstatus, String fbeianname, String fbeianurl, String fisdaban, String ftbwjbh, Long fbszzren, Integer fzbfs, Integer ffbfs, Integer fdzbfs, String ftbts, String fispass, Long fzbgoumairen, Date fzbgmdate, String fzbwjbh, Date fkbdate, String fzzyq, Long fbzjje, Date fbzjjnjzdate, Integer fzbds, String fstbd, Integer fzjdc, Integer ffrdc, Double fzbkzj, String fothers, String fzbdanwei, Double fzbmoney, String fwzbsy, Date fzblqdate, Date fgmzbwjdate, Long fpsren, String fzjtel, Long fzj, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, String fbmmemo, Long fbmzhubanren, Long fbmzlzbr, String fbmry, Date fbmdate, String fbmzlname, String fbmzlurl, String fzbggurl, String fmemo5, String fzhaobtype, Long fshenpiren, Date fshenpidate, String fshenpimemo, String fshenpiresult, String ftoubiaostatus, String fzbtzslqr, Date fzbtzsdate, String fjieshouren, String fkbaddress, String ftbzjsfdc, String ffuzerentel, String fbzjstatus, String fdzbtype, String ftbwxh, String ftbgzs, String ftbjwzm, String ftbwxhzb, String ftbgzszb, String ftbjwzmzb, String ftbbab, String ffbtj, String ftbtjf, String fzbstatus, String fshuxing, String ffbstatus, String ffbreason) {
        this.ftype = ftype;
        this.fstate = fstate;
        this.fname = fname;
        this.fxmgk = fxmgk;
        this.fprovince = fprovince;
        this.fcity = fcity;
        this.fscale = fscale;
        this.ftze = ftze;
        this.fjsdw = fjsdw;
        this.fzbdldw = fzbdldw;
        this.fweituoren = fweituoren;
        this.ffuzeren = ffuzeren;
        this.fbmksdate = fbmksdate;
        this.fbmjzdate = fbmjzdate;
        this.fbaomingren = fbaomingren;
        this.fbeiandate = fbeiandate;
        this.fzgyszbr = fzgyszbr;
        this.fzgysdate = fzgysdate;
        this.fzgysstatus = fzgysstatus;
        this.fbeianry = fbeianry;
        this.fbeianstatus = fbeianstatus;
        this.fbeianname = fbeianname;
        this.fbeianurl = fbeianurl;
        this.fisdaban = fisdaban;
        this.ftbwjbh = ftbwjbh;
        this.fbszzren = fbszzren;
        this.fzbfs = fzbfs;
        this.ffbfs = ffbfs;
        this.fdzbfs = fdzbfs;
        this.ftbts = ftbts;
        this.fispass = fispass;
        this.fzbgoumairen = fzbgoumairen;
        this.fzbgmdate = fzbgmdate;
        this.fzbwjbh = fzbwjbh;
        this.fkbdate = fkbdate;
        this.fzzyq = fzzyq;
        this.fbzjje = fbzjje;
        this.fbzjjnjzdate = fbzjjnjzdate;
        this.fzbds = fzbds;
        this.fstbd = fstbd;
        this.fzjdc = fzjdc;
        this.ffrdc = ffrdc;
        this.fzbkzj = fzbkzj;
        this.fothers = fothers;
        this.fzbdanwei = fzbdanwei;
        this.fzbmoney = fzbmoney;
        this.fwzbsy = fwzbsy;
        this.fzblqdate = fzblqdate;
        this.fgmzbwjdate = fgmzbwjdate;
        this.fpsren = fpsren;
        this.fzjtel = fzjtel;
        this.fzj = fzj;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fbmmemo = fbmmemo;
        this.fbmzhubanren = fbmzhubanren;
        this.fbmzlzbr = fbmzlzbr;
        this.fbmry = fbmry;
        this.fbmdate = fbmdate;
        this.fbmzlname = fbmzlname;
        this.fbmzlurl = fbmzlurl;
        this.fzbggurl = fzbggurl;
        this.fmemo5 = fmemo5;
        this.fzhaobtype = fzhaobtype;
        this.fshenpiren = fshenpiren;
        this.fshenpidate = fshenpidate;
        this.fshenpimemo = fshenpimemo;
        this.fshenpiresult = fshenpiresult;
        this.ftoubiaostatus = ftoubiaostatus;
        this.fzbtzslqr = fzbtzslqr;
        this.fzbtzsdate = fzbtzsdate;
        this.fjieshouren = fjieshouren;
        this.fkbaddress = fkbaddress;
        this.ftbzjsfdc = ftbzjsfdc;
        this.ffuzerentel = ffuzerentel;
        this.fbzjstatus = fbzjstatus;
        this.fdzbtype = fdzbtype;
        this.ftbwxh = ftbwxh;
        this.ftbgzs = ftbgzs;
        this.ftbjwzm = ftbjwzm;
        this.ftbwxhzb = ftbwxhzb;
        this.ftbgzszb = ftbgzszb;
        this.ftbjwzmzb = ftbjwzmzb;
        this.ftbbab = ftbbab;
        this.ffbtj = ffbtj;
        this.ftbtjf = ftbtjf;
        this.fzbstatus = fzbstatus;
        this.fshuxing = fshuxing;
        this.ffbstatus = ffbstatus;
        this.ffbreason=  ffbreason;
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
    
    @Column(name="ftype", length=64)
    public String getFtype() {
        return this.ftype;
    }
    public void setFtype(String ftype) {
        this.ftype = ftype;
    }
    
    @Column(name="fstate", length=64)

    public String getFstate() {
        return this.fstate;
    }
    
    public void setFstate(String fstate) {
        this.fstate = fstate;
    }
    
    @Column(name="fname", nullable=false, length=64)

    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    
    @Column(name="fxmgk", length=400)

    public String getFxmgk() {
        return this.fxmgk;
    }
    
    public void setFxmgk(String fxmgk) {
        this.fxmgk = fxmgk;
    }
    
    @Column(name="fprovince", length=20)

    public String getFprovince() {
        return this.fprovince;
    }
    
    public void setFprovince(String fprovince) {
        this.fprovince = fprovince;
    }
    
    @Column(name="fcity", length=20)

    public String getFcity() {
        return this.fcity;
    }
    
    public void setFcity(String fcity) {
        this.fcity = fcity;
    }
    
    @Column(name="fscale", length=400)

    public String getFscale() {
        return this.fscale;
    }
    
    public void setFscale(String fscale) {
        this.fscale = fscale;
    }
    
    @Column(name="ftze", precision=20, scale=4)

    public Double getFtze() {
        return this.ftze;
    }
    
    public void setFtze(Double ftze) {
        this.ftze = ftze;
    }
    
    @Column(name="fjsdw", length=128)

    public String getFjsdw() {
        return this.fjsdw;
    }
    
    public void setFjsdw(String fjsdw) {
        this.fjsdw = fjsdw;
    }
    
    @Column(name="fzbdldw", length=20)

    public String getFzbdldw() {
        return this.fzbdldw;
    }
    
    public void setFzbdldw(String fzbdldw) {
        this.fzbdldw = fzbdldw;
    }
    
    @Column(name="fweituoren")

    public Long getFweituoren() {
        return this.fweituoren;
    }
    
    public void setFweituoren(Long fweituoren) {
        this.fweituoren = fweituoren;
    }
    
    @Column(name="ffuzeren", length=64)

    public String getFfuzeren() {
        return this.ffuzeren;
    }
    
    public void setFfuzeren(String ffuzeren) {
        this.ffuzeren = ffuzeren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmksdate", length=10)

    public Date getFbmksdate() {
        return this.fbmksdate;
    }
    
    public void setFbmksdate(Date fbmksdate) {
        this.fbmksdate = fbmksdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmjzdate", length=10)

    public Date getFbmjzdate() {
        return this.fbmjzdate;
    }
    
    public void setFbmjzdate(Date fbmjzdate) {
        this.fbmjzdate = fbmjzdate;
    }
    
    @Column(name="fbaomingren")

    public String getFbaomingren() {
        return this.fbaomingren;
    }
    
    public void setFbaomingren(String fbaomingren) {
        this.fbaomingren = fbaomingren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbeiandate", length=10)

    public Date getFbeiandate() {
        return this.fbeiandate;
    }
    
    public void setFbeiandate(Date fbeiandate) {
        this.fbeiandate = fbeiandate;
    }
    
    @Column(name="fzgyszbr")

    public Long getFzgyszbr() {
        return this.fzgyszbr;
    }
    
    public void setFzgyszbr(Long fzgyszbr) {
        this.fzgyszbr = fzgyszbr;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzgysdate", length=10)

    public Date getFzgysdate() {
        return this.fzgysdate;
    }
    
    public void setFzgysdate(Date fzgysdate) {
        this.fzgysdate = fzgysdate;
    }
    
    @Column(name="fzgysstatus", length=64)

    public String getFzgysstatus() {
        return this.fzgysstatus;
    }
    
    public void setFzgysstatus(String fzgysstatus) {
        this.fzgysstatus = fzgysstatus;
    }
    
    @Column(name="fbeianry")

    public Long getFbeianry() {
        return this.fbeianry;
    }
    
    public void setFbeianry(Long fbeianry) {
        this.fbeianry = fbeianry;
    }
    
    @Column(name="fbeianstatus", length=64)

    public String getFbeianstatus() {
        return this.fbeianstatus;
    }
    
    public void setFbeianstatus(String fbeianstatus) {
        this.fbeianstatus = fbeianstatus;
    }
    
    @Column(name="fbeianname", length=64)

    public String getFbeianname() {
        return this.fbeianname;
    }
    
    public void setFbeianname(String fbeianname) {
        this.fbeianname = fbeianname;
    }
    
    @Column(name="fbeianurl", length=128)

    public String getFbeianurl() {
        return this.fbeianurl;
    }
    
    public void setFbeianurl(String fbeianurl) {
        this.fbeianurl = fbeianurl;
    }
    
    @Column(name="fisdaban", length=20)

    public String getFisdaban() {
        return this.fisdaban;
    }
    
    public void setFisdaban(String fisdaban) {
        this.fisdaban = fisdaban;
    }
    
    @Column(name="ftbwjbh", length=64)

    public String getFtbwjbh() {
        return this.ftbwjbh;
    }
    
    public void setFtbwjbh(String ftbwjbh) {
        this.ftbwjbh = ftbwjbh;
    }
    
    @Column(name="fbszzren")

    public Long getFbszzren() {
        return this.fbszzren;
    }
    
    public void setFbszzren(Long fbszzren) {
        this.fbszzren = fbszzren;
    }
    
    @Column(name="fzbfs")

    public Integer getFzbfs() {
        return this.fzbfs;
    }
    
    public void setFzbfs(Integer fzbfs) {
        this.fzbfs = fzbfs;
    }
    
    @Column(name="ffbfs")

    public Integer getFfbfs() {
        return this.ffbfs;
    }
    
    public void setFfbfs(Integer ffbfs) {
        this.ffbfs = ffbfs;
    }
    
    @Column(name="fdzbfs")

    public Integer getFdzbfs() {
        return this.fdzbfs;
    }
    
    public void setFdzbfs(Integer fdzbfs) {
        this.fdzbfs = fdzbfs;
    }
    
    @Column(name="ftbts", length=64)

    public String getFtbts() {
        return this.ftbts;
    }
    
    public void setFtbts(String ftbts) {
        this.ftbts = ftbts;
    }
    
    @Column(name="fispass", length=64)

    public String getFispass() {
        return this.fispass;
    }
    
    public void setFispass(String fispass) {
        this.fispass = fispass;
    }
    
    @Column(name="fzbgoumairen")

    public Long getFzbgoumairen() {
        return this.fzbgoumairen;
    }
    
    public void setFzbgoumairen(Long fzbgoumairen) {
        this.fzbgoumairen = fzbgoumairen;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzbgmdate", length=10)

    public Date getFzbgmdate() {
        return this.fzbgmdate;
    }
    
    public void setFzbgmdate(Date fzbgmdate) {
        this.fzbgmdate = fzbgmdate;
    }
    
    @Column(name="fzbwjbh", length=64)

    public String getFzbwjbh() {
        return this.fzbwjbh;
    }
    
    public void setFzbwjbh(String fzbwjbh) {
        this.fzbwjbh = fzbwjbh;
    }
    
    @Column(name="fkbdate", length=19)

    public Date getFkbdate() {
        return this.fkbdate;
    }
    
    public void setFkbdate(Date fkbdate) {
        this.fkbdate = fkbdate;
    }
    
    @Column(name="fzzyq", length=64)

    public String getFzzyq() {
        return this.fzzyq;
    }
    
    public void setFzzyq(String fzzyq) {
        this.fzzyq = fzzyq;
    }
    
    @Column(name="fbzjje")

    public Long getFbzjje() {
        return this.fbzjje;
    }
    
    public void setFbzjje(Long fbzjje) {
        this.fbzjje = fbzjje;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbzjjnjzdate", length=10)

    public Date getFbzjjnjzdate() {
        return this.fbzjjnjzdate;
    }
    
    public void setFbzjjnjzdate(Date fbzjjnjzdate) {
        this.fbzjjnjzdate = fbzjjnjzdate;
    }
    
    @Column(name="fzbds")

    public Integer getFzbds() {
        return this.fzbds;
    }
    
    public void setFzbds(Integer fzbds) {
        this.fzbds = fzbds;
    }
    
    @Column(name="fstbd", length=3)

    public String getFstbd() {
        return this.fstbd;
    }
    
    public void setFstbd(String fstbd) {
        this.fstbd = fstbd;
    }
    
    @Column(name="fzjdc")

    public Integer getFzjdc() {
        return this.fzjdc;
    }
    
    public void setFzjdc(Integer fzjdc) {
        this.fzjdc = fzjdc;
    }
    
    @Column(name="ffrdc")

    public Integer getFfrdc() {
        return this.ffrdc;
    }
    
    public void setFfrdc(Integer ffrdc) {
        this.ffrdc = ffrdc;
    }
    
    @Column(name="fzbkzj", precision=20, scale=4)

    public Double getFzbkzj() {
        return this.fzbkzj;
    }
    
    public void setFzbkzj(Double fzbkzj) {
        this.fzbkzj = fzbkzj;
    }
    
    @Column(name="fothers", length=2000)

    public String getFothers() {
        return this.fothers;
    }
    
    public void setFothers(String fothers) {
        this.fothers = fothers;
    }
    
    @Column(name="fzbdanwei", length=64)

    public String getFzbdanwei() {
        return this.fzbdanwei;
    }
    
    public void setFzbdanwei(String fzbdanwei) {
        this.fzbdanwei = fzbdanwei;
    }
    
    @Column(name="fzbmoney", precision=20, scale=4)

    public Double getFzbmoney() {
        return this.fzbmoney;
    }
    
    public void setFzbmoney(Double fzbmoney) {
        this.fzbmoney = fzbmoney;
    }
    
    @Column(name="fwzbsy", length=500)

    public String getFwzbsy() {
        return this.fwzbsy;
    }
    
    public void setFwzbsy(String fwzbsy) {
        this.fwzbsy = fwzbsy;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzblqdate", length=10)

    public Date getFzblqdate() {
        return this.fzblqdate;
    }
    
    public void setFzblqdate(Date fzblqdate) {
        this.fzblqdate = fzblqdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fgmzbwjdate", length=10)

    public Date getFgmzbwjdate() {
        return this.fgmzbwjdate;
    }
    
    public void setFgmzbwjdate(Date fgmzbwjdate) {
        this.fgmzbwjdate = fgmzbwjdate;
    }
    
    @Column(name="fpsren")

    public Long getFpsren() {
        return this.fpsren;
    }
    
    public void setFpsren(Long fpsren) {
        this.fpsren = fpsren;
    }
    
    @Column(name="fzjtel", length=64)

    public String getFzjtel() {
        return this.fzjtel;
    }
    
    public void setFzjtel(String fzjtel) {
        this.fzjtel = fzjtel;
    }
    
    @Column(name="fzj")

    public Long getFzj() {
        return this.fzj;
    }
    
    public void setFzj(Long fzj) {
        this.fzj = fzj;
    }
    
    @Column(name="fmemo", length=500)

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
    
    @Column(name="fbmmemo", length=500)

    public String getFbmmemo() {
        return this.fbmmemo;
    }
    
    public void setFbmmemo(String fbmmemo) {
        this.fbmmemo = fbmmemo;
    }
    
    @Column(name="fbmzhubanren")

    public Long getFbmzhubanren() {
        return this.fbmzhubanren;
    }
    
    public void setFbmzhubanren(Long fbmzhubanren) {
        this.fbmzhubanren = fbmzhubanren;
    }
    
    @Column(name="fbmzlzbr")

    public Long getFbmzlzbr() {
        return this.fbmzlzbr;
    }
    
    public void setFbmzlzbr(Long fbmzlzbr) {
        this.fbmzlzbr = fbmzlzbr;
    }
    
    @Column(name="fbmry", length=500)

    public String getFbmry() {
        return this.fbmry;
    }
    
    public void setFbmry(String fbmry) {
        this.fbmry = fbmry;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbmdate", length=10)

    public Date getFbmdate() {
        return this.fbmdate;
    }
    
    public void setFbmdate(Date fbmdate) {
        this.fbmdate = fbmdate;
    }
    
    @Column(name="fbmzlname", length=64)

    public String getFbmzlname() {
        return this.fbmzlname;
    }
    
    public void setFbmzlname(String fbmzlname) {
        this.fbmzlname = fbmzlname;
    }
    
    @Column(name="fbmzlurl", length=500)

    public String getFbmzlurl() {
        return this.fbmzlurl;
    }
    
    public void setFbmzlurl(String fbmzlurl) {
        this.fbmzlurl = fbmzlurl;
    }
    
    @Column(name="fzbggurl", length=500)

    public String getFzbggurl() {
        return this.fzbggurl;
    }
    
    public void setFzbggurl(String fzbggurl) {
        this.fzbggurl = fzbggurl;
    }
    
    @Column(name="fmemo5", length=500)

    public String getFmemo5() {
        return this.fmemo5;
    }
    
    public void setFmemo5(String fmemo5) {
        this.fmemo5 = fmemo5;
    }
    
    @Column(name="fzhaobtype", length=500)

    public String getFzhaobtype() {
        return this.fzhaobtype;
    }
    
    public void setFzhaobtype(String fzhaobtype) {
        this.fzhaobtype = fzhaobtype;
    }
    
    @Column(name="fshenpiren")

    public Long getFshenpiren() {
        return this.fshenpiren;
    }
    
    public void setFshenpiren(Long fshenpiren) {
        this.fshenpiren = fshenpiren;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fshenpidate", length=10)

    public Date getFshenpidate() {
        return this.fshenpidate;
    }
    
    public void setFshenpidate(Date fshenpidate) {
        this.fshenpidate = fshenpidate;
    }
    
    @Column(name="fshenpimemo", length=500)

    public String getFshenpimemo() {
        return this.fshenpimemo;
    }
    
    public void setFshenpimemo(String fshenpimemo) {
        this.fshenpimemo = fshenpimemo;
    }
    
    @Column(name="fshenpiresult", length=64)

    public String getFshenpiresult() {
        return this.fshenpiresult;
    }
    
    public void setFshenpiresult(String fshenpiresult) {
        this.fshenpiresult = fshenpiresult;
    }
    
    @Column(name="ftoubiaostatus", length=64)

    public String getFtoubiaostatus() {
        return this.ftoubiaostatus;
    }
    
    public void setFtoubiaostatus(String ftoubiaostatus) {
        this.ftoubiaostatus = ftoubiaostatus;
    }
    
    @Column(name="fzbtzslqr")

    public String getFzbtzslqr() {
        return this.fzbtzslqr;
    }
    
    public void setFzbtzslqr(String fzbtzslqr) {
        this.fzbtzslqr = fzbtzslqr;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzbtzsdate", length=10)

    public Date getFzbtzsdate() {
        return this.fzbtzsdate;
    }
    
    public void setFzbtzsdate(Date fzbtzsdate) {
        this.fzbtzsdate = fzbtzsdate;
    }
    
    @Column(name="fjieshouren")

    public String getFjieshouren() {
        return this.fjieshouren;
    }
    
    public void setFjieshouren(String fjieshouren) {
        this.fjieshouren = fjieshouren;
    }
    
    @Column(name="fkbaddress", length=200)

    public String getFkbaddress() {
        return this.fkbaddress;
    }
    
    public void setFkbaddress(String fkbaddress) {
        this.fkbaddress = fkbaddress;
    }
    
    @Column(name="ftbzjsfdc", length=2000)

    public String getFtbzjsfdc() {
        return this.ftbzjsfdc;
    }
    
    public void setFtbzjsfdc(String ftbzjsfdc) {
        this.ftbzjsfdc = ftbzjsfdc;
    }
    
    @Column(name="ffuzerentel", length=64)

    public String getFfuzerentel() {
        return this.ffuzerentel;
    }
    
    public void setFfuzerentel(String ffuzerentel) {
        this.ffuzerentel = ffuzerentel;
    }
    
    @Column(name="fbzjstatus", length=64)

    public String getFbzjstatus() {
        return this.fbzjstatus;
    }
    
    public void setFbzjstatus(String fbzjstatus) {
        this.fbzjstatus = fbzjstatus;
    }
    
    @Column(name="fdzbtype", length=64)

    public String getFdzbtype() {
        return this.fdzbtype;
    }
    
    public void setFdzbtype(String fdzbtype) {
        this.fdzbtype = fdzbtype;
    }
    
    @Column(name="ftbwxh", length=64)

    public String getFtbwxh() {
        return this.ftbwxh;
    }
    
    public void setFtbwxh(String ftbwxh) {
        this.ftbwxh = ftbwxh;
    }
    
    @Column(name="ftbgzs", length=64)

    public String getFtbgzs() {
        return this.ftbgzs;
    }
    
    public void setFtbgzs(String ftbgzs) {
        this.ftbgzs = ftbgzs;
    }
    
    @Column(name="ftbjwzm", length=64)

    public String getFtbjwzm() {
        return this.ftbjwzm;
    }
    
    public void setFtbjwzm(String ftbjwzm) {
        this.ftbjwzm = ftbjwzm;
    }
    
    @Column(name="ftbwxhzb", length=64)

    public String getFtbwxhzb() {
        return this.ftbwxhzb;
    }
    
    public void setFtbwxhzb(String ftbwxhzb) {
        this.ftbwxhzb = ftbwxhzb;
    }
    
    @Column(name="ftbgzszb", length=64)

    public String getFtbgzszb() {
        return this.ftbgzszb;
    }
    
    public void setFtbgzszb(String ftbgzszb) {
        this.ftbgzszb = ftbgzszb;
    }
    
    @Column(name="ftbjwzmzb", length=64)

    public String getFtbjwzmzb() {
        return this.ftbjwzmzb;
    }
    
    public void setFtbjwzmzb(String ftbjwzmzb) {
        this.ftbjwzmzb = ftbjwzmzb;
    }
    
    @Column(name="ftbbab", length=64)

    public String getFtbbab() {
        return this.ftbbab;
    }
    
    public void setFtbbab(String ftbbab) {
        this.ftbbab = ftbbab;
    }
    
    @Column(name="ffbtj", length=500)

    public String getFfbtj() {
        return this.ffbtj;
    }
    
    public void setFfbtj(String ffbtj) {
        this.ffbtj = ffbtj;
    }
    
    @Column(name="ftbtjf", length=500)

    public String getFtbtjf() {
        return this.ftbtjf;
    }
    
    public void setFtbtjf(String ftbtjf) {
        this.ftbtjf = ftbtjf;
    }
    
    @Column(name="fzbstatus", length=64)

    public String getFzbstatus() {
        return this.fzbstatus;
    }
    
    public void setFzbstatus(String fzbstatus) {
        this.fzbstatus = fzbstatus;
    }
    
    @Column(name="fshuxing", length=64)

    public String getFshuxing()  { return this.fshuxing; }
    
    public void setFshuxing(String fshuxing) { this.fshuxing = fshuxing;}

   // ����Ƿ�ϱ����
    @Column(name="ffbstatus", length =64)

    public String getFfbstatus(){return this.ffbstatus; }

    public void setFfbstatus(String ffbstatus){this.ffbstatus= ffbstatus;}

    @Column(name="ffbreason", length =64)
    public String getFfbreason(){return this.ffbreason; }
    public void setFfbreason(String ffbreason){this.ffbreason= ffbreason;}


}