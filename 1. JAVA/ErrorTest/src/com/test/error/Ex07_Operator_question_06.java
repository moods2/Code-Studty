package com.test.error;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_06 {

	public static void main(String[] args) throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("문자 입력 : ");
		// 문자 입력 시 String을 쓰면 a로 받지만 int를 쓰면 숫자로 받아지기 때문에 더 편하다 
		int c = reader.read();
		
		System.out.printf("소문자 '%c'의 대문자는 '%c'입니다.\n", c, c - 32);
		
	}
	
}








