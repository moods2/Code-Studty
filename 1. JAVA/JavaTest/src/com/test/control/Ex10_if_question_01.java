package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_01 {
	
	public static void main(String[] args) throws Exception{
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());
		
		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());
		
		
		if (num1 > num2) {
			
			System.out.printf("큰수는 %d이고, 작은수는 %d입니다.", num1, num2);
			
		} else if (num1 < num2) {
			
			System.out.printf("큰수는 %d이고, 작은수는 %d입니다.", num2, num1);
			
		} else {
			
			System.out.printf("두 수의 크기가 같습니다.");
			
		}
		
		
	}

}
