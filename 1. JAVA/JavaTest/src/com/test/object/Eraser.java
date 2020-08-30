package com.test.object;

public class Eraser {
	
	private String size;

	//지우개 크기
	public String getSize() {
		
		return size;
	}

	public void setSize(String size) {
		
		this.size = size;
		
	}
	
	//정보
	public String info() {
		
		String info = "";
		
		info = String.format("포장 전 검수 : %s 사이즈 지우개입니다.", size);
		
		return info;
		
	}

}
