package com.test.datatype;

public class Ex02_Variable_use_02 {

	public static void main(String[] args) {
		
		//자바 자료형 8개 + 변수 만들기
		
		//1. byte : -128 ~ 127
		byte b1;
		b1 = 10; //Type mismatch: cannot convert from int to byte
		System.out.println(b1);
		
		
		//2. short : -32768 ~ 32767
		short s1;
		s1 = 10;
		System.out.println(s1);

		
		//3. int : -21억 ~ 21억
		int n1;
		n1 = 10;
		System.out.println(n1);
		
		
		//4. long : -922경 ~ 922경
		long l1;
		l1 = 10000000000L; //The literal 10000000000 of type int is out of range\
						   //평소에는 int형이 기본이기 때문에 숫자 끝에 'L' 기입 -> 8바이트로 변환(long)
		System.out.println(l1);
		
		
		//데이터 -> 상수, 리터럴(Literal)
		System.out.println(10);
		System.out.println(10);
		System.out.println(10);
		System.out.println(10);
		System.out.println(10);
				
		
		
		//실수
		//1. float
		float f1;
		f1 = 3.14F; //Type mismatch: cannot convert from double to float
					//실수형 변수는 double형이 기본
		f1 = 1.2345678901234567890123456789F;
		System.out.println(f1);
		
		
		//2. double : 정밀도 높음
		double d1;
		d1 = 6.28;
		d1 = 1.2345678901234567890123456789;
		System.out.println(d1);
		
		
		
		//문자형
		//1. char
		char c1;
		c1 = 'A'; //문자 리터럴
		System.out.println(c1);
		
		c1 = '가';
		System.out.println(c1);
		
		c1 = '*';
		System.out.println(c1);
		
		c1 = '1';
		System.out.println(c1);
		
		
		
		//논리형
		//1. boolean
		boolean flag;
		flag = true; //true, false : 논리 상수, boolean literal
		flag = false;
		
		System.out.println(flag);		
		
		
		
		//자바 자료형
		//1. 기본형 : byte, short, int, long, float, double, boolean, char
		//2. 참조형
		
		//문자열, String
		// - 참조형
		
		//문자, char
		
		//'홍길동' -> 변수 저장
		char name1 = '홍';
		char name2 = '길';
		char name3 = '동';
		
		//문자들의 열을 저장하는 자료형 -> 문자열(String)
		String name;
		name = "홍길동"; //문자열 상수, String Literal
		
		System.out.println(name);
		
		name = "홍";
		
		
		
		/*
		
		영문식 표현
		~ (tild), !, @, #, $, %, ^ (carrot, xor), &, * (all(wildcard), asterisk)
		, - (minus, dash, hyphen, horizontal-bar), :, ;, | (pipe, vertical-bar), /, \, ', ", `, , .
		
		괄호
		() 소괄호
		[] 대괄호
		{} 중괄호
		<> 화살표괄호
		
		
		A > B
		A >= B
		A < B
		A <= B
		
		
				
		
		*/
		
		
		
		
		
		
		
	}
		
}
