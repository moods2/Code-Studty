package com.test.object;

public class Ex20_Class_basic {
	
	public static void main(String[] args) {
		
		
		Person p1 = new Person();
		p1.setName("홍길동");
		
		Person p2 = new Person();
		p2.setName("아무개");
		
		Person p3 = new Person();
		p3.setName("하하하");
		
		
		//참조형 배열 (String)
		Person[] list = new Person[3]; //Person 객체가 몇개 생성되었습니까? 3개(X) 0개(O)
										//참조변수 3개를 만드는것
		
		list[0] = new Person(); // 객체 생성
		list[1] = new Person();
		list[2] = new Person();
		
		
		//java.lang.NullPointerException : 아무것도 없는데 쓰려고하면 나는 에러
		list[0].setName("홍길동");
		
		
		
	}

}

class Person {
	
	private String name;

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}