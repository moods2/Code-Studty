package com.test.inheritance;

import java.util.Calendar;
import java.util.Random;

public class Ex32_Object_basic {
	
	public static void main(String[] args) {
		
		//Object 클래스
		// - java.lang.Object
		// - 중요 클래스
		// - Class Object is the root of the class hierarchy.
		//	Every class has Object as a superclass. All objects,including arrays, 
		//	implement the methods of this class.
		
		Temp t = new Temp();
		
		t.a = 10;
//		t.equals()
//		t.hashCode()
//		t.toString()
		System.out.println(t.hashCode()); //임시 ID(식별자)
		System.out.println(t.toString());
		
		
		Object o1 = new Object();
		Object o2 = new AA();
		Object o3 = new BB();
		Object o4 = new CC();
		Object o5 = new Random();
		Object o6 = Calendar.getInstance(); //그레고리력
		Object o7 = "홍길동";
		Object o8 = 10;
		Object o9 = true;
		
		Object[] list = new Object[10];
		
		AA a = new AA();
		AA b = new BB();
		AA c = new CC();
		

		
		Random rnd2 = new Random();
		
		Object rnd1 = new Random();
		list[0] = new Random();
		
//		System.out.println(rnd1.nextInt());
//		System.out.println((Random)rnd1.nextInt()); // rnd1.nextInt() 먼저 -> (Random) 후에
		System.out.println(((Random)rnd1).nextInt()); // ***
		System.out.println(((Random)list[0]).nextInt()); //
		
		
		int num1 = 10;
		Object num2 = 20; //Boxing
		
		System.out.println(num1 + 10);
		System.out.println((int)num2 + 10); // 주소번지 + 숫자를 하려고 해서 오류 -> UnBoxing
		//Boxing - UnBoxing : 성능 저하
		
		
		
		
		
		
	}//main

}//Ex32

class AA {
	
	
}

class BB extends AA {
	
		
}

class CC extends BB {
	
		
}




class Temp extends Object {
	public int a;
}
