package com.animal.mall;

public class Items {
	private int itemNo;
	private String itemName;
	private int itemPrice;
	private String category;
	private String descript;
	private String detail;
	private String fileName;
	private String area;
	private String loc;
	private String tel;
	private String hours;
	private int hit;

	public Items() {
	}

// 병원/ 여행/ 서비스 용 생성자
	public Items(String itemName, int itemPrice, String category, String descript, String detail, String fileName,
			String area, String loc, String tel, String hours) {
		super();
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.category = category;
		this.descript = descript;
		this.detail = detail;
		this.fileName = fileName;
		this.area = area;
		this.loc = loc;
		this.tel = tel;
		this.hours = hours;
	}

public Items(int itemNo, String itemName, int itemPrice, String category, String descript, String detail,
			String fileName, String area, String loc, String tel, String hours, int hit) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.category = category;
		this.descript = descript;
		this.detail = detail;
		this.fileName = fileName;
		this.area = area;
		this.loc = loc;
		this.tel = tel;
		this.hours = hours;
		this.hit = hit;
	}

	// 쇼핑몰 용 생성자
	public Items(String itemName, int itemPrice, String category, String descript, String detail, String fileName) {
		super();
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.category = category;
		this.descript = descript;
		this.detail = detail;
		this.fileName = fileName;
	}

	public Items(int itemNo, String itemName, int itemPrice, String category, String descript, String detail,
			String fileName, int hit) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.category = category;
		this.descript = descript;
		this.detail = detail;
		this.fileName = fileName;
		this.hit = hit;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	
}