package com.test.one;

import com.test.util.MyUtil;

//다른 패키지 표현을 생략하기 위한 도구
//import com.test.two.Item;

public class Ex46_Package_basic {
	
	public static void main(String[] args) {
		
		//패키지, Package
		// - 클래스를 분류하고 관리하는 단위(폴더같은 개념)
		// - 자바 클래스의 배포 단위
		
		//패키지 명명법
		// a. 영문자로만 작성(소문자)
		// b. com.test.object
		//	- . : level
		//	- 3단계 패키지(com > test > object)
		//	- 되도록 3단계 이상 권장
		//		1. 패키지명 > 주로 도메인을 붙이기 때문에
		//		2. 중복 방지
		
		//패키지 언제?
		// - 다량 코드 작성
		//	1. 메소드 추출?(반복 or 의미)
		//	2. 클래스 추출?
		//	3. 패키지 추출?
		
		
		//같은 패키지내의 Item
//		Item item = new Item();
		
		//다른 패키지내의 Item
		//	- 어느 패키지의 클래스인지 명시해야 사용할 수 있다.
//		com.test.two.Item item = new com.test.two.Item();
		//Item item = new Item();
		
//		Item items = new Item();
		
		
		Student s1 = new Student();
		s1.test();
		
		System.out.println("같은 패키지내의 다른 클래스내에서 접근");
//		System.out.println("private a : " + s1.a);
		System.out.println("public b : " + s1.b);
		System.out.println("protected c : " + s1.c);
		System.out.println("default d : " + s1.d);
		System.out.println();
		
		
		MyUtil util = new MyUtil();
		
		System.out.println(util.nextColor());
		
	}

}


class Item {
	
		
}

