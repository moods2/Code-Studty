package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_11 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("최대 숫자 : ");
		int max = Integer.parseInt(reader.readLine());
		
		for (int i=1; i<=max; i++) {
			
			int a = i % 10; //일의자리
			int b = i / 10; //십의자리
			
			if((a == 3 || a == 6 || a == 9) && (b == 3 || b == 6 || b == 9)) {
				
				System.out.print("짝짝" + " ");
				
			} else if ((a == 3 || a == 6 || a == 9) || (b == 3 || b == 6 || b == 9)) {
				
				System.out.print("짝" + " ");
				
			} else {
				
				System.out.printf("%d" + " ", i);
				
			}
			
		}
		
		
	}

}
