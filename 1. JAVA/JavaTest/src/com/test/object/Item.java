package com.test.object;

public class Item {
	
	private String name;
    private int exp;
    
    //식품명
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//유통기한
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}

}
