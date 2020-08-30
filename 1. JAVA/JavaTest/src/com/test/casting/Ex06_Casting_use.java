package com.test.casting;

public class Ex06_Casting_use {
	
	public static void main(String[] args) {
		
		
		//명시적 형변환
		byte b1 = (byte)10;		//byte(1) = int(4)
		
		short s1 = (short)10;	//short(2) = int(4)
		
		int n1 = 10;			//int(4) = int(4)
		
		long l1 = (long)10;		//long(8) = int(4)
				
		
		//정수 -> 정수
		//실수 -> 실수
		//정수 -> 실수
		//실수 -> 정수
		
		int m1;
		double d1;
		
		m1 = 100;
		
		//큰형 = 작은형
		//double = int
		d1 = (double)m1;
		System.out.println(d1);
		
		
		int m2;
		double d2;
		
		d2 = 3.74;
		
		//작은형 = 큰형
		//int = double
		m2 = (int)d2;
		System.out.println(m2);
		
		
		float f1;
		int m3;
		
		f1 = 31.4F;
		
		//int : -21억 ~ 21억
		//float : -10^30 ~ 10^30
		//작은형 = 큰형
		//int(4) = float(4)
		m3 = (int)f1;
		System.out.println(m3);
		
		long l2;
		
		//작은형 = 큰형
		//long(8) = float(4)
		l2 = (long)f1;
		System.out.println(l2);
		
		//byte(1) < short(2) < int(4) < long(8) < float(4) < double(8)
		//실수와 정수끼리 비교할 때 바이트수만 가지고 비교 X
		
		
		//boolean
		// - 형변환이 불가능
		
		
		//char
		// - 형변환이 가능
		
		int m5;
		char c1;
		
		m5 = 44032; //원본
		
		//복사
		//char(2) = int(4)
		c1 = (char)m5;
		
		System.out.println(c1);
		
		System.out.println((char)65);
		System.out.println((int)'A');
		
		
		//문자 코드
		System.out.println((int)'A');
		System.out.println((int)'Z');
		System.out.println((int)'a');
		System.out.println((int)'z');
		System.out.println((int)'0');
		System.out.println((int)'9');
		System.out.println((int)'가');
		System.out.println((int)'힣');

		System.out.println((int)'\r');
		System.out.println((int)'\n');
		System.out.println((int)'\t');
		System.out.println((int)'\b');
		System.out.println((int)' ');
		
		
//		int를 double로 형변환 가능합니까? 이유는 뭡니까
//		? long을 short로 형변환 가능합니까? 이유는 뭡니까
		
//		? char를 int로 형변환 가능합니까? 이유는 뭡니까
//		? short를 char로 형변환 가능합니까? 이유는 뭡니까 (******)
		
		//short(2byte) == char(2byte)
		//short : -32768 ~ 32767 : signed type
		//char : 0 ~ 65534 : unsigned type

		//char(2byte) == int(4byte)
		//char : 0 ~ 65534 : unsigned type
		//int : -21억 ~ 21억


		
		
	}

}
