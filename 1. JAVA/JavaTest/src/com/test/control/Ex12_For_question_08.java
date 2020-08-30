package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_08 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("종료 숫자 : ");
		int end = Integer.parseInt(reader.readLine());
		int sum = 0;
		boolean loop = true;
		
		for (int i=1; loop; i++) {
			
			sum += i;
			
			if (sum <= end) {
				
				System.out.printf("%d + ", i);
				
			} else {
			
				System.out.printf("= %d", sum);	
				
				break;
				
			}
			
		}
		
	}

}
