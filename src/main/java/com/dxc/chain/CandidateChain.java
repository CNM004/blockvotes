package com.dxc.chain;

public class CandidateChain {
	private String name;
	private String details;
	private String publicKey;
	
	public CandidateChain(String name, String details, String publicKey) {
		super();
		this.name = name;
		this.details = details;
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
