package com.dxc.chain;

import java.util.Date;

public class TransactionConvert {
	public String transactionId; // this is also the hash of the transaction.
	public String sender; // senders address/public key.
	public String reciepient; // Recipients address/public key.
	public String candidate;
	public Date timeStamp;
	
	public TransactionConvert(String transactionId, String sender, String reciepient, String candidate,
			Date timeStamp) {
		super();
		this.transactionId = transactionId;
		this.sender = sender;
		this.reciepient = reciepient;
		this.candidate = candidate;
		this.timeStamp = timeStamp;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciepient() {
		return reciepient;
	}
	public void setReciepient(String reciepient) {
		this.reciepient = reciepient;
	}
	public String getCandidate() {
		return candidate;
	}
	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}
	public Date getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}
	
}
