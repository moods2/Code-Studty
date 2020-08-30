package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_08 {
	
	public static void main(String[] args) throws Exception{
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("날짜 입력 : ");
		
		String date = reader.readLine();
		
		int date1 = Integer.parseInt(date);
		
		String result = (date1 % 7 == 1) ? "수요일" : (date1 % 7 == 2) ? "목요일" : (date1 % 7 == 3) 
						? "금요일" : (date1 % 7 == 4) ? "토요일" : (date1 % 7 == 5) ? "일요일" : (date1 % 7 == 6) 
						? "월요일" : (date1 % 7 == 0) ? "화요일" : "?";
		
		
		System.out.printf("입력하신 2020년 4월 %d일은 \'%s\'입니다."
											, date1
											, result);
		
		
		
		
	}

}
