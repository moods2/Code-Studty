package com.test.error;

public class Ex06_Casting_use {
	
	public static void main(String[] args) {
		
		byte a = 10;
		byte b = 20;
		int c = 0;
		
		c = a + b; // 연산 시 int로 인식하기 때문에 byte c를 int형으로 바꾸거나 a+b를 char로 형변환해야함
		
		System.out.printf("%d + %d = %d\n", a, b, c);
		
		
		int n1 = 1234567;
		int n2 = 654321;
		
		System.out.printf("%,d * %,d = %,d\n", n1, n2, n1 * n2);
		
		
	}

}












