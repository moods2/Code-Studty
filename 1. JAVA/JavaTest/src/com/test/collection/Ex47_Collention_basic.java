package com.test.collection;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Vector;

public class Ex47_Collention_basic {
	
	public static void main(String[] args) throws Exception {
		
		
		/*
		
		자바 컬렉션 인터페이스
		
		1. Collection
			- List와 Set의 부모 인터페이스
		
		2. List
			- ArrayList, Stack, LinkedList(Queue), Vector 등
			- 순서가 있는 집합(********)
			- 방번호(index,첨자)를 사용한다.
			- 데이터 중복을 허용한다.
		
		3. Set
			- HashSet, TreeSet 등
			- 순서가 없는 집합(********)
			- 방번호(index,첨자)가 없다.
			- 데이터 중복을 허용 안한다.(********)
		
		4. Map
			- HashMap, TreeMap, HashTable, Properties 등
			- 순서가 없는 집합(***)
			- 키와 값을 사용한다. (*******) > 연관 배열
			- 키(key) : 식별자 역할 > 유일해야 한다. > 중복 허용 안함 > Set 사용
			- 값(value) : 데이터 > 중복 허용 함 > List 사용
			
		** Vector, HashTable, Properties : 호환성 때문에 남겨진 클래스 > 사용 안함
		** 자바 컬렉션 > JDK 1.5
		
		Vector > ArrayList
		HashTable > HashMap
		Properties > XML, JSON 기술		
		
		*/
		
//		m1();
//		m2();
//		m3();
//		m4();
//		m5();
//		m6();
//		m7();
//		m8();
//		m9();
		m10();
		
		
	}//main

	private static void m10() throws Exception {
		
		//종료 -> 다시 실행 -> 설정 복구
		Properties prop = new Properties();
		
		prop.load(new FileInputStream("setting.ini"));
		
		System.out.println(prop);
				
	}

	private static void m9() throws Exception {
		
		//문자열 전용 배열 + 파일 입출력
		// - 프로그램 설정 관리 + 보관
		Properties prop = new Properties();
		
		//설정 추가(요소)
		prop.setProperty("path", "C:\\Program Files\\eclipse");
		prop.setProperty("font-family", "D2Coding");
		prop.setProperty("font-size", "16px");
		
		System.out.println(prop);
		
		System.out.println(prop.getProperty("font-size"));
		
		
		//프로그램 종료 > prop > 파일 저장
		//BufferedWriter
		
		//설정저장 확장자 .ini
		prop.store(new FileOutputStream("setting.ini"), "");
		
		System.out.println("종료");		
		
	}

	private static void m8() {
		
		//TreeMap
		// - 이진트리 구조의 Map
		// - 키 + 값 = 요소
		// - 키 자동 정렬
		// - 범위 추출
		
		TreeMap<String, String> map = new TreeMap<String, String>();
		
		map.put("white", "하양");
		map.put("black", "검정");
		map.put("red", "빨강");
		map.put("yellow", "노랑");
		map.put("blue", "파랑");
		map.put("tomato", "빨강");
		
		System.out.println(map.size());
		System.out.println(map);
		System.out.println(map.get("black"));
		
		//부분 검색(Tree)
		System.out.println(map.firstKey());
		System.out.println(map.firstEntry()); //Entry -> Map 요소 클래스
		
		System.out.println(map.lastKey());
		System.out.println(map.lastEntry());
		
		System.out.println(map.headMap("m")); //????????
		System.out.println(map.tailMap("m"));
		
		System.out.println(map.subMap("m", "w"));
			
		
	}

	private static void m7() {
		
		//HashSet : 평범한 Set
		
		//TreeSet
		// - Tree 구조 Set
		// - 중복값X, 순서X, 정렬X
		// - 자동 정렬이 된다.
		// - 이진 트리 구조로 구현되어 있다.
		// - 범위 검색에 효율적이다.(***)
				
		Set<Integer> set = new TreeSet<Integer>();
		
		set.add(5);
		set.add(3);
		set.add(2);
		set.add(7);
		set.add(9);
		set.add(6);
		set.add(1);
		
		System.out.println(set);
		
		//부분 검색
		TreeSet<Integer> tset = (TreeSet<Integer>)set;
		//TreeSet에서만 쓸수있기 때문에 Set -> TreeSet으로 다운캐스팅
		System.out.println(tset.first());
		System.out.println(tset.last());
		System.out.println(tset.headSet(5)); // 5 이전 숫자 추출 (미포함)
		System.out.println(tset.tailSet(5)); // 5 이후 숫자 추출
		System.out.println(tset.subSet(3, 8));
		
				
	}

