package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_03 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());
		
		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());
		
		System.out.print("연산자 : ");
		int operator = reader.read();
		
		
		if (operator == '+') {
			
			System.out.printf("%d + %d = %d\n", num1, num2, num1 + num2);
			
		} else if (operator == '-') {
			
			System.out.printf("%d - %d = %d\n", num1, num2, num1 - num2);
			
		} else if (operator == '*') {
			
			System.out.printf("%d * %d = %d\n", num1, num2, num1 * num2);
			
		} else if (operator == '/') {
			
			System.out.printf("%d / %d = %.1f\n", num1, num2, (double)num1 / num2);
			
		} else if (operator == '%') {
			
			System.out.printf("%d %% %d = %d\n", num1, num2, num1 % num2);
			
		}
		
	}

}
