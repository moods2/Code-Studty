package com.test.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Ex39_ArrayList_use {
	
	public static void main(String[] args) {
		
//		m1();
//		m2();
		m3();
		
	}

	private static void m3() {
		
		//배열 : 길이 불변
		//컬렉션 : 길이 가변, 배열 Wrapper 클래스
		
		ArrayList<Integer> list = new ArrayList<Integer>(1000); // - 28번줄
		
		System.out.println(list.size());
		
		for (int i=0; i<1000; i++) {
			//10 -> 20 -> 40 -> 80 -> 160 -> 320 -> 640 -> 1280
			//1000칸으로 시작
			list.add(i);
			
		}
		
		list.trimToSize(); //현재 데이터의 크기와 동일한 크기의 배열로 교체 (변동 없음이 확실할때)
		
		System.out.println(list.size());
		
		list.remove(50);
		
		System.out.println(list.size());
		
		
	}

	private static void m2() {
		
		//요소의 타입
		//1. 단일값 배열
		//2. 다중값 배열
		
		int[] list1 = new int[3];			//단일값 배열(방 1개 = int)
		String[] list2 = new String[3];		//단일값 배열(방 1개 = String)
		Item[] list3 = new Item[3];			//다중값 배열(방 1개 = 데이터 3개)
		
		ArrayList<Integer> list4 = new ArrayList<Integer>();	//단일값 배열
		ArrayList<String> list5 = new ArrayList<String>();		//단일값 배열
		ArrayList<Item> list6 = new ArrayList<Item>();			//다중값 배열
		
		
		list3[0] = new Item();
		list3[1] = new Item();
		list3[2] = new Item();
		
		list3[0].a = 100;
		list3[0].b = 200;
		list3[0].c = "홍길동";
		
		list6.add(new Item()); // *
		list6.add(new Item());
		list6.add(new Item());
		
		list6.get(0).a = 100;
		list6.get(0).b = 200;
		list6.get(0).c = "홍길동";
		
		int[][] list7 = new int[2][3];
		list7[0][0] = 100;
		
		ArrayList<ArrayList<Integer>> list8 = new ArrayList<ArrayList<Integer>>();
		list8.add(new ArrayList<Integer>());
		list8.add(new ArrayList<Integer>());
		
		list8.get(0).add(100);
		list8.get(0).add(200);
		list8.get(0).add(300);
		
		list8.get(1).add(400);
		list8.get(1).add(500);
		list8.get(1).add(600);

		ArrayList<Integer> sub = new ArrayList<Integer>();
		sub.add(700);
		sub.add(800);
		sub.add(900);
		
		list8.add(sub);
		
//		ArrayList<ArrayList<ArrayList<Item>>> items;
//		items.get(0).get(0).get(0).a = 100;
		System.out.println(list8);
		
		
		
	}

	private static void m1() {
		
		//배열 vs ArrayLiset
		// - 길이 고정?
		
		//요구사항] 학생 명단 관리
		//1. 5명 고정 > 배열 사용
		//2. 고정 불확실 > ArrayList 사용
		
//		Scanner scan = new Scanner(System.in);
//		
//		String[] names = new String[5];
//		
//		for (int i=0; i<names.length; i++) {
//			
//			System.out.print("이름 : ");
//			names[i] = scan.nextLine();
//			
//		}
//		
//		System.out.println();
//		System.out.println(Arrays.toString(names));
		
		Scanner scan = new Scanner(System.in);
		
		ArrayList<String> names = new ArrayList<String>(); //가변
//		int count = 5;
		
//		for (int i=0; i<count; i++) {
		for (;;) {	
			System.out.print("이름 : ");
			
			String input = scan.nextLine();
			
			if (input.equals("exit")) {
				break;
			}
			
			names.add(input);
			
		}
		
		System.out.println();
		System.out.println(names);
		
		
		
		
	}

}//Ex39

class Item {
	
	public int a;
	public int b;
	public String c;
	
}
