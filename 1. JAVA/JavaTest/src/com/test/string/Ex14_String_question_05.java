package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 : ");
		String num = reader.readLine();
		String result = "";
		
		for (int i=0; i<=num.length()-1; i++) {
			
			
			
			if (i % 3 == 1) {
				
				result += "," + num.charAt(i);
				
			} else {
				
				result += num.charAt(i);
				
			}
			
			
		}
		
		System.out.printf("결과 : %s", result);
		
	}

}
