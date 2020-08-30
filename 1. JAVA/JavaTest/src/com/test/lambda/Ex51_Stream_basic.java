package com.test.lambda;

import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;
import java.util.stream.Stream;

public class Ex51_Stream_basic {
	
	public static void main(String[] args) {
		
		//스트림 = 파이프의 조합
		//1. 원본 파이프 : stream()
		
		//3. 정렬 파이프 : sorted()
		//4. 필터 파이프 : filter()
		//5. 중복 제거 파이프 : distinct()
		
		//6. 변환 파이프 : map()
				
		//2. 최종 소비 파이프 : forEach()
		
		//입출력 기능(io) + 람다식 사용
		
		//Item item = new Item();
		//item.color = Item.red;
		//item.color = Item.Color.BLUE;
		
//		m1();
//		m2();
//		m3();
//		m4();
//		m5();
		m6();
		
		
	}//main

	private static void m6() {
		
		//map()
		// - Mapping(연결 + 변환)
		// -> 추출
		// -> 변환
		// -> 축소
		
		List<String> names = Item.getListString();
		System.out.println(names);
		
		names.stream().map(name -> name)
			.forEach(name -> System.out.println(name));
		System.out.println();
		
		names.stream().map(name -> name.length())
		.forEach(length -> System.out.println(length));
		System.out.println();
		
		List<Item> items = Item.getList();
		
		items.stream().map(item -> {
			if ((item.getSize() > 50)
					&& (item.getColor() == Item.Color.BLACK)
					|| (item.getColor() == Item.Color.WHITE)) {
			return "고가품";
			} else {
			return "저가품";
			}			
			
		}).forEach(result -> System.out.println(result));
		System.out.println();
		
		
		items = Item.getList(); //이름, 크기, 색상
		
		items.stream().map(item -> item.getColor())
			.forEach(color -> System.out.println(color));
		System.out.println();
		
		//정리
		items.stream()
			.filter(item -> item.getName().length() >= 2)
			.map(item -> item.getName())
			.sorted((name1, name2) -> name1.length() - name2.length())
			.distinct()
			.forEach(name -> System.out.println(name));
		System.out.println();
		
		
	}

	private static void m5() {
		
		//distinct()
		// - 중복값 제거 -> 1개만 남기는 작업
		List<Integer> nums = Item.getListInt();
		
		System.out.println(nums);
		
		//중간 파이프 역할 -> 반환값 Stream
		nums.stream().distinct().forEach(num -> System.out.print(num + " "));
		System.out.println();
		
		//객체 배열 -> 중복값 제거
		List<Item> items = Item.getList();
		System.out.println(items);
		System.out.println();
		
		items.stream().distinct().forEach(item -> System.out.println(item));
		System.out.println();
		
		//
		items.stream()															//원본 파이프
		.filter(item -> item.getColor() == Item.Color.BLACK)					//필터 파이프
		.distinct()																//중복제거 파이프
		.sorted((item1,item2) -> item1.getName().compareTo(item2.getName()))	//정렬
		.forEach(item -> {														//출력
			System.out.println("이름" + item.getName());
			System.out.println("크기" + item.getSize());
			System.out.println("색상" + item.getColor());
			System.out.println();			
		});
		
		
	}

	private static void m4() {
		
		//필터
		// - 스트림의 요소 중 원하는 것 추출
		// - 검색
		
		List<Integer> nums = Item.getListInt();
		
		nums.stream().filter(num -> num > 50).forEach(num -> System.out.println(num));
		System.out.println();
		
		List<String> names = Item.getListString();
		
		names.stream()
			.filter(name -> name.length() >= 3)
			.sorted()
			.forEach(name -> System.out.println(name));
		System.out.println();
		
		List<Item> items = Item.getList();
		
		//이름, 크기, 색상
		items.stream()
			.filter(item -> item.getColor() == Item.Color.BLACK)
			.forEach(item -> System.out.println(item));
		System.out.println();
		
		items.stream()
			.filter(item -> item.getSize() >= 30 && item.getColor() == Item.Color.RED)
			.forEach(item -> System.out.println(item));
		System.out.println();
		
		items.stream()
			.filter(item -> item.getSize() >= 30)
			.filter(item -> item.getColor() == Item.Color.RED)
			.forEach(item -> System.out.println(item));
		System.out.println();		
		
	}

