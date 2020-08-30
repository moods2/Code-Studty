package com.test.collection;

public class Ex40_HashMap_question {
	
	public static void main(String[] args) {
		
		//배열 생성
		MyHashMap map = new MyHashMap();

		//추가
		map.put("국어", "합격");
		map.put("영어", "불합격");
		map.put("수학", "보류");
		map.put("사회", "보류");
		map.put("과학", "보류");
		map.put("지리학", "보류");
		map.put("화학", "보류");
		map.put("물리", "보류");
		map.put("도덕", "보류");
		map.put("세계사", "보류");
		map.put("한국사", "보류");

		//읽기
		System.out.println(map.get("국어"));
		System.out.println(map.get("영어"));
		System.out.println(map.get("수학"));

		//개수
		System.out.println(map.size());
		System.out.println(map);

		//수정
		map.put("영어", "합격");
		System.out.println(map.get("영어"));
		System.out.println(map);

		//삭제
		map.remove("영어");
		System.out.println(map.get("영어"));

		//검색(key)
		if (map.containKey("국어")) {
		    System.out.println("국어 점수 있음");
		} else {
		    System.out.println("국어 점수 없음");
		}

		//검색(value)
		if (map.containsValue("합격")) {
		    System.out.println("합격 과목 있음");
		} else {
		    System.out.println("합격 과목 없음");
		}

		//초기화
		map.clear();
		System.out.println(map.size());
		
	}

}
