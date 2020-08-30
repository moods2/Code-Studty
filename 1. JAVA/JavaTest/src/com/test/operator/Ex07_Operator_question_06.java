package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("문자 입력 : ");
		
		int word = reader.read();
		
		int word1 = word - 32;
		
		System.out.printf("소문자 \'%s\'의 대문자는 \'%s\'입니다.", (char)word, (char)word1);
	
		
	}

}
