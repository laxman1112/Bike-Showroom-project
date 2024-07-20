package com.code.entity;

public class Insurance {

	private String iId;
    private String insuranceName;
    private String insuranceIncluded;
    private String insProvider;
    private String duration;
    private String amount;
    private String bikeId;
    private String status;
    private String added_by;
    
    
	public String getAdded_by() {
		return added_by;
	}
	public void setAdded_by(String added_by) {
		this.added_by = added_by;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getiId() {
		return iId;
	}
	public void setiId(String iId) {
		this.iId = iId;
	}
	public String getInsuranceName() {
		return insuranceName;
	}
	public void setInsuranceName(String insuranceName) {
		this.insuranceName = insuranceName;
	}
	public String getInsuranceIncluded() {
		return insuranceIncluded;
	}
	public void setInsuranceIncluded(String insuranceIncluded) {
		this.insuranceIncluded = insuranceIncluded;
	}
	public String getInsProvider() {
		return insProvider;
	}
	public void setInsProvider(String insProvider) {
		this.insProvider = insProvider;
	}
	
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getBikeId() {
		return bikeId;
	}
	public void setBikeId(String bikeId) {
		this.bikeId = bikeId;
	}

    
    
	
}
