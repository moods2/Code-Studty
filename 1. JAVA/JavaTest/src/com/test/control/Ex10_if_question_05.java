package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("문자 : ");
		int alph = reader.read();
		
		if (alph >= 'a' && alph <= 'z') {
			
			System.out.printf("%c", alph - 32);
			
		} else if (alph >= 'A' && alph <= 'Z') {
			
			System.out.printf("%c", alph + 32);
			
		} else {
			
			System.out.println("정확한 문자를 입력하세요.");
			
		}
		
	}

}
