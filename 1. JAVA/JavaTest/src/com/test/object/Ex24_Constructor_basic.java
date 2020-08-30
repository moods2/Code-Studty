package com.test.object;

public class Ex24_Constructor_basic {
	
	public static void main(String[] args) {
		
		//생성자, Constructor
		// - 특수한 목적을 가지는 메소드
		// - 객체(멤버 변수)를 초기화하는 역할(***)
		// - 메소드명이 클래스명과 동일하다.
		// - 반환타입을 명시하지 않는다.
		
		//자료형 변수명 = 객체생성연산자 생성자;		
		Cup c1 = new Cup();
		
		//1. 초기값 : 생성자
		//2. 객체 생성 후 나중에 값을 변경할 때 사용. 수정 : setter
		c1.setName("종이컵");
		c1.setSize(150);
		
		System.out.println(c1.getName());
		System.out.println(c1.getSize());
		
		Cup c2 = new Cup("스테인레스 컵", 850);
		
		System.out.println(c2.getName());
		System.out.println(c2.getSize());
		
		Cup c3 = new Cup("나무컵");		
		Cup c4 = new Cup(1000);
		
		
		
	}//main

}//Ex24


class Cup {
	
	//멤버 변수
	private String name;
	private int size;
	private static int count;
	
	//객체 변수 -> 객체 생성자
	//정적 변수 -> 정적 생성자
	
	//정적 생성자
	static {
		Cup.count = 0;
		
	}
	
	//기본 생성자
	public Cup() { //컴파일 할 때 자동 생성
//		this.setName("종이컵");
//		this.setSize(150);
		this("종이컵", 150);
		
	}
	
	public Cup(String name) {
//		this.name = name;
//		this.size = 0;
		this(name, 0);
		
	}
	
	public Cup(int size) {
//		this.size = size;
//		this.name = "이름없음";
		this("이름없음", size);
		
	}
	
	//생성자 오버로딩(메소드 오버로딩)
	public Cup(String name, int size) {
		
		this.name = name;
		this.size = size;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
}