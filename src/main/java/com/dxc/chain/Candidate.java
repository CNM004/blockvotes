package com.dxc.chain;

public class Candidate {
	private String name;
	private String publicKey;
	
	public Candidate(String name, int age, String publicKey) {
		super();
		this.name = name;
		this.publicKey = publicKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublicKey() {
		return publicKey;
	}
	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}
	
}
