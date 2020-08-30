package com.test.two;

import com.test.one.Student;

public class Item {
	
	public void test() {
		
		Student s1 = new Student();
		
		//패키지가 바뀌면 public 빼고 접근불가
		System.out.println("다른 패키지내의 다른 클래스내에서 접근");
//		System.out.println("private a : " + s1.a);
		System.out.println("public b : " + s1.b);
//		System.out.println("protected c : " + s1.c);
//		System.out.println("default d : " + s1.d);
		System.out.println();
		
	}

}
