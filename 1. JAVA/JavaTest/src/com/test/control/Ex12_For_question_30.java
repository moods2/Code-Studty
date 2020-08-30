package com.test.control;

public class Ex12_For_question_30 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for (int i=1; i<=100; i++) {
		
			int sum = 0;
			
			if(i > 10) {
				break;				
			} 
			
			for (int j=i*10-9; j<=i*10; j++) {
				
				sum += j;
				
			}
			
			System.out.printf("%d ~ %d : %d\n", i*10-9, i*10, sum);
			
		}
		
	}

}
