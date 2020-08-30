package com.test.object;

public class Ruler {
	
	private int length;
	private String shape;
	
	//자 길이
	public int getLength() {
		return length;
	}
	
	public void setLength(int length) {
		
			this.length = length;

	}

	//자 형태
	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
			
			this.shape = shape;
		
	}
	
	//정보
	public String info() {
		
		String info = "";
		
		info = String.format("포장 전 검수 : %dcm %s입니다.", length, shape);
		
		return info;
		
	}

}
