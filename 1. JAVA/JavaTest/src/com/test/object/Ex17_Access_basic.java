package com.test.object;

public class Ex17_Access_basic {
	
	public static void main(String[] args) {
		
		//접근 지정자(제어자), Access Modifier
		// - 클래스의 멤버에게 적용한다.(멤버 변수, 멤버 메소드)
		// - public, private / protected, default
		// - 영역을 기준으로 멤버를 외부에 공개할 지 말지를 제어하는 역할
		// - 외부에서 멤버를 접근하기 위한 권한 제어하는 역할
		
		//1. public
		// - 외부에 멤버를 100% 공개
		
		//2. private
		// - 외부에 멤버를 100% 비공개
		
		Item1 item = new Item1();
		
		System.out.println(item.a);
		//System.out.println(item.b); //The field Item.b is not visible
		
		
		Member hong = new Member();
		
//		hong.name = "홍길동";
//		hong.id = "hong";
//		hong.age = 20;
//		
//		System.out.println(hong.name);
//		System.out.println(hong.id);
//		System.out.println(hong.age);
		
		
//		hong.aaa("홍길동");
//		
//		System.out.println(hong.bbb());
//		
		
		
		
		
		
	}//main

}

class Item1 {
	
	public int a = 10;
	private int b = 20;	
	
	//접근 지정자는 같은 클래스내에서 동작을 안한다.
	public void test() {
		System.out.println(a);
		System.out.println(b);
	}
	
}


class Member {
	
	//멤버 변수에게 어떤 접근 지정자를 붙여야 하는가? public or private
	// - 멤버 변수는 무조건 private을 사용한다.(*****)
	// - 외부에 공개를 해야하는 경우엔 public 메소드를 만든다.
//	public String name;
//	public String id;
//	public int age;
	
	private String name; //멤버변수
	private String id;
	private int age;
	
	//setter
	public void setName(String name) { //지역변수
		//멤버 변수와 지역 변수가 충돌 발생
		// ***** 넓은 영역에서 정의된 요소와 좁은 영역에서 정의된 요소가 충돌하면 좁은 영역이 이긴다. > 구체적인 표현이라서!!
		if (name.length() >= 2 && name.length() <= 5) {
			this.name = name;
		}
	}
	
	//getter
	public String getName() {
		return this.name;
	}
	
}