	private static void m3() {
		
		//정렬
		List<Integer> nums = Item.getListInt();
		
		System.out.println(nums);
		
		//List 정렬
		//Collections.sort(nums);
		//nums.sort((n1, n2) -> n2 - n1);
		
		//Stream 정렬
		nums.stream().sorted().forEach(num -> System.out.print(num + " "));
		System.out.println();
		
		nums.stream().sorted((n1, n2) -> n2 - n1).forEach(num -> System.out.print(num + " "));
		System.out.println();
		
		List<String> names = Item.getListString();
		
		names.stream().sorted().forEach(name -> System.out.println(name));
		System.out.println();
		
		names.stream().sorted((s1, s2) -> s2.compareTo(s1)).forEach(name -> System.out.println(name));
		System.out.println();
		
		names.stream()
			.sorted((s1, s2) -> s1.length() - s2.length())
			.forEach(name -> System.out.println(name));
		System.out.println();
		
		List<Item> items = Item.getList();
		
		items.stream()
		.sorted((item1, item2) -> item1.getColor().compareTo(item2.getColor()))
		.forEach(item -> System.out.println(item));
		
		
	}

	private static void m2() {
		
		//데이터 소스를 여러가지로 테스트
		
		//데이터 소스 : List
		List<String> names = Item.getListString();
		names.stream().forEach(name -> System.out.println(name));
		System.out.println();
		
		//2. 데이터 소스 : 배열
		String[] list = new String[] { "빨강", "노랑", "파랑", "검정", "하양" };
		Arrays.stream(list).forEach(color -> System.out.println(color));
		System.out.println();
		
		try {
			
			//3. 데이터 소스 : 파일
			BufferedReader reader = new BufferedReader(new FileReader("D:\\class\\Java\\JavaTest\\src\\com\\test\\method\\Ex08_Method_question_12.java"));
			reader.lines().forEach(line -> System.out.println(line));			
			reader.close();
			
			//4. 데이터 소스 : 디렉토리
			//dir.listFiles()
			Files.list(Paths.get("D:\\class\\java")).forEach(path -> System.out.println(path.getFileName()));
			System.out.println();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
		
	}

	private static void m1() {
		
		//스트림, Stream
		// - JDK 1.8 추가
		// - 주로 배열(컬렉션)을 탐색하기 위한 도구(디렉토리, 파일 등 탐색 용도)
		// - 람다식으로 구현 많음(=익명 객체 요구)
		// - Iterator(외부 반복자) 작업과 유사
		// - 내부 반복자
		
		List<Integer> nums = Item.getListInt();
		
		System.out.println(nums);
		
		//nums 탐색
		//1. for : index 사용 O
		for (int i=0; i<nums.size(); i++) {
			System.out.print(nums.get(i) + " ");
		}
		System.out.println();
		
		//2. for : index 사용 X
		for (int num : nums) {
			System.out.print(num + " ");
		}
		System.out.println();
		
		//3. Iterator : index 사용 X
		Iterator<Integer> iter = nums.iterator();
		
		while (iter.hasNext()) {
			System.out.print(iter.next() + " ");
		}
		System.out.println();
		
		//4. Stream : index 사용 X
		Stream<Integer> stream = nums.stream();
		
		//매개변수로 인터페이스가 적혀있으면 할 수 있는 방법3가지
		//A. 인터페이스 + 클래스 선언 -> 객체 생성		
		stream.forEach(new Test());
		System.out.println();
		stream.close();
		
		stream = nums.stream(); //다시 열기
		//B. 인터페이스 -> 익명 객체 생성
		stream.forEach(new Consumer<Integer>() {

			@Override
			public void accept(Integer t) {
				System.out.print(t + " ");				
			}
			
		});
		stream.close();
		System.out.println();
		
		//C.인터페이스 -> 람다식 구현
		stream = nums.stream(); //다시 열기
		stream.forEach(t -> System.out.print(t + " "));
		System.out.println();
		
		
		List<String> names = Item.getListString();
		
		//함수형 스타일
		names.stream().forEach(name -> System.out.println(name));
		
		Item.getList().stream().forEach(item -> System.out.println(item.getColor()));
		
		stream.close();
		
	}

}//Ex51

//***** 이 클래스는 다른데에서는 사용 안함. 오직 63라인에서 사용하기 위한 클래스
class Test implements Consumer<Integer> {

