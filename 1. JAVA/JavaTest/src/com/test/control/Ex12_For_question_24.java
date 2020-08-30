package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_24 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("행의 갯수 : ");
		int line = Integer.parseInt(reader.readLine());
		
		for (int i=1; i<=line; i++) { //행제어
			
			for (int k=line; k>i; k--) { //공백제어
				
				System.out.print(" ");
				
			}
			
			for (int j=1; j<=i; j++) { //열제어
				
				System.out.print("*");
				
			}
			
			System.out.println();
		}
	}
}
