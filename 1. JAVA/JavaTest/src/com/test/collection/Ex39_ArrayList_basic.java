package com.test.collection;

import java.util.ArrayList;

public class Ex39_ArrayList_basic {
	
	public static void main(String[] args) {
		
	
		/*

		컬렉션, Collection
		- 배열 -> Wrapping -> 기능 추가 or 용도 지정
		- 길이 가변(늘어나거나 줄어드는게 가능)
		- 배열을 사용 목적에 따른 사용법이나 구조를 특화시켜 놓음 -> 자료구조
		- 예전 컬렉션(Object 배열) -> 제네릭 컬렉션


		ArrayList 클래스
		- 순수 배열과 가장 비슷함
		- 사용 빈도가 가장 높음
		- 첨자(index)를 사용해서 요소(element)에 접근 + 제어
		- ArrayList(C) > List(I) > Collection(I)
			

		*/
		
		
//		m1();
//		m2();
		m3();
		
		
		
	}

	private static void m3() {
		
		//ArrayList 사용법
		ArrayList<String> list = new ArrayList<String>();
		
		//1. 요소 추가하기
		// - void add(T value)
		// - 배열의 맨 마지막에 추가하기(Append)
		
		list.add("빨강");
		list.add("노랑"); //list.remove(1), list.remove("노랑")
		list.add("파랑");
		list.add("주황");
		list.add("노랑"); //list.remove(4), list.remove("노랑")
		list.add("보라");
		
		
		//2. 요소 개수
		// - int size()
		System.out.println(list.size());
		
		
		//3. 요소 접근하기
		// - T get(int index)
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
		System.out.println(list.get(4));
//		System.out.println(list.get(5));
		System.out.println(list.get(list.size() - 1));
		
		
		//4. 요소 수정하기
		// - list[0] = 10; //대입 _ 수정
		// - void set(int index, T value)
		
		System.out.println();
		System.out.println(list.get(2));
		
		list.set(2, "녹색");
		
		System.out.println(list.get(2));
		
		
		//5. 요소 삭제하기
		// - 순수 배열의 요소 삭제 불가능(방 길이 줄이는 것이 불가능)
		// - 컬렉션을 요소 삭제 가능(방 길이 줄이는 행동)
		// - T remove(int index) : 더 많이 사용
		// - boolean remove(T value)
		
		System.out.println();
		System.out.println(list.size());
		String old = list.remove(2);
		System.out.println(old);
		list.remove("노랑");
		System.out.println(list.size());
		System.out.println(list.get(2));
		
		
		//6. 탐색
		// - 루프 탐색
		System.out.println();
		
		for (int i=0; i<list.size(); i++) {
			
			System.out.println(list.get(i));
			
		}
		
		System.out.println();
		
		for (String color : list) {
			
			System.out.println(color);
			
		}
		
		System.out.println();
		
		
		//7. 요소 추가하기
		// - 배열의 원하는 위치에 추가하기
		// - Insert(삽입)
		// - void add(int index, T value)
		
		list.add(1, "검정");
		
		for (String color : list) {
			
			System.out.println(color);
			
		}
		
		System.out.println();
		
		
		//8. 요소 검색하기
		// - boolean contains(T value)
		// - int indexOf(T value)
		
		if (list.contains("파랑")) {
			System.out.println("빨강 있음");
		} else {
			System.out.println("빨강 없음");
		}
		
		System.out.println(list.indexOf("주황"));
		System.out.println(list.indexOf("남색"));
		
		
		//9. 초기화
		// - 모든 요소 삭제하기
		// - void clear()
		list.clear();
//		list = new ArrayList<String>(); // 새 배열로 덮어쓰기
		
		System.out.println(list.size());
		
		
		//10. 배열이 비어있는지?
		System.out.println(list.size() == 0);
		System.out.println(list.isEmpty());
		

		
	}

	private static void m2() {
		
		ArrayList list1 = new ArrayList();
		
		list1.add(100);
//		list1.add("홍길동"); //추가 요소의 타입을 주의!!
		
		System.out.println((int)list1.get(0) + 100); //요소의 사용시 형변환 주의!!
		
		//제네릭 버전
		ArrayList<Integer> list2 = new ArrayList<Integer>(); //int[]
		
		list2.add(100);
//		list2.add("홍길동");
		
		System.out.println(list2.get(0) + 100);
		
		ArrayList<String> list3 = new ArrayList<String>();
		
		list3.add("홍길동");
		
		System.out.println(list3.get(0).length());
		
	}

	private static void m1() {
		
		//순수 배열
		// - 선언 : 타입 명시(int) + 길이 명시(3)
		int[] nums1 = new int[3];
		
		//초기화 + 요소 제어 -> 첨자(index) 사용
		nums1[0] = 100;
		nums1[1] = 200;
		nums1[2] = 300;
		
		System.out.println(nums1[0]); //인덱서(Indexer)
		
		
		//ArrayList 컬렉션
		// - 선언 : 타입 명시(x) + 길이 명시(x)
		ArrayList nums2 = new ArrayList(); // ArrayList is a raw type.
		
		//초기화 + 요소 제어
		nums2.add(100); //append - 배열의 마지막 방(데이터가 들어있는 방 다음방)에 추가
		nums2.add(200); //boxing
		nums2.add(300);
		
		//*** 절대 금지!! > Object 저장 공간은 처음에 데이터를 넣을 때 자유!!
		// - 처음 데이터를 넣고 난 후 부터는 절대적으로 처음과 같은 자료형만 넣을 것!!!!!
//		nums2.add("홍길동");
//		nums2.add("아무개");
//		
//		nums2.add(true);
//		nums2.add(false);
		
		System.out.println(nums2.get(0)); //nums2[0]
		System.out.println((int)nums2.get(0) + 200); //주소변수(다운캐스팅) + 상수
		
		//java.lang.StringIndexOutOfBoundsException : 문자열 첨자 
		//java.lang.ArrayIndexOutOfBoundsException : 배열 첨자
		//java.lang.IndexOutOfBoundsException : 컬렉션 첨자
		//System.out.println(nums2.get(5)); //index 에러.
		
		
		System.out.println(nums2.size()); // 배열의 길이 역할(집어넣은 데이터 수)
		
		// - void add(Object value)
		// - Object get(int index)
		// - int size()
		
	}
	
}

