package com.test.method;

public class Ex08_Method_question_12 {
	
	public static void main(String[] args) {
		
		int count = positive(10);
		count = positive(10, 20);
		count = positive(10, 20, -30);
		count = positive(10, 20, -30, 40);
		count = positive(10, 20, -30, 40, 50);		
		
	}

	public static int positive(int a) {
		
		int count1 = a > 0 ? 1 : 0;
				
		System.out.printf("양수 : %d개\n", count1);
		
		return count1;
		
	}
	
	public static int positive(int a, int b) {
		
		int count1 = a > 0 ? 1 : 0;
		int count2 = b > 0 ? 1 : 0;
		
		int count = count1 + count2;
		
		System.out.printf("양수 : %d개\n", count);
		
		return count;
		
	}
	
	public static int positive(int a, int b, int c) {
		
		int count1 = a > 0 ? 1 : 0;
		int count2 = b > 0 ? 1 : 0;
		int count3 = c > 0 ? 1 : 0;
		
		int count = count1 + count2 + count3;
		
		System.out.printf("양수 : %d개\n", count);
		
		return count;
		
		
	}
	
	public static int positive(int a, int b, int c, int d) {
		
		int count1 = a > 0 ? 1 : 0;
		int count2 = b > 0 ? 1 : 0;
		int count3 = c > 0 ? 1 : 0;
		int count4 = d > 0 ? 1 : 0;
		
		int count = count1 + count2 + count3 + count4;
		
		System.out.printf("양수 : %d개\n", count);
		
		return count;
		
		
	}
	
	public static int positive(int a, int b, int c, int d, int e) {
		
		int count1 = a > 0 ? 1 : 0;
		int count2 = b > 0 ? 1 : 0;
		int count3 = c > 0 ? 1 : 0;
		int count4 = d > 0 ? 1 : 0;
		int count5 = e > 0 ? 1 : 0;
		
		int count = count1 + count2 + count3 + count4 + count5;
		
		System.out.printf("양수 : %d개\n", count);
		
		return count;
		
		
	}
}
