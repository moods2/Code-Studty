package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_12 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("입력 : ");
		String txt = reader.readLine();
		int len = txt.length();
		String result = "";
		int sum = 0;
		
		for (int i=0; i<len; i++) {
			
			if (txt.charAt(i) >= '0' && txt.charAt(i) <= '9') {
				
				
				sum += txt.charAt(i) - '0';
				
			} 
			
		}
		
		System.out.printf("문장에 존재하는 모든 숫자의 합은 %d입니다.", sum);
		
	}

}
