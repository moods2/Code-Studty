package com.test.two;

import com.test.one.Student;

public class Student2 extends Student{
	
	public void test() {
		
		System.out.println("다른 패키지내의 자식 클래스에서 접근");
//		System.out.println(this.a);
		System.out.println(this.b);
		System.out.println(this.c); //다른 패키지라도 자식 클래스는 접근가능(protected)
//		System.out.println(this.d);
		
	}

}
