package com.test.error2;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_use_01 {
	
	public static void main(String[] args) throws Exception {
		
//		m1();
//		m2();
		m3();
		
	}

	private static void m3() throws Exception {
		
		//사용자가 짝수를 입력하면 누적, 홀수를 입력하면 중단하시오. 횟수는 무제한입니다.
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int sum = 0; //지역변수는 생성과 동시에 초기화를 해줘야한다.
		int i;
		
		for (i=0;;i++) {
			
			System.out.print("숫자: ");
			int num = Integer.parseInt(reader.readLine());
			
			if (num % 2 == 0) { // 짝수가 누적인데 나머지가 1일때 라고 되어있다. -> 나머지를 0으로 바꾼다.
				sum += num; // = 가 아니라 +=를 써서 값을 누적시켜야 한다.
			} else {
				break;
			}
			
		}
		
		System.out.printf("%d회 입력 결과: %,d\n", i, sum);		
		
	}

	private static void m2() {
		
		//1 ~ 10까지의 합을 구하시오.
		int sum = 0; //지역변수는 생성과 동시에 초기화를 해줘야한다.
		
		for (int i=1; i<=10; i++) {
			System.out.println(i);
			sum += i; // = 가 아니라 +=를 써서 값을 누적시켜야 한다.
		}
		
		System.out.println(sum);
		
		
	}

	private static void m1() {
		
		//구구단 출력
		// - 9단을 출력합니다.
		
		int dan = 9;
		
		for (int i=1; i<=9; i++) { // 조건문이 i==9라고 되어있는데 9보다 작거나 같을 때 가 맞다.
			
			System.out.printf("%d x %d = %2d\n"
								, dan, i, dan * i);
			
		}
		
	}

}






