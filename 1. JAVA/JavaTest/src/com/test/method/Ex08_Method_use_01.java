package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_use_01 {
	
	public static void main(String[] args) throws Exception {
		
		//메소드
		// - 코드의 집합
		// - 자주 사용하는 반복적인 코드를 단위(모듈, 메소드)로 묶어 놓고 재사용할 수 있는 요소
		
		//메소드 선언하기(x1) > 호출하기(xN + 재사용 효과)
		
		//메소드 특징
		//1. 코드 재사용 x 반복적인 행동
		//2. 재사용과 무관하게 독립적인 행동(모듈) > 가독성 향상
		
		//메소드 선언 + 유형
				// - 매개변수(인자, Parameter, Argument) 유무
				// - 반환값(Return Value) 유무
				//1. 매개변수 X, 반환값 X
				//2. 매개변수 O, 반환값 X
				//3. 매개변수 X, 반환값 O
				//4. 매개변수 O, 반환값 O
		
		//호출하기
		m1();
		m1();
		m1();
		
		m2();
		
		m3(10); //실인자
		//The method m3(int) in the type Ex08_Method_use_01 is not applicable for the arguments ()
		//m3();
		//m3(10, 20);
		//m3("홍길동");
		
		m4(10, 20);
		m4(5, 11);
		m4(534, 22);
		
		m5("홍길동", 1);
		m5("호호호", 2);
		//m5(2, "하하하");
	
		//int num = m8();
		
		
	}//main

	
//	public static int m8() { //값이 틀려도 에러
//		
//		return true;
//		
//	}
	
	
//	public static int m7() { //값이 없어도 에러
//		
//				
//	}
	
	
	public static void m6() { //몸통보다 머리가 우선
		
		//return 10; 
		
	}
	
	
	public static void m5(String name, int jumin) {
		
		String gender = jumin ==1 ? "남자" : "여자";
		
		System.out.printf("안녕하세요. %s님. 당신은 %s입니다.\n", name, gender);
		
		
	}
	
	
	public static void m4(int a, int b) {

		System.out.printf("%d + %d = %d\n", a, b, a + b);

	
	}
	
	
	public static void m3(int a) { //가인자
		
		System.out.println(a + a);
		
		
	}
	
	
	public static void m2() throws Exception {
		
		//사용자 이름 입력 > 인사하는 코드
		//Ctrl + Shift + O : 해당 페이지의 모든 import 자동 완성
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("이름 : ");
		
		//1. reader.read();
		// - 한문자 입력
		// - 문자코드 반환
		// - \r\n 포함
		//2. reader.readLine();
		// - 라인 입력
		// - 문자열 반환
		// - \r\n 제거
		
		String name = reader.readLine();
		
		System.out.printf("안녕 ~ %s\n", name);
		
				
	}
	
	
	//메소드 헤더 == 메소드 서명(Signature)
	public static void m1() {
		
		System.out.println("메소드 m1을 호출했습니다.");
		
		
	}
	
}//Ex08
