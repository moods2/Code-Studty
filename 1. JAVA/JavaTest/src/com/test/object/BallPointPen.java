package com.test.object;

public class BallPointPen {
	
	private double thickness;
	private String color;
	
	//볼펜 심 두께
	public double getThickness() {
		
		return thickness;
	}
	
	public void setThickness(double thickness) {
			
			this.thickness = thickness;
		
	}

	//볼펜 색상
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		
			this.color = color;
		
	}
	
	//정보
	public String info() {
		
		String info = "";
		
		info = String.format("포장 전 검수 : %s색상 %.1fmm 볼펜입니다.", color, thickness);
		
		return info;
		
	}

}
