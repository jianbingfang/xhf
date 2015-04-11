package com.xthena.jl.domain;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * JlShiZhongNew entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_shizhong_new"
    ,catalog="xhf"
)

public class JlShiZhongNew  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String fno;
     private Long fxmid;
     private String fcontent;
     private String fcode;
     private String ffile;
     private Date fdate;
     private String fextend1;
     private String fextend2;
     private String fextend3;
     private String fextend4;
     private String fextend5;
     private String fextend6;
     private String fextend7;
     private String fextend8;
     private String fextend9;
     private String fextend10;
     private String fextend11;
     private String fextend12;
     private String fextend13;
     private String fextend14;
     private String fextend15;


    // Constructors

    /** default constructor */
    public JlShiZhongNew() {
    }

    
    /** full constructor */
    public JlShiZhongNew(String fno, Long fxmid, String fcontent, String fcode, String ffile, Date fdate, String fextend1, String fextend2, String fextend3, String fextend4, String fextend5, String fextend6, String fextend7, String fextend8, String fextend9, String fextend10, String fextend11, String fextend12, String fextend13, String fextend14, String fextend15) {
        this.fno = fno;
        this.fxmid = fxmid;
        this.fcontent = fcontent;
        this.fcode = fcode;
        this.ffile = ffile;
        this.fdate = fdate;
        this.fextend1 = fextend1;
        this.fextend2 = fextend2;
        this.fextend3 = fextend3;
        this.fextend4 = fextend4;
        this.fextend5 = fextend5;
        this.fextend6 = fextend6;
        this.fextend7 = fextend7;
        this.fextend8 = fextend8;
        this.fextend9 = fextend9;
        this.fextend10 = fextend10;
        this.fextend11 = fextend11;
        this.fextend12 = fextend12;
        this.fextend13 = fextend13;
        this.fextend14 = fextend14;
        this.fextend15 = fextend15;
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
    
    @Column(name="fno", length=64)

    public String getFno() {
        return this.fno;
    }
    
    public void setFno(String fno) {
        this.fno = fno;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    
    @Column(name="fcontent", length=65535)

    public String getFcontent() {
        return this.fcontent;
    }
    
    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }
    
    @Column(name="fcode", length=64)

    public String getFcode() {
        return this.fcode;
    }
    
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }
    
    @Column(name="ffile", length=1024)

    public String getFfile() {
        return this.ffile;
    }
    
    public void setFfile(String ffile) {
        this.ffile = ffile;
    }
    
    @Column(name="fdate", length=19)

    public Date getFdate() {
        return this.fdate;
    }
    
    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }
    
    @Column(name="fextend1", length=1024)

    public String getFextend1() {
        return this.fextend1;
    }
    
    public void setFextend1(String fextend1) {
        this.fextend1 = fextend1;
    }
    
    @Column(name="fextend2", length=1024)

    public String getFextend2() {
        return this.fextend2;
    }
    
    public void setFextend2(String fextend2) {
        this.fextend2 = fextend2;
    }
    
    @Column(name="fextend3", length=1024)

    public String getFextend3() {
        return this.fextend3;
    }
    
    public void setFextend3(String fextend3) {
        this.fextend3 = fextend3;
    }
    
    @Column(name="fextend4", length=1024)

    public String getFextend4() {
        return this.fextend4;
    }
    
    public void setFextend4(String fextend4) {
        this.fextend4 = fextend4;
    }
    
    @Column(name="fextend5", length=1024)

    public String getFextend5() {
        return this.fextend5;
    }
    
    public void setFextend5(String fextend5) {
        this.fextend5 = fextend5;
    }
    
    @Column(name="fextend6", length=1024)

    public String getFextend6() {
        return this.fextend6;
    }
    
    public void setFextend6(String fextend6) {
        this.fextend6 = fextend6;
    }
    
    @Column(name="fextend7", length=1024)

    public String getFextend7() {
        return this.fextend7;
    }
    
    public void setFextend7(String fextend7) {
        this.fextend7 = fextend7;
    }
    
    @Column(name="fextend8", length=1024)

    public String getFextend8() {
        return this.fextend8;
    }
    
    public void setFextend8(String fextend8) {
        this.fextend8 = fextend8;
    }
    
    @Column(name="fextend9", length=1024)

    public String getFextend9() {
        return this.fextend9;
    }
    
    public void setFextend9(String fextend9) {
        this.fextend9 = fextend9;
    }
    
    @Column(name="fextend10", length=1024)

    public String getFextend10() {
        return this.fextend10;
    }
    
    public void setFextend10(String fextend10) {
        this.fextend10 = fextend10;
    }
    
    @Column(name="fextend11", length=1024)

    public String getFextend11() {
        return this.fextend11;
    }
    
    public void setFextend11(String fextend11) {
        this.fextend11 = fextend11;
    }
    
    @Column(name="fextend12", length=1024)

    public String getFextend12() {
        return this.fextend12;
    }
    
    public void setFextend12(String fextend12) {
        this.fextend12 = fextend12;
    }
    
    @Column(name="fextend13", length=1024)

    public String getFextend13() {
        return this.fextend13;
    }
    
    public void setFextend13(String fextend13) {
        this.fextend13 = fextend13;
    }
    
    @Column(name="fextend14", length=1024)

    public String getFextend14() {
        return this.fextend14;
    }
    
    public void setFextend14(String fextend14) {
        this.fextend14 = fextend14;
    }
    
    @Column(name="fextend15", length=1024)

    public String getFextend15() {
        return this.fextend15;
    }
    
    public void setFextend15(String fextend15) {
        this.fextend15 = fextend15;
    }
   








}