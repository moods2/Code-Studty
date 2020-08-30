package com.test.control;

public class Ex12_For_question_22 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for (int i=1; i<=5; i++) {
			
			for (int j=5; j>=i; j--) {
				
				
				System.out.printf("i : %d, j : %d\n", i, j);
				
			}
			
		}
		
	}

}
