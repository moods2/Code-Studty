package com.test.error;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex05_Input_use {

	public static void main(String[] args) throws Exception {
		
		BufferedReader reader 
		= new BufferedReader(new InputStreamReader(System.in));
		//BufferdReader와 InputStreamReader 를 import 해와야함
		
		System.out.print("첫번째 숫자: ");
		String num1 = reader.readLine();
		
		System.out.print("두번째 숫자: ");
		String num2 = reader.readLine();
		
		int realNum1 = Integer.parseInt(num1); // (int)num1이 아니라 Integer.parseInt(num1) 이어야 함
		int realNum2 = Integer.parseInt(num2); // (int)num2이 아니라 Integer.parseInt(num2) 이어야 함
		
		System.out.printf("%,d + %,d = %,d\n"
								, realNum1
								, realNum2
								, realNum1 + realNum2);
				
		
		
	}
	
}













