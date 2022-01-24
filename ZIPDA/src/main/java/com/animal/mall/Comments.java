package com.animal.mall;

public class Comments {
	private int comNo;
	private int itemNo;
	private String userId;
	private String content;
	private String regdate;
	private String itemName;

	public Comments() {
		super();
	}

	public Comments(int itemNo, String userId, String content) {
		super();
		this.itemNo = itemNo;
		this.userId = userId;
		this.content = content;
	}
	//마이페이지 코멘트
	public Comments(int comNo,  String itemName, String content, String regdate, int itemNo) {
		super();
		this.comNo = comNo;
		this.itemName=itemName;
		this.content = content;
		this.regdate = regdate;
		this.itemNo=itemNo;
	}
	//상품페이지 코멘트
	public Comments(int comNo, int itemNo, String userId, String content, String regdate) {
		super();
		this.comNo = comNo;
		this.itemNo = itemNo;
		this.userId = userId;
		this.content = content;
		this.regdate = regdate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}