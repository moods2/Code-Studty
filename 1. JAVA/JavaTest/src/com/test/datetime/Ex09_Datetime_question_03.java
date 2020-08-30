package com.test.datetime;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex09_Datetime_question_03 {
	
	public static void main(String[] args) throws Exception {
		
		
		year();		
		
				
	}
	
	public static void year() throws Exception {
	
		Calendar c1 = Calendar.getInstance();
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	
		System.out.print("태어난 년도 : ");
	
		String year = reader.readLine();
		
		int year1 = Integer.parseInt(year);
		
		System.out.printf("나이 : %d세", c1.get(Calendar.YEAR) - year1 + 1);
		
	
	}

}
