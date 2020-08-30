package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("종료 숫자 : ");
		int end = Integer.parseInt(reader.readLine());
		
		int sum = 0;
		boolean loop = true;
		String result = "";
		
		for (;loop;) {
			
		System.out.print("숫자 : ");
		int num = Integer.parseInt(reader.readLine());
		
			if (sum >= end) {
				
				break;
				
			} else if (num % 2 == 0) {
				
				result += " + " + num;
				sum += num;
				
			} else {
				
				//System.out.printf("%d - ", num);
				result += " - " + num;
				sum -= num;
				
			}
		
		}
		
		System.out.printf("%s = %d", result, sum);
		
	}

}
