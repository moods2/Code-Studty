package com.test.control;

public class Ex12_For_question_27 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		for(int i=1; i<=5; i++) {
			
			char a = 97;
						
			for(int k=5; k>=i; k--) {
				
				System.out.print(" ");
				
			}
			
			for(int j=1; j<=i; j++) {
				
				System.out.print(a);
				a++;
				
			}
			
					
			for(int l=1; l<=i; l++) {
				
				a--;
				System.out.print(a);
								
			}
			
			
			System.out.println();
			
		}
				
	}

}
