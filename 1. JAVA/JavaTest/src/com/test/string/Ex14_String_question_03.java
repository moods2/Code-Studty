package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_03 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {

		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 : ");
		String num = reader.readLine();
		int sum = 0;
		String result = "";
		
		
		for (int i=0; i<=num.length()-1; i++) {
			
			result += num.charAt(i) + " + ";	
			
			sum += num.charAt(i) - '0'; // char형의 숫자를 int형으로 형변환 시 '0'을 빼주면 숫자 아스키코드값이 나옴
					
			
		}
		
		System.out.printf("%s = %d", result, sum);
		
		
		
	}

}
