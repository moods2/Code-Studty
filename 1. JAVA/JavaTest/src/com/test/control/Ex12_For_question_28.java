package com.test.control;

public class Ex12_For_question_28 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for (int i=1; i<10; i++) { //2단 ~ 5단
			
			System.out.println();
			
			for (int j=2; j<6; j++) {
				
				System.out.printf("%d x %d = %2d  ", j, i, i * j);
				
			}				
		} 
			System.out.println();
		
		for (int i=1; i<10; i++) { //6단 ~ 9단
			
			System.out.println();
			
			for (int j=6; j<10; j++) {
			
			System.out.printf("%d x %d = %2d  ", j, i, i * j);
			
			}
		}
						
	}
				
}
