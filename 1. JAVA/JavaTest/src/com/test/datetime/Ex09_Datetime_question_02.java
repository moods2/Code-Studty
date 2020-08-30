package com.test.datetime;

import java.util.Calendar;

public class Ex09_Datetime_question_02 {
	
	public static void main(String[] args) {
		
		hundred();
		stone();
		
	}

	private static void stone() {
		
		Calendar c1 = Calendar.getInstance();
		
		c1.add(Calendar.YEAR, 1);
		
		System.out.printf("첫돌 : %tF\n", c1);
		
	}

	private static void hundred() {
		
		Calendar c1 = Calendar.getInstance();
		
		c1.add(Calendar.DATE, 100);
		
		System.out.printf("백일 : %tF\n", c1);
		
	}

}
