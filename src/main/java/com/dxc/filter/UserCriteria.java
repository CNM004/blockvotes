package com.dxc.filter;

public class UserCriteria {
	String email;
	String identity;
	
	public UserCriteria(String email, String identity) {
		super();
		this.email = email;
		this.identity = identity;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
}