	private static void m6() {
		
		//Set
		// - List 형제
		// - 순서가 없는 배열
		// - 방번호(첨자) 사용X
		// - 중복값을 가지지 못한다.(******)
		// - HashSet, TreeSet
		
		// - HashSet : Hash 알고리즘을 사용해서 Set 인터페이스를 구현
		// - HashMap : Hash 알고리즘을 사용해서 Map 인터페이스를 구현
		// - TreeSet : Tree 알고리즘을 사용해서 Set 인터페이스를 구현
		// - TreeMap : Tree 알고리즘을 사용해서 Map 인터페이스를 구현
		
		
//		ArrayList<String> list = new ArrayList<String>();
		List<String> list = new ArrayList<String>();
		
		
		
//		HashSet<String> set = new HashSet<String>();
		Set<String> set = new HashSet<String>();
		
		set.add("사과");
		set.add("바나나");
		set.add("포도");
		set.add("바나나");
		System.out.println(set.add("바나나")); //false : 중복값 x
		System.out.println(set.add("복숭아")); //true
		
		System.out.println(set.size());
		
		System.out.println(set);
		
		//데이터 읽기 > Iterator 구현
		Iterator<String> iter = set.iterator();
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		
		//로또 번호 6개(1~45)
		//1. ArrayList, Array
		// - 중복 값 발생 > 중복 값 체크 + 제거
		//2. Set
		// - 자동 중복 제거
		Random rnd = new Random();
		
		Set<Integer> lotto = new HashSet<Integer>();
		
//		for  (int i=0; i<6; i++) {
		while (lotto.size() <6) {
			lotto.add(rnd.nextInt(45) + 1);
		}
		
		System.out.println(lotto);
		System.out.println();
		
		
		Set<Mouse> cset = new HashSet<Mouse>();
		
		cset.add(new Mouse("M700", 3));
		cset.add(new Mouse("S500", 5));
		cset.add(new Mouse("A1000", 7));
		cset.add(new Mouse("M700", 3)); //중복값으로 안봄
		
		System.out.println(cset);
		
		
		//같은 마우스? 다른 마우스?
		//1. 주소값 : 다른 마우스
		//2. 상태값 : 같은 마우스
		Mouse m1 = new Mouse("M700", 3); 
		Mouse m2 = new Mouse("M700", 3);
		Mouse m3 = new Mouse("A1000", 7);
		
		System.out.println(m1.equals(m2)); //참조형 변수 비교 -> 주소값 비교
		
		System.out.println(m1.hashCode()); //"M7003".hashCode() -> 72797289
		System.out.println(m2.hashCode()); //"M7003".hashCode() -> 72797289
		System.out.println(m3.hashCode()); //"A10007".hashCode() -> 1907624983
		
		System.out.println("홍길동".hashCode());
		System.out.println("홍길동".hashCode());
		System.out.println("홍길동".hashCode());
		
		
	}

