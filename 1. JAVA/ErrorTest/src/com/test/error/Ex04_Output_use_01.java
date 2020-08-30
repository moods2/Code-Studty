package com.test.error;

public class Ex04_Output_use_01 {
	
	public static void main(String[] args) {
		
		String name = "홍길동";
		int age = 20;
		double pi = 3.14;
		char c = 'A';
		
		System.out.printf("제 이름은 %s입니다.\n", name); // %c는 문자 하나만 출력하기때문에 name을 출력하려면 %s를 써야하고 %와 s 사이에 소수점표현인.과 -1이 들어가있음
		System.out.printf("나이는 %d살입니다.\n", age); // 형식문자는 하나인데 값이 두개 들어가있음
		System.out.printf("소문자 '%c'의 대문자는 'C'입니다.\n", c); // c가 아니라 %c가 들어가야함
		System.out.printf("원주율은 %,f입니다.\n", pi); // ,는 %와 d 사이에 들어가야하고 pi는 double형이기 때문에 %d가 아니라 %f를 써야함
		System.out.printf("제가 제일 좋아하는 문자는 %c입니다.\n", c); // 문자는 %s가 아니라 %c임
		System.out.printf("오늘 3개의 에러를 발견하고 수정했습니다.\n");
		
		
	}

}











