package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("단어 : ");
		String word = reader.readLine();
		String result = "";
		
		for (int i=0; i<word.length(); i++) {
			
			//word.charAt(0)은 무조건 참이기 때문에 i 가 0 이라는 조건이 안붙으면 else문으로 넘어가지 못함.
			if (i == 0 && word.charAt(0) >= 'A' && word.charAt(0) <= 'Z') {
			
				result += word.charAt(i);
			
			} else if (word.charAt(i) >= 'A' && word.charAt(i) <= 'Z') {
				
				result += " " + word.charAt(i);
				
			} else {
				
				result += word.charAt(i);
				
			}
			
		}
		
		System.out.printf("결과 : %s", result);
		
	}

}
