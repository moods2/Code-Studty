package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		//숫자 10개를 입력받아 짝수의 합과 홀수의 합을 각각 출력하시오.
		
		//5. 누적 변수(짝수용, 홀수용)
		//3. 반복문 실행(for) {
		//1. BufferedReader 만든다.
		//2. 숫자를 입력받는다.
		//6. 짝수인지? 홀수인지?
		//7. 짝수면 > 짝수용 누적 변수에 누적
		//   홀수면 > 홀수용 누적 변수에 누적
		//4. }
				
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int sum1 = 0;
		int sum2 = 0;
		System.out.print("숫자의 개수 : ");
		int count = Integer.parseInt(reader.readLine());
		
		for (int i=1; i<=count; i++) {
			
		System.out.print("숫자 : ");
		int num = Integer.parseInt(reader.readLine());
		
			if (num % 2 == 0) {
				
				sum1 += num;
								
			} else {
				
				sum2 += num;
								
			}
			
		}
		System.out.printf("짝수의 합 : %,d\n", sum1);
		System.out.printf("홀수의 합 : %,d\n", sum2);
	}

}