	@Override
	public void accept(Integer t) {
		System.out.print(t + " ");		
	}

}


class Item {
	
	private String name; 	//자유 입력
	private int size;		//자유 입력
	//private String color;	//선택 입력 > public final static vs enum
	
//	public int color;
//	public final static int red = 1;
//	public final static int yellow = 2;
//	public final static int blue = 3;
	
	public Color color;
	
	public enum Color {
		RED, YELLOW, BLUE, BLACK, WHITE, PURPLE, GREEN
	}

	//생성자
	public Item(String name, int size, Color color) {
		super();
		this.name = name;
		this.size = size;
		this.color = color;
	}	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return String.format("(%s,%d,%s)\n", this.name, this.size, this.color);
	}
	
	//더미 생성 메소드
	public static List<Item> getList() {
		
		List<Item> list = new ArrayList<Item>();
		
		list.add(new Item("키보드", 30, Color.BLACK));
		list.add(new Item("마우스", 10, Color.BLACK));
		list.add(new Item("선풍기", 25, Color.WHITE));
		list.add(new Item("컵", 35, Color.GREEN));
		list.add(new Item("책", 45, Color.YELLOW));
		list.add(new Item("소독제", 35, Color.BLUE));
		list.add(new Item("책상", 100, Color.RED));
		list.add(new Item("의자", 50, Color.RED));
		list.add(new Item("프로젝터", 55, Color.WHITE));
		list.add(new Item("우산", 40, Color.BLACK));		
		
		return list;
		
	}
	
	public static List<Integer> getListInt() {
		
		List<Integer> list = new ArrayList<Integer>();
		List<Item> items = getList();
		
		for (Item item : items) {
			list.add(item.getSize());
		}
		
		return list;
		
	}
	
	public static List<String> getListString() {
		
		List<String> list = new ArrayList<String>();
		List<Item> items = getList();
		
		for (Item item : items) {
			list.add(item.getName());
		}
		
		return list;
		
	}
	
	//객체 비교 -> 주소값 비교 :: 기본 동작
	//객체 비교 -> 상태 비교 :: hashCode() & equals() 오버라이드
	
	@Override
	public int hashCode() {
		
		//객체 메모리 주소 반환 -> 멤버 변수 사용 -> 상수 -> 상수 메모리 주소 반환
		
		//a -> "선풍기20BLACK".hashCode() -> 12345678
		//b -> "선풍기20BLACK".hashCode() -> 12345678
		//c -> "선풍기19BLACK".hashCode() -> 25415784
		
		//a(BLACK) -> "선풍기20".hashCode() -> 12345678
		//b(WHITE) -> "선풍기20".hashCode() -> 12345678
		
		
		return (this.name + this.size + this.color).hashCode();	
			
	}
	
	@Override
	public boolean equals(Object obj) {
		
		//Item.equals(Item)
		
		return this.hashCode() == obj.hashCode();
	}
	
	
	
}//Item


















