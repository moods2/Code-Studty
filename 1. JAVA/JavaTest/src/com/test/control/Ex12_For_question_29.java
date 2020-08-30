package com.test.control;

public class Ex12_For_question_29 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for (int i=1; i<=100; i++) {
		
			int sum = 0;
			
			if(i > 10) {
				break;				
			} 
			
			for (int j=1; j<=10*i; j++) {
				
				sum += j;
				
			}
			
			System.out.printf("1 ~ %d : %d\n", i*10, sum);
			
		}
		
	}

}
