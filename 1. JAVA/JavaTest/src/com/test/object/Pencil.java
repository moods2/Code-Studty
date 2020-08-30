package com.test.object;

public class Pencil {
	
	private String hardness;

	//흑연 등급
	public String getHardness() {
		
		return hardness;
	}

	public void setHardness(String hardness) {
		
		this.hardness = hardness;		
	}
	
	//정보
	public String info() {
		
		String info = "";
		
		info = String.format("포장 전 검수 : %s 진하기 연필입니다.", hardness);
		
		return info;
		
	}

}
