package com.test.object;

public class Ex24_Constructor_question_02 {
	
	public static void main(String[] args) {
		
		//시간 1
		Time t1 = new Time(); //기본 생성자 호출
		System.out.println(t1.info());

		//시간 2
		Time t2 = new Time(2, 30, 45); //오버로딩 생성자 호출
		System.out.println(t2.info());

		//시간 3
		Time t3 = new Time(1, 70, 30); //오버로딩 생성자 호출
		System.out.println(t3.info());

		//시간 4
		Time t4 = new Time(30, 10); //오버로딩 생성자 호출
		System.out.println(t4.info());

		//시간 5
		Time t5 = new Time(90, 10); //오버로딩 생성자 호출
		System.out.println(t5.info());

		//시간 6
		Time t6 = new Time(50); //오버로딩 생성자 호출
		System.out.println(t6.info());

		//시간 7
		Time t7 = new Time(10000); //오버로딩 생성자 호출
		System.out.println(t7.info());
		
	}

}

class Time {
	
	private int hour;
	private int minute;
	private int second;
	
	
	public Time() {
		
		this(0, 0, 0);
		
	}
	
	public Time(int hour, int minute, int second) {
		
		this.hour = hour;
		this.minute = minute;
		this.second = second;
		
	}
	
	public Time(int minute, int second) {
		
		this(0, minute, second);
		
	}
	
	public Time(int second) {
		
		this(0, 0, second);
		
	}
	
	public String info() {
		
		String result = "";
		
		if (second > 60) {
			
			minute += second / 60;
			hour += minute / 60;
			minute = minute % 60;
			second = second % 60;			
			
		}
		
		if (minute > 60) {
			
			hour += minute / 60;
			minute = minute % 60;
			
		}
		
		result = String.format("%d:%d:%d", hour, minute, second);
				
		return result;		
		
	}
	
	
}