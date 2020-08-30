package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		
		String num1 = reader.readLine();
				
		System.out.print("두번째 숫자 : ");
		
		String num2 = reader.readLine();
		
		System.out.print("세번째 숫자 : ");
		
		String num3 = reader.readLine();
		
		int realNum1 = Integer.parseInt(num1);
		
		int realNum2 = Integer.parseInt(num2);
		
		int realNum3 = Integer.parseInt(num3);
		
		int result = (realNum1 > realNum2) ? realNum1 : realNum2;
		
		int result2 = (realNum3 > result) ? realNum3 : result;
		
		System.out.printf("%d와(과) %d와(과) %d 중에 더 큰 숫자는 %d입니다."
																, realNum1
																, realNum2
																, realNum3
																, result2);
		
	
		
		
	}

}
