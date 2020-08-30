package com.test.object;

public class Note {
	
	private String size;
    private String color;
    private int page;
    private String owner;
    
    private int price = 500;
    private String thickness;
    
    
    //크기
	public void setSize(String size) {
		
		if (size.equals("A3") 
			|| size.equals("A4")
			|| size.equals("A5")
			|| size.equals("B3")
			|| size.equals("B4")
			|| size.equals("B5")) {
			
			this.size = size;
						
			if (size.equals("A3")) {
				this.price += 400;
			} else if (size.equals("A4")) {
				this.price += 200;
			} else if (size.equals("B3")) {
				this.price += 500;
			} else if (size.equals("B4")) {
				this.price += 300;
			} else if (size.equals("B5")) {
				this.price += 100;
			} 
			
		}
	}
	
	//표지 색상
	public void setColor(String color) {
		
		if (color.equals("검정색")
			|| color.equals("흰색")
			|| color.equals("노란색")
			|| color.equals("파란색")) {
			
			this.color = color;
			
			if (color.equals("검정색")) {
				this.price += 100;
			} else if (color.equals("노란색") || color.equals("파란색")) {
				this.price += 200;
			}
			
		}
	}
	
	//페이지수
	public void setPage(int page) {
		
		if (page >= 10 && page <= 200) {
			
			this.page = page;
			
			if (page <= 50) {
				this.thickness = "얇은";
			} else if (page <= 100) {
				this.thickness = "보통";
			} else {
				this.thickness = "두꺼운";
			}
		}
		
		this.price += (this.page - 10) * 10;
	}


	//소유자
	public void setOwner(String owner) {
		
		boolean result = false;
		
		if (owner.length() < 2 || owner.length() > 5) {
			result = true;
		}
		
		for (int i=0; i<owner.length(); i++) {
			char c = owner.charAt(i);
			if (c < '가' || c > '힣') {
				result = true;
				break;
			}
		}
		
		if (!result) {
			this.owner = owner;
		}
	}
	
	
	//정보
	public String info() {
		
		String info = "";
		
		info += "======= 노트 정보 =======\n";
		
		if (this.owner != null) {
			//info += "소유자: " + this.owner + "\n";
			//info += "특성: " + this.color + " " + this.thickness + " " + this.size + "노트\n";
			//info += "가격: " + this.price + "원\n";
			
			//void printf()
			//String format()
			info += String.format("소유자: %s\n", this.owner);
			info += String.format("특성: %s %s %s 노트\n", this.color, this.thickness, this.size);
			info += String.format("가격: %,d원\n", this.price);
			
			
		} else {
			info += "주인 없는 노트\n";
		}
		
		info += "=========================\n";
				
		return info;
	}
    
    

}

