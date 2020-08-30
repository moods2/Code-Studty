package com.test.method;

public class Ex08_Method_question_11 {
	
	public static void main(String[] args) {
		
		position("홍길동");
		System.out.println();
		position("홍길동", "유재석");
		System.out.println();
		position("홍길동", "유재석", "박명수");
		System.out.println();
		position("홍길동", "유재석", "박명수", "정형돈");
		System.out.println();
		
	}
	
	public static void position(String a) {
		
		System.out.printf("사원 : %s\n", a);
		
	}
	
	public static void position(String a, String b) {
		
		System.out.printf("사원 : %s\n", a);
		System.out.printf("대리 : %s\n", b);
		
	}

	public static void position(String a, String b, String c) {
	
		System.out.printf("사원 : %s\n", a);
		System.out.printf("대리 : %s\n", b);
		System.out.printf("과장 : %s\n", c);
	
	}

	public static void position(String a, String b, String c, String d) {
	
		System.out.printf("사원 : %s\n", a);
		System.out.printf("대리 : %s\n", b);
		System.out.printf("과장 : %s\n", c);
		System.out.printf("부장 : %s\n", d);
	
	}

}
