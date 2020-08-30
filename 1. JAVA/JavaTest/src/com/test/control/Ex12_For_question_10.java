package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_10 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("년 : ");
		int year = Integer.parseInt(reader.readLine());
		System.out.print("월 : ");		
		int month = Integer.parseInt(reader.readLine());
		System.out.print("일 : ");		
		int date = Integer.parseInt(reader.readLine());
		
		boolean loop = true;
		int today = 0;
		int firstday = 1;
						
		int month1 = 31;
		int month2 = 28;
		int month3 = 31;
		int month4 = 30;
		int month5 = 31;
		int month6 = 30;
		int month7 = 31;
		int month8 = 31;
		int month9 = 30;
		int month10 = 31;
		int month11 = 30;
		
		
		String when = (date % 7 == 1) ? "월요일" : (date % 7 == 2) ? "화요일" : (date % 7 == 3) 
				? "수요일" : (date % 7 == 4) ? "목요일" : (date % 7 == 5) ? "금요일" : (date % 7 == 6) 
				? "토요일" : (date % 7 == 0) ? "일요일" : "?";
		
				
		for (;loop;) {
			
			if (month == 1) {				
				today = (year - 1) * 365 + date;
				break;				
				
			} else if (month == 2) {				
				today = (year - 1) * 365 + month1 + date;
				break;				
				
			} else if (month == 3) {				
				today = (year - 1) * 365 + month2 + date;
				break;				
				
			} else if (month == 4) {				
				today = (year - 1) * 365 + month3 + date;
				break;				
				
			} else if (month == 5) {				
				today = (year - 1) * 365 + month4 + date;
				break;				
				
			} else if (month == 6) {				
				today = (year - 1) * 365 + month5 + date;
				break;				
				
			} else if (month == 7) {				
				today = (year - 1) * 365 + month6 + date;
				break;				
				
			} else if (month == 8) {				
				today = (year - 1) * 365 + month7 + date;
				break;				
				
			} else if (month == 9) {				
				today = (year - 1) * 365 + month8 + date;
				break;				
				
			} else if (month == 10) {				
				today = (year - 1) * 365 + month9 + date;
				break;				
				
			} else if (month == 11) {				
				today = (year - 1) * 365 + month10 + date;
				break;				
				
			} else if (month == 12) {				
				today = (year - 1) * 365 + month11 + date;
				break;				
			} 
			
		}
				
		System.out.printf("%d년 %d월 %d일은 %,d일째 되는 날입니다.\n", year, month, date, today - firstday);
		System.out.printf("오늘은 %s입니다.", when);
	
	}

}
