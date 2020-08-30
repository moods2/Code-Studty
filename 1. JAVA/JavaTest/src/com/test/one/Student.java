package com.test.one;

public class Student {
	
	//접근 지정자
	// - private, public, protected, default(=friendly)
	// 1. private
	//	- 같은 패키지, 다른 패키지 모두 비공재
	// 2. public
	//	- 모두 공개
	// 3. protected
	//	- 같은 패키지 : public
	//	- 다른 패키지 : private
	//	- 다른 패키지 + 자식 클래스 : public
	// 4. default
	//	- 같은 패키지 : public
	//	- 다른 패키지 : private	
	
	
	private int a = 100;
	public int b = 200;
	protected int c = 300;
	int d = 400;
	
	public void test() {
		
		System.out.println("같은 클래스내에서 접근");
		System.out.println("private a : " + this.a);
		System.out.println("public b : " + this.b);
		System.out.println("protected c : " + this.c);
		System.out.println("default d : " + this.d);
		System.out.println();
		
		
		
	}
	

}
