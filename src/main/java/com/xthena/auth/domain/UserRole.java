package com.xthena.auth.domain;
// default package

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;


/**
 * UserRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="auth_user_role"
    ,catalog="xhf"
)

public class UserRole  implements java.io.Serializable {


    // Fields    

     private UserRoleId id;


    // Constructors

    /** default constructor */
    public UserRole() {
    }

    
    /** full constructor */
    public UserRole(UserRoleId id) {
        this.id = id;
    }

   
    // Property accessors
    @EmbeddedId
    
    @AttributeOverrides( {
        @AttributeOverride(name="userStatusId", column=@Column(name="USER_STATUS_ID", nullable=false) ), 
        @AttributeOverride(name="roleId", column=@Column(name="ROLE_ID", nullable=false) ) } )

    public UserRoleId getId() {
        return this.id;
    }
    
    public void setId(UserRoleId id) {
        this.id = id;
    }
   








}