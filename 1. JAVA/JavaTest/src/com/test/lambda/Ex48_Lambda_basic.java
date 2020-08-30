package com.test.lambda;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

public class Ex48_Lambda_basic {
	
	public static void main(String[] args) {
		
		//Lambda Expression, 람다식
		// - 함수형 프로그래밍 스타일을 지원하는 기술
		// - 절차 지향 프로그래밍 + 객체 지향 프로그래밍 : 현재 스타일
		// - 컬렉션을 사용하는 기능에 많이 지원하고 있음
		
		//람다식 기본 표현(문법)
		// - (자료형 매개변수) -> { 실행코드 };
		//	a. (매개변수) : 메소드의 매개변수와 동일한 역할
		//	b. -> : 화살표(Arrow), 코드블럭 호출하는 역할
		//	c. { 실행코드 } : 메소드의 구현부와 동일한 역할
		
		//람다식에서 사용할 인터페이스
		// 1. 반드시 추상 메소드 1개만 가져야 한다.(************)
		// 2. 람다식을 저장하는 인터페이스를 '람다식의 타겟타입(Target Type)'이라고 한다.
		// 3. 람다식을 저장하는 인터페이스를 '함수형 인터페이스'(Functional Interface)'이라고 한다.
		
		
		//실명 객체(MyClass -> 객체)
		MyClass m1 = new MyClass();
		m1.test();
		
		MyInterface m2 = new MyClass();
		m2.test();
		
		//익명 객체
		MyInterface m3 = new MyInterface() {
			
			@Override
			public void test() {
				System.out.println("MyInterface를 구현한 익명 객체 메소드 호출");				
			}

//			@Override
			public void call() {
								
			}
			
		};
		m3.test();
		
		//람다식
		//m3 -> m4
		// : 누가 구현하던지 동일하게 반복되는 코드를 생략
		MyInterface m4 = () -> {
			System.out.println("람다식으로 구현한 익명 객체 메소드 호출");
		};
		m4.test();
		
		MyInterface m5 = () -> { System.out.println("추가 구현"); };
		m5.test(); //람다식으로 구현 메소드 호출
		
		
		//람다식 사용 -> 메소드 구현 -> 매개변수X, 반환값X
		NoParameterNoReturn pr1 = new NoParameterNoReturn() {
			@Override
			public void call() {
				System.out.println("pr1");				
			}
		};
		
		NoParameterNoReturn pr2 = () -> {
			System.out.println("pr2");
		};
		
		//구현부의 문장이 1개일 때 {}을 생략할 수 있다.
		NoParameterNoReturn pr3 = () -> System.out.println("pr3");; 
		
		pr1.call();
		pr2.call();
		pr3.call();
		
		
		//매개변수O, 반환값X
		ParameterNoReturn pr4 = (int num) -> {
			System.out.println(num * 2);
		};
		
		pr4.call(10);
		pr4.call(20);
		
		ParameterNoReturn pr5 = num -> System.out.println(num * num);;
		
		pr5.call(10);
		pr5.call(20);
		
		MultiParameterNoReturn pr6 = new MultiParameterNoReturn() {
			@Override
			public void call(int a, int b) {
				System.out.println(a + b);				
			}
		};
		
		MultiParameterNoReturn pr7 = (a, b) -> System.out.println(a + b);
		
		pr6.call(10, 20);
		pr7.call(100, 200);
		
		NoParameterReturn pr8 = () -> {
			return 10;
		};
		System.out.println(pr8.call());
		
		NoParameterReturn pr9 = () -> {
			Random rnd = new Random();
			return rnd.nextInt(100) + 1;
		};
		System.out.println(pr9.call());
		
		NoParameterReturn pr10 = () -> 10;
		System.out.println(pr10.call());
				
		ParameterReturn pr11 = new ParameterReturn() {
			@Override
			public int call(int a, int b) {
				return a * b;
			}
		};
		
		ParameterReturn pr12 = (a, b) -> a * b;
		System.out.println(pr12.call(10, 5));
		
		
		
		//람다식 사용 예
		// -> 익명 객체를 사요아는 곳에서 람다식을 사용할 수 있다.
		// ex) 컬렉션.sort(익명객체)
		
		List<String> names = new ArrayList<String>();
		
		names.add("사과");
		names.add("귤");
		names.add("바나나");
		names.add("포도");
		names.add("파인애플");
		
		//정렬 -> 글자수 정렬
		names.sort(new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				
				return o1.length() - o2.length();
			}
		});
		
		//람다식 사용
		names.sort((o1, o2) -> o1.length() - o2.length());		
		
		System.out.println(names);
		
		
			
	}//main

}

interface MyInterface {
	
	void test();
//	void call();
	
}

class MyClass implements MyInterface {
	
	@Override
	public void test() {
		System.out.println("MyInterface 구현한 MyClass 메소드 호출");
	}

//	@Override
	public void call() {
			
	}
	
}


//람다식을 저장할 함수형 인터페이스 선언하기
// - 추상 메소드 1개짜리 인터페이스
@FunctionalInterface
interface NoParameterNoReturn {
	void call();
}

@FunctionalInterface
interface ParameterNoReturn {
	void call(int num);
}

@FunctionalInterface
interface MultiParameterNoReturn {
	void call(int a, int b);
}

@FunctionalInterface
interface NoParameterReturn {
	int call();
}

@FunctionalInterface
interface ParameterReturn {
	int call(int a, int b);
}


