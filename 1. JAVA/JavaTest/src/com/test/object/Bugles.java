package com.test.object;

import java.util.Calendar;

public class Bugles {
	
	private int price;
    private int weight;
    private Calendar creationTime;
    private int expiration;
    private String eat;
    
    
    //용량
	public void setWeight(int weight) {
		
		if (weight == 300 || weight == 500 || weight == 850) {
		
			this.weight = weight;
			
		} 
		
	}
    
	
	//가격
	public int getPrice() {
		
		if (weight == 300) {
			
			this.price = 850;
			
		} else if (weight == 500) {
			
			this.price = 1200;
			
		} else if (weight == 850) {
			
			this.price = 1950;
			
		}
		
		return price;
	}
	
	
	//생산일자
	public void setCreationTime(String creationTime) {
		
		Calendar c = Calendar.getInstance();
		
		int year, month, date;
		
		year = Integer.parseInt(creationTime.substring(0, 4));
		month = Integer.parseInt(creationTime.substring(5, 7));
		date = Integer.parseInt(creationTime.substring(8));
		
		c.set(year, month-1, date);
		
		//c.set(Integer.parseInt(creationTime.substring()), )
		
		this.creationTime = c;
	}
	
	//유통기한
	public int getExpiration() {
		
		Calendar now = Calendar.getInstance();
		
		if (weight == 300) {
			
			creationTime.add(Calendar.DATE, 7);
			
		} else if (weight == 500) {
			
			creationTime.add(Calendar.DATE, 10);
			
		} else if (weight == 850) {
			
			
			creationTime.add(Calendar.DATE, 15);
		}
		
		long creationTimes = creationTime.getTimeInMillis();
		long nows = now.getTimeInMillis();
		
		expiration = (int)((creationTimes - nows) / 1000 / 60 / 60 / 24);
		
		
		return expiration;
	}
    
    
	//먹을수있는지
	public String eat() {
		
		if (expiration >= 0) {
			
			System.out.print("과자를 맛있게 먹습니다.");
			
		} else {
			
			System.out.print("유통기한이 지나 먹을 수 없습니다.");
			
		}
			
		return eat;
	}
	

}
