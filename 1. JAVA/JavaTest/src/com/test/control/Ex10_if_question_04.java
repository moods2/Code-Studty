package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("문자 : ");
		int alph = reader.read();
		
		if (alph == 'f' || alph == 'F') {
			
			System.out.println("Father");
			
		} else if (alph == 'm' || alph == 'M') {
			
			System.out.println("Mother");
			
		} else if (alph == 's' || alph == 'S') {
			
			System.out.println("Sister");
			
		} else if (alph == 'b' || alph == 'B') {
			
			System.out.println("Brother");
			
		} else {
			
			System.out.println("잘못된 문자입니다.");
			
		}
		
	}

}
