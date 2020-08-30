package com.test.control;

public class Ex12_For_question_17 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

private static void m1() {
		
		
		int a = 1, b = 1, c;
		
		int sum = 0;
		
		
		for (int i=0; i<=11; i++) {
		
			if(i == 11) {
				
				System.out.printf("= %d", sum);
				break;
			}
			
			
			System.out.printf("%d + ", a);
			
			sum += a;
			
			c = a + b;
			a = b;
			b = c;
					
		}
		
	}

}
