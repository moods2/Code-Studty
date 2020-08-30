package com.test.datetime;

import java.util.Calendar;

public class Ex09_Datetime_question_01 {
	
	public static void main(String[] args) {
		
		nowTime();
		System.out.println();
		notTime_AMPM();
		
	}

	private static void notTime_AMPM() {
		
		Calendar c1 = Calendar.getInstance();
		
		System.out.printf("현재 시간 : %s %d시 %d분 %d초"
				,c1.get(Calendar.AM_PM) == 0 ? "오전" : "오후"
				,c1.get(Calendar.HOUR)
				,c1.get(Calendar.MINUTE)
				,c1.get(Calendar.SECOND));
		
	}

	private static void nowTime() {
		
		Calendar c1 = Calendar.getInstance();
		
		System.out.printf("현재 시간 : %d시 %d분 %d초\n"
				,c1.get(Calendar.HOUR_OF_DAY)
				,c1.get(Calendar.MINUTE)
				,c1.get(Calendar.SECOND));
		
	}

}