	private static void m5() {
		
		//탐색 도구
		// - List, Set에서 사용
		// - 컬렉션 프레임워크에서 요소를 순차적으로 읽기 위한 표준 도구
		// - Enumeration, Iterator(***), ListIterator
		
		
		ArrayList<String> list = new ArrayList<String>();
		
		list.add("사과");
		list.add("바나나");
		list.add("포도");
		list.add("딸기");
		list.add("복숭아");
		
		//탐색
		//1. for문 : index 사용O
		//2. 향상된 for문 : index 사용X
		//3. Interator : index 사용X
		
		//*** 사용 빈도 높음(탐색 구조가 다른 곳에서도 많이 보이는 형태)
		Iterator<String> iter = list.iterator();
		
		//1. hasXXX()
		//2. nextXXX()
		
//		System.out.println(iter.hasNext());
//		System.out.println(iter.next());
//		
//		System.out.println(iter.hasNext());
//		System.out.println(iter.next());
//		
//		System.out.println(iter.hasNext());
//		System.out.println(iter.next());
//		
//		System.out.println(iter.hasNext());
//		System.out.println(iter.next());
//		
//		System.out.println(iter.hasNext());
//		System.out.println(iter.next());
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		//HashMap 탐색
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("사장", "홍길동");
		map.put("부장", "아무개");
		map.put("과장", "하하하");
		map.put("대리", "호호호");
		map.put("사원", "후후후");
		
		Set<String> keys = map.keySet();
		
		Iterator<String> kiter = keys.iterator();
		
		while (kiter.hasNext()) {
			String key = kiter.next();
			System.out.println(key + "," + map.get(key));			
		}
		
		
		Collection<String> vlist = map.values();
		
		Iterator<String> viter = vlist.iterator();
		
		while (viter.hasNext()) {
			System.out.println(viter.next());
		}
		
		System.out.println();
		System.out.println(list);
		System.out.println();
		
		//ListIterator
		//list.iterator();
		ListIterator<String> liter = list.listIterator();
		
		while (liter.hasNext()) {
			System.out.println(liter.next());
		}
		
		while (liter.hasPrevious()) {
			System.out.println(liter.previous());
		}
		
		
		
		
	}

