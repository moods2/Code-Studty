package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		//1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
		
		//2. 누적 변수를 생성한다.
		//1. 루프를 생성한다.(for x 10회 ** i 누적 변수 사용) {
		//3. 숫자(i)를 출력한다. + 숫자(i)를 누적한다.
		//1. }
		//4. 누적값을 출력한다.	
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("시작 숫자 : ");
		int start = Integer.parseInt(reader.readLine());
		System.out.print("종료 숫자 : ");
		int end = Integer.parseInt(reader.readLine());
		
		int sum = 0; //2.
		
		for (int i=start; i<=end; i++) { //1.
			
			sum += i;
			
			if(i == end) {
				
				System.out.print(i);
				
			} else {
			
				System.out.printf("%d + ", i); //3.
				
			}
			
		}
		
		System.out.printf(" = %d", sum); //4.
		
	}

}
