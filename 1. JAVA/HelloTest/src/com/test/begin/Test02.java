package com.test.begin;

public class Test02 { 	
	
	//머리좀 쓰자
	
	public static void main(String[] args) {
		
		int count = positive(10);
		count = positive(10, 20);
		count = positive(10, 20, -30);
		count = positive(10, 20, -30, 40);
		count = positive(10, 20, -30, 40, 50);		
		
	}

	public static int positive(int a) {
		
		int result = (a > 0) ? 1 : 0;
				
		System.out.printf("양수 : %d개\n", result);
		
		return result;
		
	}
	
	public static int positive(int a, int b) {
		
		int result = (a > 0 && b > 0) ? 2 : (a > 0 || b > 0) ? 1 : 0;
		
		System.out.printf("양수 : %d개\n", result);
		
		return result;
		
	}
	
	public static int positive(int a, int b, int c) {
		
		int result = (a > 0 && b > 0 && c > 0) ? 3 : (a > 0 && b > 0) ? 2
				: (a > 0 && c > 0) ? 2 : (b > 0 && c > 0) ? 2
				: (a > 0 || b > 0 || c > 0) ? 1 : 0; 
		
		System.out.printf("양수 : %d개\n", result);
		
		return result;
		
		
	}
	
	public static int positive(int a, int b, int c, int d) {
		
		int result = (a > 0 && b > 0 && c > 0 && d > 0) ? 4
				: (a > 0 && b > 0 && c > 0) ? 3 : (a > 0 && b > 0 && d > 0) 
				? 3 : (a > 0 && c > 0 && d > 0) ? 3 : (b > 0 && c > 0 && d > 0) 
				? 3 : (a > 0 && b > 0) ? 2 : (a > 0 && c > 0) ? 2
				: (a > 0 && d > 0) ? 2 : (b > 0 && c > 0) ? 2 
				: (b > 0 && d > 0) ? 2 : (c > 0 && d > 0) ? 2 
				: !(a > 0 && b > 0 && c > 0 && d > 0) ? 1 : 0;
		
		System.out.printf("양수 : %d개\n", result);
		
		return result;
		
		
	}
	
	public static int positive(int a, int b, int c, int d, int e) {
		
		int result = (a > 0 && b > 0 && c > 0 && d > 0 && e > 0) ? 5 
				: (a > 0 && b > 0 && c > 0 && d > 0) ? 4 : (a > 0 && b > 0 && c > 0 && e > 0) ? 4
				: (a > 0 && b > 0 && d > 0 && e > 0) ? 4 : (a > 0 && c > 0 && d > 0 && e > 0) ? 4
				: (b > 0 && c > 0 && d > 0 && e > 0) ? 4 : (a > 0 && b > 0 && c > 0) ? 3
				: (a > 0 && b > 0 && d > 0) ? 3 : (a > 0 && b > 0 && e > 0) ? 3
				: (a > 0 && c > 0 && d > 0) ? 3 : (a > 0 && c > 0 && e > 0) ? 3
				: (a > 0 && d > 0 && e > 0) ? 3 : (b > 0 && c > 0 && d > 0) ? 3
				: (b > 0 && c > 0 && e > 0) ? 3 : (c > 0 && d > 0 && e > 0) ? 3
				: (a > 0 && b > 0) ? 2 : (a > 0 && c > 0) ? 2 : (a > 0 && d > 0) ? 2
				: (a > 0 && e > 0) ? 2 : (b > 0 && c > 0) ? 2 : (b > 0 && d > 0) ? 2
				: (b > 0 && e > 0) ? 2 : (c > 0 && d > 0) ? 2 : (c > 0 && e > 0) ? 2
				: (d > 0 && e > 0) ? 2 : !(a > 0 && b > 0 && c > 0 && d > 0 && e > 0) ? 1 : 0;
		
		System.out.printf("양수 : %d개\n", result);
		
		return result;
		
		
	}
}
