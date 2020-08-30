package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_10 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("근무 년수 : ");
		int year = Integer.parseInt(reader.readLine());
				
		if(year <= 4 && year >= 1) {
			
			System.out.printf("%d년차 초급 개발자입니다.\n"
					+ "앞으로 %d년 더 근무를 하면 중급 개발자가 됩니다.", year, 5 - year);
			
		} else if(year <= 9 && year >= 5) {
			
			System.out.printf("%d년차 중급 개발자입니다.\n"
					+ "당신은 %d년전까지 초급 개발자였습니다.\n"
					+ "앞으로 %d년 더 근무를 하면 고급 개발자가 됩니다.", year, year - 4, 10 - year);
			
		} else {
			
			System.out.printf("%d년차 고급 개발자입니다.\n"
					+ "당신은 %d년전까지 중급 개발자였습니다.", year, year - 9);
		
		}
		
	}

}
