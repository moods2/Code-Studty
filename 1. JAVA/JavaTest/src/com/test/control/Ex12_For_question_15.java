package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_15 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception{
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("9자리 숫자 입력 : ");
		int num = Integer.parseInt(reader.readLine());
		int sum1 = 0;
		int sum2 = 0;
		
		
		for (int i=1; i<10; i++) {
			
			if(num > 1000000000) { //9자리 넘어가면 아웃
				break;
				
			}
			
			if ((num % 10) % 2 == 0) { //10으로 나눈 나머지 : 1의자리
				sum1 += num % 10; //짝수면 더함
				
			} else {
				
				sum2 += num % 10; //홀수면 더함
			}
			
			num = num / 10; //10으로 나눠서 9자리 -> 8자리로 변환
			
		}
		
		System.out.printf("짝수의 합 : %d\n", sum1);
		System.out.printf("홀수의 합 : %d\n", sum2);
				
	}

}
