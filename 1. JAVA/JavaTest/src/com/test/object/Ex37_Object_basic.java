package com.test.object;

public class Ex37_Object_basic {
	
	public static void main(String[] args) {
		
		//this vs super 연산자
		ObjectParent p = new ObjectParent();
		
		System.out.println(p.a);
//		System.out.println(p.b);
		
		ObjectChild c = new ObjectChild();
		
		System.out.println(c.a);
//		System.out.println(c.b);
		
		System.out.println();
		c.test();
		
		
		
	}

}

class ObjectParent {
	
	public int a = 100;
	private int b = 20; //자식에게도 비공개!!!
	
	public void check() {
		System.out.println("부모");		
	}
	
}

class ObjectChild extends ObjectParent {
	
	public int a = 200;
	private int c;
	
	public void check() {
		System.out.println("자식");		
	}
	
	public void test() {
		
		System.out.println(this.a);
		System.out.println(super.a); // 감춰졌던 부모를 호출		
//		System.out.println(this.b);
		System.out.println(this.c);
		
		super.check();
		
	}

	@Override
	public String toString() {
		
		return super.toString();
	}
	
}



