package com.xthena.auth.domain;
// default package

import javax.persistence.Column;
import javax.persistence.Embeddable;


/**
 * UserRoleId entity. @author MyEclipse Persistence Tools
 */
@Embeddable

public class UserRoleId  implements java.io.Serializable {


    // Fields    

     private Long userStatusId;
     private Long roleId;


    // Constructors

    /** default constructor */
    public UserRoleId() {
    }

    
    /** full constructor */
    public UserRoleId(Long userStatusId, Long roleId) {
        this.userStatusId = userStatusId;
        this.roleId = roleId;
    }

   
    // Property accessors

    @Column(name="USER_STATUS_ID", nullable=false)

    public Long getUserStatusId() {
        return this.userStatusId;
    }
    
    public void setUserStatusId(Long userStatusId) {
        this.userStatusId = userStatusId;
    }

    @Column(name="ROLE_ID", nullable=false)

    public Long getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof UserRoleId) ) return false;
		 UserRoleId castOther = ( UserRoleId ) other; 
         
		 return ( (this.getUserStatusId()==castOther.getUserStatusId()) || ( this.getUserStatusId()!=null && castOther.getUserStatusId()!=null && this.getUserStatusId().equals(castOther.getUserStatusId()) ) )
 && ( (this.getRoleId()==castOther.getRoleId()) || ( this.getRoleId()!=null && castOther.getRoleId()!=null && this.getRoleId().equals(castOther.getRoleId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getUserStatusId() == null ? 0 : this.getUserStatusId().hashCode() );
         result = 37 * result + ( getRoleId() == null ? 0 : this.getRoleId().hashCode() );
         return result;
   }   





}