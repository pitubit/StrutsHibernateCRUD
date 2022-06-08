package com.example.form;

import org.apache.struts.action.ActionForm;

public class StudentForm extends ActionForm {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String contactNumber;
	private String gender;
	private String address;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
