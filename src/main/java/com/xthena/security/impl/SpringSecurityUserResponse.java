package com.xthena.security.impl;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SpringSecurityUserResponse extends UserResponseImpl implements
        UserDetails {
    private Collection<? extends GrantedAuthority> authorities;

    @Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public void getAuthorities(
            Collection<? extends GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    @Override
	public String getPassword() {
        return "NO_PASSWORD";
    }

    @Override
	public boolean isEnabled() {
        return true;
    }

    @Override
	public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
	public boolean isAccountNonLocked() {
        return true;
    }

    @Override
	public boolean isAccountNonExpired() {
        return true;
    }
}
