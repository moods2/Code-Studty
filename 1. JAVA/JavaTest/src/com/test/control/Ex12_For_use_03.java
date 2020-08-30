package com.test.control;

public class Ex12_For_use_03 {
	
	public static void main(String[] args) {
		
//		m1();
//		m2();
		m3();
		
	}

	private static void m3() {
		
		//별찍기
		
		for (int i=0; i<5; i++) { //행
			for(int j=0; j<5; j++) { //열
				System.out.print("*");
				
			}
			System.out.println();
		}
		System.out.println();
		
		
		for (int i=0; i<5; i++) {
			for(int j=0; j<=i; j++) {
				System.out.print("*");
				
			}
			System.out.println();
		}
		System.out.println();
		
		
		for (int i=0; i<5; i++) { 
			for(int j=i; j<5; j++) { 
				System.out.print("*");
				
			}
			System.out.println();
		}
		System.out.println();
		
	}

	private static void m2() {
		
		//*****
		for (int i=0; i<10; i++) {
			
			for (int j=0; j<10; j++) {
				
//				if(i == 5) {
//				if(j == 5) {
				if(i % 2 == 0 && j > 5) {
//					break; //자신이 포함된 제어문 탈출. j? i?
					continue;
				}
				
				System.out.printf("i : %d, j: %d\n", i, j);	
			}
			
		}
				
	}

	private static void m1() {
		
		//구구단
		//2단 ~ 9단
		
		for (int j=2; j<10; j++) {
		
			for (int i=1; i<10; i++) {
				
				System.out.printf("%d x %d = %2d\n", j, i, j * i);
				
			}
			
			System.out.println();
		}
				
	}

}
