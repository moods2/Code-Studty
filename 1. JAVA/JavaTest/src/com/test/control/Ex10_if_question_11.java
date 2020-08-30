package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_11 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 입력 : ");
		int num = Integer.parseInt(reader.readLine());
		
		if (num < 9220000000000000000L && num > -9220000000000000000L) {
		
			if (num <= 127 && num >= -128) {
			
				System.out.print("byte\n"
						+ "short\n"
						+ "int\n"
						+ "long");
			
			} else if (num <= 32767 && num >= -32768) {
			
				System.out.print("short\n"
						+ "int\n"
						+ "long");
						
			} else if (num <= 2100000000 && num >= -2100000000) {
			
				System.out.print("int\n"
						+ "long");
			
			} else {
			
				System.out.print("long");
			
			}
		}
	}

}
