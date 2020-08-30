package com.test.error;


public class Ex02_Variable_use_01 {

	public static void main(String[] args) {
		
		int a;		
		a = 10;
		//문장종결자 생략
		System.out.println(a);
		
		int b = 20;
		System.out.println(b);
		
		int c, d, e;
		//문장종결자가 중간에들어감
		
		c = 30;
		d = 40;
		e = 50;
		//변수 e가 선언 되어있지 않음
		
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		
		int f = 60, g = 70, h = 80;
		int i = 90, j = 75;
		long k, l = 100;
		//변수 j가 선언 되어있지 않음
		
		a = 100;
		//변수 a가 중복선언되어있음
		System.out.println(a);
		
		int m;
		m = 100;
		
		System.out.println(m);
		//변수 m의 값이 없음
		int total;
		total = 200;
		System.out.println(total);
		//변수 total이 선언 되어있지 않음
	
		
	}
	
}










