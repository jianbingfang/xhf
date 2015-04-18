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
 * JyBmRecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jy_bmrecord"
    ,catalog="xhf"
)

public class JyBmRecord  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private Long fweituoren;
     private Long fzhubanren;
     private Long fbaomingren;
     private String fisbeian;
     private Date fbeiandate;
     private String fbeianstatus;
     private String fbeianname;
     private String fbeianurl;
     private String fiszigeyushen;
     private Date fyushendate;
     private String fyushenstatus;
     private String fiszhaobiaowenj;
     private Date fzhaobiaowenjiandate;
     private String fzlname;
     private String fzlurl;
     private String fmemo;
     private String fmemo1;
     private String fmemo2;
     private String fmemo3;
     private String fmemo4;
     private Long fbmid;


    // Constructors

    /** default constructor */
    public JyBmRecord() {
    }

    /** full constructor */
    public JyBmRecord(Long fweituoren, Long fzhubanren, Long fbaomingren, String fisbeian, Date fbeiandate, String fbeianstatus, String fbeianname, String fbeianurl, String fiszigeyushen, Date fyushendate, String fyushenstatus, String fiszhaobiaowenj, Date fzhaobiaowenjiandate, String fzlname, String fzlurl, String fmemo, String fmemo1, String fmemo2, String fmemo3, String fmemo4, Long fbmid) {
        this.fweituoren = fweituoren;
        this.fzhubanren = fzhubanren;
        this.fbaomingren = fbaomingren;
        this.fisbeian = fisbeian;
        this.fbeiandate = fbeiandate;
        this.fbeianstatus = fbeianstatus;
        this.fbeianname = fbeianname;
        this.fbeianurl = fbeianurl;
        this.fiszigeyushen = fiszigeyushen;
        this.fyushendate = fyushendate;
        this.fyushenstatus = fyushenstatus;
        this.fiszhaobiaowenj = fiszhaobiaowenj;
        this.fzhaobiaowenjiandate = fzhaobiaowenjiandate;
        this.fzlname = fzlname;
        this.fzlurl = fzlurl;
        this.fmemo = fmemo;
        this.fmemo1 = fmemo1;
        this.fmemo2 = fmemo2;
        this.fmemo3 = fmemo3;
        this.fmemo4 = fmemo4;
        this.fbmid = fbmid;
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
    
    @Column(name="fweituoren")

    public Long getFweituoren() {
        return this.fweituoren;
    }
    
    public void setFweituoren(Long fweituoren) {
        this.fweituoren = fweituoren;
    }
    
    @Column(name="fzhubanren")

    public Long getFzhubanren() {
        return this.fzhubanren;
    }
    
    public void setFzhubanren(Long fzhubanren) {
        this.fzhubanren = fzhubanren;
    }
    
    @Column(name="fbaomingren")

    public Long getFbaomingren() {
        return this.fbaomingren;
    }
    
    public void setFbaomingren(Long fbaomingren) {
        this.fbaomingren = fbaomingren;
    }
    
    @Column(name="fisbeian", length=64)

    public String getFisbeian() {
        return this.fisbeian;
    }
    
    public void setFisbeian(String fisbeian) {
        this.fisbeian = fisbeian;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fbeiandate", length=10)

    public Date getFbeiandate() {
        return this.fbeiandate;
    }
    
    public void setFbeiandate(Date fbeiandate) {
        this.fbeiandate = fbeiandate;
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
    
    @Column(name="fiszigeyushen", length=64)

    public String getFiszigeyushen() {
        return this.fiszigeyushen;
    }
    
    public void setFiszigeyushen(String fiszigeyushen) {
        this.fiszigeyushen = fiszigeyushen;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fyushendate", length=10)

    public Date getFyushendate() {
        return this.fyushendate;
    }
    
    public void setFyushendate(Date fyushendate) {
        this.fyushendate = fyushendate;
    }
    
    @Column(name="fyushenstatus", length=64)

    public String getFyushenstatus() {
        return this.fyushenstatus;
    }
    
    public void setFyushenstatus(String fyushenstatus) {
        this.fyushenstatus = fyushenstatus;
    }
    
    @Column(name="fiszhaobiaowenj", length=64)

    public String getFiszhaobiaowenj() {
        return this.fiszhaobiaowenj;
    }
    
    public void setFiszhaobiaowenj(String fiszhaobiaowenj) {
        this.fiszhaobiaowenj = fiszhaobiaowenj;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fzhaobiaowenjiandate", length=10)

    public Date getFzhaobiaowenjiandate() {
        return this.fzhaobiaowenjiandate;
    }
    
    public void setFzhaobiaowenjiandate(Date fzhaobiaowenjiandate) {
        this.fzhaobiaowenjiandate = fzhaobiaowenjiandate;
    }
    
    @Column(name="fzlname", length=64)

    public String getFzlname() {
        return this.fzlname;
    }
    
    public void setFzlname(String fzlname) {
        this.fzlname = fzlname;
    }
    
    @Column(name="fzlurl", length=128)

    public String getFzlurl() {
        return this.fzlurl;
    }
    
    public void setFzlurl(String fzlurl) {
        this.fzlurl = fzlurl;
    }
    
    @Column(name="fmemo", length=500)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
    
    @Column(name="fmemo1", length=500)

    public String getFmemo1() {
        return this.fmemo1;
    }
    
    public void setFmemo1(String fmemo1) {
        this.fmemo1 = fmemo1;
    }
    
    @Column(name="fmemo2", length=500)

    public String getFmemo2() {
        return this.fmemo2;
    }
    
    public void setFmemo2(String fmemo2) {
        this.fmemo2 = fmemo2;
    }
    
    @Column(name="fmemo3", length=500)

    public String getFmemo3() {
        return this.fmemo3;
    }
    
    public void setFmemo3(String fmemo3) {
        this.fmemo3 = fmemo3;
    }
    
    @Column(name="fmemo4", length=500)

    public String getFmemo4() {
        return this.fmemo4;
    }
    
    public void setFmemo4(String fmemo4) {
        this.fmemo4 = fmemo4;
    }
    
    @Column(name="fbmid")

    public Long getFbmid() {
        return this.fbmid;
    }
    
    public void setFbmid(Long fbmid) {
        this.fbmid = fbmid;
    }
   

}