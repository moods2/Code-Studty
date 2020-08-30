package com.test.inheritance;

public class Ex29_Interface_use_02 {
	
	public static void main(String[] args) {
		
		//1. 추상메소드 -> 추상클래스 vs 인터페이스
		//2. 추상클래스(인터페이스) 반드시 사용?
		
		//폐기
//		M706 m1 = new M706();
//		
//		m1.click();
//		m1.drag();
		
//		//구입
//		S300 m2 = new S300();
//		
//		m2.click();
//		m2.drag();
//		m2.wheel();
		
		
		//참조 변수
//		M706 m1 = new M706();
//		m1.click();		//마우스 공통기능
//		m1.drag();		//로지텍 특화기능
//		m1.wheel();		//마우스 공통기능
		
//		S300 m2 = new S300();
//		m2.click();
//		m2.drag();
//		m2.wheel();
		
		//인터페이스 변수
//		M706 m1 = new M706();
		IMouse m1 = new M706();
		m1.click();
		m1.wheel();
		
		M706 temp = (M706)m1;
		temp.drag();
		
//		S300 m2 = new S300();
		IMouse m2 = new S300();
		m2.click();
		m2.wheel();
		

		
	}//main

}//Ex29

//공통 기능 : click(), wheel()
//부모 역할 : 인터페이스(부담 적음)
interface IMouse {
	
	void click();
	void wheel();
	
}


abstract class AMouse {
	
	//구현 멤버 -> 모든 마우스가 가져야 할 멤버
	public String model;
	public String color;
	public int button;
	public int weight;
	public int size;
	public int level;
	
	public abstract void click();
	public abstract void wheel();
	
}

//일반 마우스
class M706 implements IMouse{
	
	//멤버 변수
	
	//멤버 메소드
	public void click() {
		System.out.println("로지텍 기술 + 클릭!!");
	}
	
	//? 그대로 vs 버려
	public void drag() {
		System.out.println("로지텍 기술 + 드래그~");
	}

	@Override
	public void wheel() {
		System.out.println("로지텍 기술 + 휠!!");		
	}
	
}


class S300 implements IMouse {
	
	//멤버 변수
	
	//멤버 메소드
	public void click() {
		System.out.println("삼성 기술 + 클릭!!");		
	}
	public void wheel() {
		System.out.println("삼성 기술 + 스크롤~~");
	}
	
}


//새로운 마우스 설계 > 독자 vs 규격 > 규격
class N500 implements IMouse {
	
	//6개 구현 멤버 변수(x)
	//2개 추상 메소드
	public void click() {
		
	}
	public void wheel() {
		
	}
	
}

