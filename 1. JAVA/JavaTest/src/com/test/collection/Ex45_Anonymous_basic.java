package com.test.collection;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Ex45_Anonymous_basic {
	
	public static void main(String[] args) {
		
		//익명 객체, Anonymous Object
		// - 익명 클래스, Anonymous Class
		// - 이름이 없는 클래스(객체)
		// - 코드 절감 X
		// - 가독성때문에 사용하는 기술
		
		BBB b1 = new BBB();
		b1.test();
		b1.run();
		
		AAA b2 = new BBB(); //업캐스팅
		b2.test();
//		b2.run();
		((BBB)b2).run();
		
		//익명 클래스(=익명 객체)
		// - 클래스 선언과정 없이 즉석해서 객체를 선언 + 생성하는 기술
		AAA b3 = new AAA() {
			
			@Override
			public void test() {
				System.out.println("AAA.test() 구현");
			}
			
		};
		
		b3.test();
		System.out.println();
		
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		list.add(10);
		list.add(50);
		list.add(30);
		list.add(20);
		list.add(40);
		
		//정렬!!
		//list.sort();
		Collections.sort(list); //List<T> <- ArrayList<T>
		
		Collections.reverse(list);
		
		System.out.println(list);		
		
		
		ArrayList<User> ulist = new ArrayList<User>();
		
		User u1 = new User(); u1.name = "홍길동"; u1.age = 20; u1.gender = 1;
		User u2 = new User(); u2.name = "아무개"; u2.age = 22; u2.gender = 1;
		User u3 = new User(); u3.name = "하하하"; u3.age = 27; u3.gender = 2;
		User u4 = new User(); u4.name = "호호호"; u4.age = 23; u4.gender = 2;
		User u5 = new User(); u5.name = "후후후"; u5.age = 24; u5.gender = 1;
		
		ulist.add(u1);
		ulist.add(u2);
		ulist.add(u3);
		ulist.add(u4);
		ulist.add(u5);
		
		//ulist.sort(c);
		//Collections.sort(ulist, c);
		
		//Comparator 인터페이스를 구현한 객체를 매개변수로 달라고..
		ulist.sort(new Comparator<User>() {

			@Override
			public int compare(User o1, User o2) {
				
//				return o2.age - o1.age;
//				return o1.gender - o2.gender;
				
				//홍길동 > 홍무개
				// - 문자열의 우위 비교(문자코드값)
				return o1.name.compareTo(o2.name);
			}
		});
		
		System.out.println(ulist);
		
		
		
	}//main

}

//class Test implements Comparator<Test> {
//
//	@Override
//	public int compare(Test o1, Test o2) {
//		
//		return 0;
//	}
//	
//}

interface AAA {
	
	void test();
	
}

class BBB implements AAA {
	
	@Override
	public void test() {
		System.out.println("인터페이스 AAA의 test() 메소드를 구현했습니다.");
	}
	
	public void run() {
		System.out.println("추가로 구현된 BBB만의 메소드입니다.");
	}
	
}

class User implements Comparator<User> {
	
	public String name;
	public int age;
	public int gender;
	
	@Override
	public String toString() {
		return String.format("%s(%d,%s)"
							, this.name
							, this.age
							, this.gender == 1 ? "남자" : "여자");
	}

	@Override
	public int compare(User o1, User o2) {
		
		return o1.age - o2.age;
	}
	
}

