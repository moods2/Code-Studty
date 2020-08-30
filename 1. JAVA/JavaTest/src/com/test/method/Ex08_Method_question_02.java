package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		digit(1);
		digit(10);
		digit(123);
		digit(5341);
		
	}

	public static void digit(int a) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 입력 : ");
		
		String num = reader.readLine();
		
		int num1 = Integer.parseInt(num);
		
		System.out.printf("%04d\n", num1);
		
		
	}
	
}
