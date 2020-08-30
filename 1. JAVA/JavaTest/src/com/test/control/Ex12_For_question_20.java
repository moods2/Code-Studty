package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_20 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader =  new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("첫번째 숫자 : ");
		int num1 = Integer.parseInt(reader.readLine());
		System.out.print("두번째 숫자 : ");
		int num2 = Integer.parseInt(reader.readLine());
		// 숫자를 2개 입력받아 각각의 약수와 공약수를 구하시오.
		
		first(num1);
		first(num2);
		second(num1, num2);
		
	}

	private static void second(int num1, int num2) {
		
		String result = ""; //5. 문자열 초기화
		
		for (int j=1; j<=num1; j++) {
		
			if (num1 % j == 0) { // 1. 첫번째 숫자의 약수 조건
				
				if (num2 % j == 0) { // 2. 두번째 숫자의 약수 조건
					
					result += j + " "; // 3. 둘다 만족하면 문자열에 저장
				}
				
			}
		}	
		System.out.printf("%d와 %d의 공약수 : %s\n", num1, num2, result); // 4. 공약수 출력
		
	}

	private static void first(int num) {
		
		String result = ""; // 3.문자열 초기화
		
		for (int j=1; j<=num; j++) {
		
			if (num % j == 0) { // 약수 조건
				
				result += j + " "; // 1.약수 문자열에 저장
				
			}
		}	
		System.out.printf("%d의 약수 : %s\n", num, result); // 2.약수 출력
		
	}

}
