package com.test.error;

public class Ex02_Variable_use_02 {

	public static void main(String[] args) {
		
		byte b1;
		b1 = 10;	//b1의 값이 1byte를 초과함
		System.out.println(b1);
		
		short s1;
		s1 = 10;
		System.out.println(s1);
		
		int n1;
		n1 = 10;
		System.out.println(n1);
		
		long l1;
		l1 = 10000000000L; // 기본적으로 int 이기 때문에 뒤에 L을 붙여줘야함 
		System.out.println(l1);
		
		
		
		float f1;
		f1 = 3.14F; // 기본적으로 double 이기 때문에 뒤에 F를 붙여줘야함
		System.out.println(f1);
		
		double d1;
		d1 = 6.28;
		System.out.println(d1);
		
		
		
		char c1;
		c1 = 'A'; //"" 이 아니라 '' 이어야함
		System.out.println(c1);
		
		c1 = '홍'; // char는 문자 하나만 인식함
		System.out.println(c1);
		
		
		String name;
		name = "홍길동"; //''이 아니라 ""이어야함
		System.out.println(name);
				
		
	}
	
}




















