package com.xthena.jl.domain;
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
 * JlZjSgfasb entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="t_jl_zl_sgfasb"
    ,catalog="xhf"
)

public class JlZjSgfasb  implements java.io.Serializable {


    // Fields    

     private Long fid;
     private String ffaname;
     private Long fxmid;
     private Date fsubdate;
     private Date fspdate;
     private String fsubdw;
     private Long ffjid;


    // Constructors

    /** default constructor */
    public JlZjSgfasb() {
    }

    
    /** full constructor */
    public JlZjSgfasb(String ffaname, Long fxmid, Date fsubdate, Date fspdate, String fsubdw, Long ffjid) {
        this.ffaname = ffaname;
        this.fxmid = fxmid;
        this.fsubdate = fsubdate;
        this.fspdate = fspdate;
        this.fsubdw = fsubdw;
        this.ffjid = ffjid;
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
    
    @Column(name="ffaname", length=64)

    public String getFfaname() {
        return this.ffaname;
    }
    
    public void setFfaname(String ffaname) {
        this.ffaname = ffaname;
    }
    
    @Column(name="fxmid")

    public Long getFxmid() {
        return this.fxmid;
    }
    
    public void setFxmid(Long fxmid) {
        this.fxmid = fxmid;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fsubdate", length=10)

    public Date getFsubdate() {
        return this.fsubdate;
    }
    
    public void setFsubdate(Date fsubdate) {
        this.fsubdate = fsubdate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="fspdate", length=10)

    public Date getFspdate() {
        return this.fspdate;
    }
    
    public void setFspdate(Date fspdate) {
        this.fspdate = fspdate;
    }
    
    @Column(name="fsubdw", length=64)

    public String getFsubdw() {
        return this.fsubdw;
    }
    
    public void setFsubdw(String fsubdw) {
        this.fsubdw = fsubdw;
    }
    
    @Column(name="ffjid")

    public Long getFfjid() {
        return this.ffjid;
    }
    
    public void setFfjid(Long ffjid) {
        this.ffjid = ffjid;
    }
   








}