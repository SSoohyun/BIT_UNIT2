package com.animal.mall;

public class Members {
	private String userId;
	private String userPwd;
	private String userName;
	private String birthday;
	private String address;
	private String phoneNo;
	private String email;

	public Members() {
	}

	public Members(String userId) {
		super();
		this.userId = userId;
	}

	public Members(String userId, String userPwd, String userName, String birthday, String address, String phoneNo,
			String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birthday = birthday;
		this.address = address;
		this.phoneNo = phoneNo;
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
