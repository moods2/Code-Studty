package com.test.control;

public class Ex12_For_question_16 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		boolean loop = true;
		int a = 1;

		int sum = 0;
		
		
		for (int i=1; i<=15; i++) {
			
			
			
			if(i == 15) {
				
				System.out.printf("= %d", sum);
				break;
			}
			
			sum += a;
			
			System.out.printf("%d + ", a);
			
			a += i;
					
		}
		
	}

}
