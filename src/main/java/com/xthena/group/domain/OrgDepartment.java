package com.xthena.group.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * OrgDepartment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="org_department"
    ,catalog="xhf"
)

public class OrgDepartment  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String code;
     private String name;
     private String descn;
     private Integer status;
     private String ref;
     private String scopeId;
     private String fduty;


    // Constructors

    /** default constructor */
    public OrgDepartment() {
    }

    
    /** full constructor */
    public OrgDepartment(String code, String name, String descn, Integer status, String ref, String scopeId, String fduty) {
        this.code = code;
        this.name = name;
        this.descn = descn;
        this.status = status;
        this.ref = ref;
        this.scopeId = scopeId;
        this.fduty = fduty;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="ID", unique=true, nullable=false)

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="CODE", length=50)

    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    @Column(name="NAME", length=200)

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="DESCN", length=200)

    public String getDescn() {
        return this.descn;
    }
    
    public void setDescn(String descn) {
        this.descn = descn;
    }
    
    @Column(name="STATUS")

    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
    @Column(name="REF", length=200)

    public String getRef() {
        return this.ref;
    }
    
    public void setRef(String ref) {
        this.ref = ref;
    }
    
    @Column(name="SCOPE_ID", length=50)

    public String getScopeId() {
        return this.scopeId;
    }
    
    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }
    
    @Column(name="fduty", length=4000)

    public String getFduty() {
        return this.fduty;
    }
    
    public void setFduty(String fduty) {
        this.fduty = fduty;
    }
   








}