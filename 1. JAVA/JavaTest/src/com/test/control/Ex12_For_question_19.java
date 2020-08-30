package com.test.control;

public class Ex12_For_question_19 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {

		
		for (int i=1; i<100; i++) { // 1부터 100사이의 완전수를 구하시오.
			
			String result = ""; // 3.다시 문자열 초기화
			int sum = 0;
			
			for (int j=1; j<i; j++) {
				
				if (i % j == 0) {
					sum += j; // 약수들의 합
					result += j + " "; // 1.약수들 문자열에 저장
					
				}
			}
			
			if (i == sum) {	// 약수들의 합이 자기자신과 같으면 출력 (완전수)
				System.out.printf("%d = [%s]\n", sum, result); // 2.문자열까지 출력 후
			}
			
		}
		
	}

}
