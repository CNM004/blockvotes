package com.dxc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User extends BaseObject implements java.io.Serializable {

	public static final long serialVersionUID = 200708131629L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name="identity_card_number")
	String identity;
	
	@Column(name="password")
	String password;
	
	@Column(name="fullname")
	String fullname;
	
	@Column(name="status")
	boolean status;
	
	@Column(name="is_voted")
	boolean isVoted;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isVoted() {
		return isVoted;
	}

	public void setVoted(boolean isVoted) {
		this.isVoted = isVoted;
	}
	
}
