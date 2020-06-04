package com.dxc.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "role")
public class Role extends BaseObject implements java.io.Serializable {

	public static final long serialVersionUID = 200708131629L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name="name")
	String name;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "users_roles",
	        joinColumns = @JoinColumn(name = "role"),
	        inverseJoinColumns = @JoinColumn(name = "user"),
	        uniqueConstraints = {@UniqueConstraint(columnNames = {"role", "user"})})
	private Set<User> users;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Set<User> getUsers() {
	    if (users == null) {
	        users = new HashSet();
	    }
	    return users;
	}

	public void setUsers(Set<User> users) {
	    this.users = users;
	}
	
}