	private static void m4() {
		
		//ArrayList vs LinkedList
		// - 작업별 속도 차이
		
		ArrayList<Integer> nums1 = new ArrayList<Integer>();
		LinkedList<Integer> nums2 = new LinkedList<Integer>();
		
		long begin = 0, end = 0;
		
		System.out.println("순차적으로 데이터 추가하기(Append)");
		
		begin = System.nanoTime();
		
		for (int i=0; i<1000000; i++) {
			
			nums1.add(i);
			
		}
				
		end = System.nanoTime();		
		System.out.printf("ArrayList 작업 시간 : %,dns\n", end - begin);
		
		
		begin = System.nanoTime();
		
		for (int i=0; i<1000000; i++) {
			
			nums2.add(i);
			
		}
		
		end = System.nanoTime();		
		System.out.printf("LinkedList 작업 시간 : %,dns\n", end - begin);
		
		
		
		
		
		
		
		System.out.println("중간에 데이터 추가하기(Insert + Shift)");
		
		begin = System.nanoTime();
		
		for (int i=0; i<100000; i++) {
			
			nums1.add(0, i); //중간 삽입
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("ArrayList 작업 시간 : %,dns\n", end - begin);
		
		
		begin = System.nanoTime();
		
		for (int i=0; i<100000; i++) {
			
			nums2.add(0, i); //중간 삽입
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("LinkedList 작업 시간 : %,dns\n", end - begin);
		
		
		
		
		
		
		
		System.out.println("중간에 데이터 삭제하기(Delete + Shift)");
		
		begin = System.nanoTime();
		
		for (int i=0; i<100000; i++) {
			
			nums1.remove(0);
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("ArrayList 작업 시간 : %,dns\n", end - begin);
		
		
		begin = System.nanoTime();
		
		for (int i=0; i<100000; i++) {
			
			nums2.remove(0);
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("LinkedList 작업 시간 : %,dns\n", end - begin);
		
		
		
		
		
		
		
		System.out.println("중간에 데이터 삭제하기(Delete + Shift)");
		
		begin = System.nanoTime();
		
		for (int i=nums1.size()-1; i>=0; i--) {
			
			nums1.remove(i);
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("ArrayList 작업 시간 : %,dns\n", end - begin);
		
		
		begin = System.nanoTime();
		
		for (int i=nums1.size()-1; i>=0; i--) {
			
			nums2.remove(i);
			
		}
		
		end = System.nanoTime();
		
		System.out.printf("LinkedList 작업 시간 : %,dns\n", end - begin);
		
		
		
	}

	private static void m3() {
		
		//LinkedList 클래스
		// - Queue를 구현할 때 사용했던 클래스
		
		//ArrayList vs LinkedList
		// - 둘 다 List 구현한 클래스
		// - 겉모습은 거의 동일한데 내부 구조 완전히 다름
		
		//ArrayList
		// - 연속적이다.
		// - 요소의 접근 속도가 가장 빠르다.
		// - Append 작업에는 효과적이지만 Insert/Delete 작업에 비효율적이다.
		
		//LinkedList
		// - 비연속적이다.
		// - 요소의 접근 속도가 느리다.
		// - Insert/Delete 작업에 효과적이다. Append는 불리함.
		
		//LinkedList 종류
		// 1. LinkedList
		// 2. Double LinkedList
		// 3. Double Circular LinkedList : 자바 LinkedList
		
		ArrayList<Integer> nums1 = new ArrayList<Integer>();
		LinkedList<Integer> nums2 = new LinkedList<Integer>();
		
		nums1.add(100);
		nums1.add(200);
		nums1.add(300);
		
		nums2.add(100);
		nums2.add(200);
		nums2.add(300);
		
		System.out.println(nums1.size());
		System.out.println(nums2.size());
		
		
	}

	private static void m2() {
		
		//정렬
		// - 순서가 있는 집합에서 요소의 순서를 재배치
		// - List 계열만 가능
		// - Set과 Map계열은 불가능
		
		//객체.sort() : 단일값 정렬, 복합값 정렬 > Comparator 반드시 구현
		//Collections.sort() : 단일값 정렬, 복합값 정렬 > Comparator 선택 구현
		
		
		//단일값 정렬
		ArrayList<Integer> list1 = new ArrayList<Integer>();
		
		list1.add(5);
		list1.add(2);
		list1.add(8);
		list1.add(3);
		list1.add(7);
		
//		Collections.sort(list1);
		list1.sort(new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				//요소 2개의 비교 > 누가 더 크고 or 작은지를 판단하는 규칙을 정한다.
				//1. 양수
				//2. 음수
				//3. 0
				return o2 - o1;
			}
			
		});
		
		System.out.println(list1);
		
		ArrayList<String> list2 = new ArrayList<String>();
		
		list2.add("사과");
		list2.add("귤");
		list2.add("오렌지");
		list2.add("파인애플");
		list2.add("포도");
		
		//문자 코드 정렬
//		Collections.sort(list2);
		
		//문자 길이 정렬
		list2.sort(new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				
				//return o2.compareTo(o1);
				return o2.length() - o1.length();
			}
			
		});
		
		System.out.println(list2);	
		
		
		//복합값 정렬
		
		ArrayList<Member> list3 = new ArrayList<Member>();
		
		Calendar c = Calendar.getInstance();
		c.set(1995, 2, 10);
		
		list3.add(new Member("홍길동", 25, c, "서울"));
		c.set(Calendar.MONTH, 3);
		
		list3.add(new Member("아무개", 30, c, "부산"));
		c = Calendar.getInstance();
		c.set(1995, 2, 10);
		c.set(Calendar.MONTH, -1);
		
		list3.add(new Member("하하하", 22, c, "서울"));
		c = Calendar.getInstance();
		c.set(1995, 2, 10);
		c.set(Calendar.MONTH, 6);
		
		list3.add(new Member("유재석", 27, c, "서울"));
		c = Calendar.getInstance();
		c.set(1995, 2, 10);
		c.set(Calendar.MONTH, -3);
		
		list3.add(new Member("강호동", 26, c, "대구"));
		c = Calendar.getInstance();
		c.set(1995, 2, 10);
		c.set(Calendar.MONTH, 7);
		
		//정렬(*******)
//		Collections.sort(list3);
		list3.sort(new Comparator<Member>() {

			@Override
			public int compare(Member o1, Member o2) {
				
//				return o1.name.compareTo(o2.name);
//				return o1.age - o2.age;
//				return o1.birthday.compareTo(o2.birthday);
//				return o1.address.compareTo(o2.address);
				
				if (o1.address.compareTo(o2.address) != 0) {
					return o1.address.compareTo(o2.address); //원래 하던대로 반환
				} else {
					//지역 동일 > 이름 오름차순
					return o1.name.compareTo(o2.name);
				}
			}
			
		});
	
		System.out.println(list3);
		
		
	}

	private static void m1() {
		
		//List 계열
		//1. Vector : 동기화 지원
		//2. ArrayList : 동기화 지원안함
		
		ArrayList<String> list = new ArrayList<String>();
		Vector<String> list2 = new Vector<String>();
		
		list.add("홍길동");
		list.add("아무개");
		
		list2.add("홍길동");
		list2.add("아무개");
		
		System.out.println(list.size());
		System.out.println(list2.size());
		
		System.out.println(list.get(0));
		System.out.println(list2.get(0));
		
	}

}
