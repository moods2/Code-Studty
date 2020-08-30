package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_01 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("문장 입력 : ");
		String str = reader.readLine();
		
		for (int i=str.length()-1; i>=0; i--) {
			
			System.out.print(str.charAt(i));
			
		}
		
		
	}

}
