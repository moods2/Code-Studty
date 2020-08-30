package com.test.object;

public class Ex34_Generic_basic {
	
	public static void main(String[] args) {
		
		Monitor<Integer> n1 = new Monitor<Integer>();
		n1.a = 10;
		n1.b = 10;
		n1.c = 30;
//		n1.c = "test";
		
		Monitor<String> n2 = new Monitor<String>();
		n2.a = 10;
		n2.b = 20;
		n2.c = "문자열";
		
		Monitor<Boolean> n3 = new Monitor<Boolean>();
		n3.a = 10;
		n3.b = 20;
		n3.c = true;
		
		Desk<Double> n4 = new Desk<Double>();
		n4.a = 10;
		n4.b = 3.1;
		n4.c = 5.2;
		n4.d = 4.7;
		
		Pad<String,Integer> n5 = new Pad<String,Integer>();
//		Pad<String,Integer> n5 = new Pad();
		
		n5.a = "문자열";
		n5.b = 100;
		
		Room<String> n6 = new Room<String>();
		
		n6.a = "문자열";
		n6.test("하하하");
		System.out.println(n6.get());
		
		
		
		
	}//main

}//Ex34

//제네릭 클래스 선언하기
// - T : 타입 변수(자료형 자체를 저장하는 변수)
// 컴파일 시 자료형을 확정
class Monitor<T> { //public void test(int t)
	
	//멤버 구현
	public int a;
	public int b;
	
	public T c;
		
}

class Desk<T> {
	
	public int a;
	public T b;
	public T c;
	public T d;
	
}

class Pad<T,U> {
	
	public T a;
	public U b;
	
	
}

class Room<T> {
	
	public T a;
	
	public void test(T a) {
		
		//업무 진행
		// -> 하나의 자료형 타겟으로 하는 업무를 진행하면 안된다.
		// -> 모든 자료형들이 다 할 수 있는 업무를 진행해야 한다.
//		System.out.println(a + 10);
		
	}
	
	public T get() {
		return a;
	}
	
}













