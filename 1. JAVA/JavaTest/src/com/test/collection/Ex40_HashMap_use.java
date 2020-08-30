package com.test.collection;

import java.util.ArrayList;
import java.util.HashMap;

public class Ex40_HashMap_use {
	
	public static void main(String[] args) {
		
//		m1();
		m2();
		
	}

	private static void m2() {
		
		//업무 진행 > 데이터 집합 필요!! > 성적 처리 > 학생 1명 성적을 관리할 집합 필요
		//자료 구조 선택?
		//1. 배열
		//3. ArrayList
		//2. 클래스
		//4. HashMap
		
		//집합O, 가독성O
		Score s1 = new Score();
		s1.kor = 100;
		s1.eng = 90;
		s1.math = 80;
		
		//집합O, 가독성O
		HashMap<String,Integer> s2 = new HashMap<String,Integer>();
		s2.put("kor", 100);
		s2.put("eng", 90);
		s2.put("math", 80);
		
		
		
		
		
	}

	private static void m1() {
		
		//Value : 숫자, 문자열, 객체
		//HashMap<String,객체>
		
		HashMap<String,Cup> map = new HashMap<String,Cup>();
		
		//Case 1.
		map.put("내컵", new Cup());
		map.get("내컵").setName("머그컵");
		map.get("내컵").setSize(500);
		
		//Case 2.
		map.put("짝궁컵", new Cup("스테인레스컵", 1000));
		
		//Case 3. 가독성 좋음
		Cup cup = new Cup();
		cup.setName("종이컵");
		cup.setSize(200);
		map.put("남의컵", cup);
		
		System.out.println(map);
		
		//-------------------------
		
		//필통 : 연필 2자루, 지우개 1개, 볼펜 1개
		//필통 역할 > 집합 선택 > 배열 vs ArrayList vs HashMap
		
		HashMap<String,PencilItem> pencilCase = new HashMap<String,PencilItem>();
		pencilCase.put("색연필", new Pencil());
		pencilCase.put("연필", new Pencil());
		pencilCase.put("지우개", new Eraser());
		pencilCase.put("볼펜", new Ballpen());
		
		HashMap<String,PencilItem> pencilCase2 = new HashMap<String,PencilItem>();
		pencilCase2.put("연필", new Pencil());
		pencilCase2.put("지우개", new Eraser());		
		
		HashMap<String,PencilItem> pencilCase3 = new HashMap<String,PencilItem>();
		pencilCase3.put("볼펜", new Ballpen());
		pencilCase3.put("볼펜", new Ballpen());
		
		
		HashMap<String,HashMap<String,PencilItem>> myPencilCase
			= new HashMap<String,HashMap<String,PencilItem>>();
		
		myPencilCase.put("자주쓰는필통", pencilCase);
		myPencilCase.put("시험전용필통", pencilCase2);
		myPencilCase.put("잘안쓰는필통", pencilCase3);
		
//		myPencilCase.get("시험전용필통").get("연필");
		
		HashMap<String,ArrayList<Integer>> list = new HashMap<String,ArrayList<Integer>>();
		
		ArrayList<Integer> nums1 = new ArrayList<Integer>();
		ArrayList<Integer> nums2 = new ArrayList<Integer>();
		
		nums1.add(1);nums1.add(3);nums1.add(5);nums1.add(7);nums1.add(9);
		nums2.add(2);nums2.add(4);nums2.add(6);nums2.add(8);nums2.add(10);
		
		list.put("홀수", nums1);
		list.put("짝수", nums2);		
		
		ArrayList<HashMap<String,Boolean>> list2;
	
	}

}

class PencilItem {
	
}

class Pencil extends PencilItem {
	
}

class Eraser extends PencilItem {
	
}

class Ballpen extends PencilItem {
	
}


class Cup {
	
	private String name;
	private int size;
	
	public Cup() {
		this.setName("");
		this.setSize(0);
	}
	
	public Cup(String name, int size) {
		this.setName(name);
		this.setSize(size);
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

	@Override
	public String toString() {
		return "Cup [name=" + name + ", size=" + size + "]";
	}
	
}


class Score {
	public int kor;
	public int eng;
	public int math;
}
