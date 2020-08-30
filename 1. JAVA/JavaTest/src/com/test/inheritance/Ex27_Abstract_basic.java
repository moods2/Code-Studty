package com.test.inheritance;

public class Ex27_Abstract_basic {
	
	public static void main(String[] args) {
		
		//Ex27_Abstract_basic.java
		
		//abstract
		
		//추상 클래스, Abstract Class
		//추상 메소드, Abstract Method
		
		//추상 클래스, Abstract Class
		// - 클래스
		// - 상속 관계의 구성원이 된다. > 상속 관계없이 독립적으로 사용 안함.
		// - 객체의 원형(베이스)을 만드는 역할
		// - 파생된 객체들의 행동(사용법)을 표준화하는 역할
		
		
		SM101 m1 = new SM101();
		//m1.click();
		//m1.click(); //행동 + 사용법
		m1.push();
		
		M705 m2 = new M705();
		//m2.click(); //사용법 안변했음..
		//m2.down();
		m2.push();
		
		
	}//main

}//Ex27


//추상 클래스: 추상 메소드를 소유할 자격이 있음.
abstract class AbstractParent {
	
	//추상 메소드: 구현부를 가질 수 없다.
	public abstract void test();
	
	//추상 클래스: 구현된 멤버를 가질 수 있다.
	private int a = 10;
	private int b = 20;
	
	public void aaa() {
		
	}
}

//The type AbstractChild must implement the inherited abstract method AbstractParent.test()
class AbstractChild extends AbstractParent {

	//부모가 물려준 추상메소드를 구현부를 구현해서 일반 메소드로 생성 > 오버라이드 + 구현
	@Override
	public void test() {
		
	}
	
	
}



//마우스, M705
//사람, 홍길동
//시추, 뭉치

//마우스 추상 클래스
abstract class Mouse2 {
	
	public String model;
	public int price;
	public int button;	
	
	public abstract void push();
	
}

//마우스 일반 클래스
class M705 extends Mouse2 {
		
//	public void down() {
//		System.out.println("로지텍 기술 + 저소음 클릭");
//	}

	@Override
	public void push() {
		System.out.println("로지텍 기술 + 저소음 클릭");
	}
}

class SM101 extends Mouse2 {
	
//	public void click() {
//		System.out.println("소리나는 클릭");
//	}

	@Override
	public void push() {
		System.out.println("소리나는 클릭");
	}
}

