package com.test.array;

import java.util.Calendar;

public class Ex15_Array_use_01 {
	
	public static void main(String[] args) {
		
		m1();
//		m2();
//		m3();
//		m4();
		
	}

	private static void m4() {
		
		//배열 복사
		int a = 10;
		int b;
		
		b = a; //값 복사
		
		System.out.println(b);
		
		int[] list1 = new int[3];
		list1[0] = 100;
		list1[1] = 200;
		list1[2] = 300;
		
		int[] list2;
		
		//배열의 복사(= 모든 참조형의 복사)에서 발생하는 현상. 문자열은 제외
		//int[] = int[]
		list2 = list1;
		
		System.out.println(list2[2]);
		
		list1[0] = 1000;
		
		System.out.println(list1[0]);
		System.out.println(list2[0]); //***
		
		for (int i=0; i<list1.length; i++) {
			System.out.println(list1[i]);
		}
		
		view(list1); //list1
		
		System.out.println(list1[0]); //다른데서 고쳐도 같이 고쳐짐
				
	}
	private static void view(int[] list1) {
		
		for (int i=0; i<list1.length; i++) {
			System.out.println(i + ":" + list1[i]);
		}
		list1[0] = 500;
		
	}

	private static void m3() {
		
		//***** 메모리의 모든 공간은 한번 만들어지면 그 크기(용도)를 변화할 수 없다.
		// -> 불변
		// -> 배열에도 적용 -> 배열의 길이는 불변이다.
		
		//배열의 길이를 동적 할당이 가능하다.
		
		int num = 3; //키보드 입력
		
		int[] list = new int[num];
		
		System.out.println(list.length);		
		
	} 

	private static void m2() {
		
		//배열 + 여러 자료형
		
		//정수 배열(byte, short, int, long)
		
		//a의 자료형? > short
		short a = 10;
		
		//list1의 자료형? -> short[] (short 1차원배열)
		short[] list1 = new short[3];
		
		//list1[0]의 자료형? > short
		list1[0] = 10;
		
		System.out.println(list1[0]);
		
		//실수 배열(float, double)
		double[] list2 = new double[3];
		list2[0] = 3.14;
		System.out.println(list2[0]);
		
		//문자형 배열
		char[] list3 = new char[3];
		list3[0] = '가';
		System.out.println(list3[0]);
		
		//논리형 배열
		boolean[] list4 = new boolean[3];
		list4[0] = true;
		System.out.println(list4[0]);
		
//		-------------------------------------------------
		
		//문자열 배열
		String[] list5 = new String[3];
		list5[0] = "홍길동";
		System.out.println(list5[0]);
		
		Calendar[] list6 = new Calendar[3];
		list6[0] = Calendar.getInstance();
		System.out.printf("%tF\n", list6[0]);
		
	}

	private static void m1() {
		
		//배열의 방번호 == for문의 루프변수(i)
		int[] list = new int[10]; //방 10개 모두 NULL 상태
		
		//방 10개 값 대입
		//배열 탐색 루프
		for (int i=0; i<list.length; i++) {
			
			int n = (int)(Math.random() * 100); // 0~99
			
			list[i] = n; //***
					
		}
		
		//출력
		for (int i=0; i<list.length; i++) {
			System.out.printf("list[%d] = %d\n", i, list[i]);
			
		}
		
		System.out.println(list[list.length-1]);
		//java.lang.ArrayIndexOutOfBoundsException
//		System.out.println(list[10]); //없는 방번호
//		System.out.println(list[-1]); //음수 X
		
	}

}
