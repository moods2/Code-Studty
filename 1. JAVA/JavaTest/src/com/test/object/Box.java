package com.test.object;

public class Box {

private Macaron[] list = new Macaron[10];

    public void cook() {
    	System.out.println("마카롱을 10개 만들었습니다.");
    	System.out.println();
    	
    	for(int i=0; i<10; i++) {
    		
    		int msize = (int)(Math.random() * 11 + 5);
    		
    		list[i] = new Macaron();
    		
    		list[i].setSize(msize);
    				
			int num = (int)(Math.random() * 8) + 1;
			
			if (num == 1) {
				
				list[i].setColor("red");
				
			} else if (num == 2) {
				
				list[i].setColor("blue");
				
			} else if (num == 3) {
				
				list[i].setColor("yellow");
				
			} else if (num == 4) {
				
				list[i].setColor("white");
				
			} else if (num == 5) {
				
				list[i].setColor("pink");
				
			} else if (num == 6) {
				
				list[i].setColor("purple");
				
			} else if (num == 7) {
				
				list[i].setColor("green");
				
			} else if (num == 8) {
				
				list[i].setColor("black");
				
			}
					
			int thick = (int)(Math.random() * 19) + 1;
			
    		list[i].setThickness(thick);
			
		}
    	
    }
    
    
    public void check() {
    	
    	int pass=0, fail=0;
    	
    	for (int i=0; i<10; i++) {
    		
    		if ((list[i].getSize() >= 8 && list[i].getSize() <= 14) && list[i].getColor() != "black"
    				&& (list[i].getThickness() >= 3 && list[i].getThickness() <= 18)) {
    			
    			pass++;
    			
    		} else {
    			
    			fail++;
    			
    		}
    		
    	}
    	
    	System.out.println("[박스 체크 결과]");
    	System.out.printf("QC 합격 개수 : %d개\n", pass);
    	System.out.printf("QC 불합격 개수 : %d개\n", fail);
    	System.out.println();
    	
    }
    
    
    public void list() {
    	System.out.println("[마카롱 목록]");
    	String result = "";
    	for (int i=0; i<10; i++) {
    		
    		if ((list[i].getSize() >= 8 && list[i].getSize() <= 14) && list[i].getColor() != "black"
    				&& (list[i].getThickness() >= 3 && list[i].getThickness() <= 18)) {
    			
    			result = "합격";
    			
    		} else {
    			
    			result = "불합격";
    			
    		}
    	System.out.printf("%d번 마카롱 : %dcm(%s, %dmm) : %s\n"
    					, i+1, list[i].getSize(), list[i].getColor(), list[i].getThickness(), result);
    	
    	}
    	
    }
	

	
	
}
