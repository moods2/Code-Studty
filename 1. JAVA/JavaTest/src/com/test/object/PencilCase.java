package com.test.object;

//필통
public class PencilCase {
	
	
	private String size; // 대중소
	private String color;
	
//	private String item1; // = "볼펜"
//	private String item2; // = "연필"
//	private String item3; // = "지.."
	
	private String[] items = new String[10];
	
	//Case A.
	public String[] getItems() {
		return items;
	}
	
	public void setItems(String[] items) {
		this.items = items;
	}
	
	//Case B.
	public void setPencil(String item) {
		
		int i = 0;
		
		for (i=0; i<items.length; i++) {
			if (items[i] == null) {		
				break;
			}
		}
		
		this.items[i] = item;
	}
	
	public String getPencil(int index) {
		
		String item = this.items[index]; //아이템을 꺼내고
		this.items[index] = null; //꺼낸칸을 비운다
				
		return item;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	
	

}
