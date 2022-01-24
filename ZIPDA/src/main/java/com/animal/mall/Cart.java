package com.animal.mall;

public class Cart {
	String userId;
	int itemNo;
	int quantity;
	String state;
	String payDate;
	
	String fileName;
	String itemName;
	int itemPrice;
	int sumPrice;
	String category;
	
	public Cart() {}
	
	public Cart(String userId, int itemNo) {
		super();
		this.userId = userId;
		this.itemNo = itemNo;
	}
	
	public Cart(String userId, int itemNo, int quantity) {
		super();
		this.userId = userId;
		this.itemNo = itemNo;
		this.quantity = quantity;
	}
	
	public Cart(String userId, int itemNo, String state) {
		super();
		this.userId = userId;
		this.itemNo = itemNo;
		this.state = state;
	}
	
	public Cart(String userId, int itemNo, int quantity, String state) {
		super();
		this.userId = userId;
		this.itemNo = itemNo;
		this.quantity = quantity;
		this.state = state;
	}
	
	public Cart(int itemNo, String fileName, String itemName, int itemPrice, int quantity, int sumPrice, String category) {
		super();
		this.itemNo = itemNo;
		this.fileName = fileName;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.quantity = quantity;
		this.sumPrice = sumPrice;
		this.category = category;
	}
	
	public Cart(int itemNo, String fileName, String itemName, int quantity, String payDate, int sumPrice, String state, String category) {
		super();
		this.itemNo = itemNo;
		this.fileName = fileName;
		this.itemName = itemName;
		this.quantity = quantity;
		this.payDate = payDate;
		this.sumPrice = sumPrice;
		this.state = state;
		this.category = category;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
