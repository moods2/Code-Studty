package com.test.datatype;

public class Ex02_Variable_use_03 {

	public static void main(String[] args) {
		
		// '+' 연산자
		// - 숫자 + 숫자 = 산술 연산
		// - 문자열 + 문자열 = Concat(붙이기)
		// - 숫자 + 문자열 = Concat
		// - 문자열 + 숫자 = Concat
		
		//요구사항] 10, 20 -> '10 + 20 = 30' -> 출력
		int a = 10;
		int b = 20;
		
		
		//연산자 우선순위
		System.out.println(a + " + " + b + " = " + (a + b));
		System.out.println("10 + " + b + " = " + a + b);
		System.out.println("10 + 20" + " = " + a + b);
		System.out.println("10 + 20 = " + a + b);
		System.out.println("10 + 20 = 10" + b);
		System.out.println("10 + 20 = 1020");
		
		
		//숫자 저장? -> 자료형?
		//1. 나이? -> byte
		//2. 몸무게? -> short
		//3. 주민등록번호앞자리 -> int
		
		int jumin;
		jumin = 950823; //유효숫자 6자리
		System.out.println(jumin);
		
		jumin = 051003; //유효숫자 5자리
		System.out.println(jumin);
		
		//*** 숫자 데이터 -> 성격이 숫자가 아닌 것들..
		// -> 더하기, 빼기, 곱하기, 나누기 하지 않을 숫자는 -> 전부 문자열 취급
		// ex) 전화번호, 상품번호 등등.. 
		
		
		String jumin2 = "950823";
		System.out.println(jumin2);
		
		jumin2 = "051003";
		System.out.println(jumin2);
				
		
		//자바에서의 기수법 표현 방식
		// - 잘 사용 안함
		//1. 10진수 표현
		//2. 8진수 표현
		//3. 16진수 표현
		//4. 2진수 표현(X)
		
		int num = 10; //숫자 상수 -> 10진수
		System.out.println(num);
		
		num = 010; //8진수(0~7)
		System.out.println(num);
		
		num = 0x10; //16진수(0~F)
		System.out.println(num);
		
				
		
		
	}
	
}
