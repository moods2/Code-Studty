package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		//1 - 2 + 3 - 4 + 5 - 6 + 7 - 8 + 9 - 10 = -5
		
		//2. 누적 변수를 생성한다.
		//1. 루프를 생성한다. (for x 10회 ** i 누적 변수 사용) {
		//3. 숫자(i)를 출력한다. + 숫자(i)를 누적한다. (부호를 번갈아가며)
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
		
		//현재 루프 변수 -> 사용할 숫자 & 자릿수
		for (int i=start; i<=end; i++) { //1.
			
			if (i == end) {
		
				System.out.printf("%d ", i);
		
			} else if(i % 2 == 1) {
				
				System.out.printf("%d - ", i);
				
				sum -= i;
				
			} else if (i % 2 == 0) {
				
				System.out.printf("%d + ", i); //3.
				
				sum += i;
			}
				
		}		
		
		System.out.printf("= %d", sum); //4.
	}

}
