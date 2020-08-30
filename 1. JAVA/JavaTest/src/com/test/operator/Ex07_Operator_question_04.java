package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("사용자가 페달을 밟은 횟수 : ");
		
		String count = reader.readLine();
		
		
		System.out.print("기어비 : ");
		
		String gear = reader.readLine();
		
		
		int count1 = Integer.parseInt(count);
		
		int gear1 = Integer.parseInt(gear);
		
		
		System.out.printf("사용자가 총 %,d회 페달을 밟아 자전거가 총 "
				+ "%,.0fm를 달렸습니다.", count1, (count1 * 0.66) * gear1);
				
		
	}

}
