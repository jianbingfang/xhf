package com.xthena.util.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CodeGen entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_code_gen"
    ,catalog="xhf"
)

public class CodeGen  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ftypecode;
     private String fdatecode;
     private Integer fcurrvalue;
     private String fmemo;


    // Constructors

    /** default constructor */
    public CodeGen() {
    }

    
    /** full constructor */
    public CodeGen(String ftypecode, String fdatecode, Integer fcurrvalue, String fmemo) {
        this.ftypecode = ftypecode;
        this.fdatecode = fdatecode;
        this.fcurrvalue = fcurrvalue;
        this.fmemo = fmemo;
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
    
    @Column(name="ftypecode", length=16)

    public String getFtypecode() {
        return this.ftypecode;
    }
    
    public void setFtypecode(String ftypecode) {
        this.ftypecode = ftypecode;
    }
    
    @Column(name="fdatecode", length=16)

    public String getFdatecode() {
        return this.fdatecode;
    }
    
    public void setFdatecode(String fdatecode) {
        this.fdatecode = fdatecode;
    }
    
    @Column(name="fcurrvalue")

    public Integer getFcurrvalue() {
        return this.fcurrvalue;
    }
    
    public void setFcurrvalue(Integer fcurrvalue) {
        this.fcurrvalue = fcurrvalue;
    }
    
    @Column(name="fmemo", length=64)

    public String getFmemo() {
        return this.fmemo;
    }
    
    public void setFmemo(String fmemo) {
        this.fmemo = fmemo;
    }
   








}