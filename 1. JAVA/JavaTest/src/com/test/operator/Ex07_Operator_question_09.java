package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("영문자 입력 : ");
		
		int alph = reader.read();
				
		
		String result = (alph >= 65 && alph <= 90) ? "대문자" 
				: (alph >= 97 && alph <= 122) ? "소문자" : " ";
		
		
		System.out.printf("입력한 문자 \'%s\'는 %s입니다.", (char)alph, result);
		
		
		
	}

}
