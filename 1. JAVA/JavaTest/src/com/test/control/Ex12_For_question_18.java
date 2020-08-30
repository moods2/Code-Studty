package com.test.control;

public class Ex12_For_question_18 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for (int i=2; i<100; i++) {
			
			int count = 0;
			
			for (int j=2; j<i; j++) {
				
				if(i % j == 0) {
					count++;
				}
			}
			
			
			if(count == 0) {
				System.out.printf("%d, ", i);
			}
		
		}
		
	}

}
