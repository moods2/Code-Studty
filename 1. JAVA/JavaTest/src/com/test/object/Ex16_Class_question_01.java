package com.test.object;

public class Ex16_Class_question_01 {

	public static void main(String[] args) {
		
		//Ex16_Class_question_01.java : 테스트 중심
		//Book.java : 문제 중심
		
//		제목 : 읽기/쓰기, 최대 50자 이내(한글, 영어, 숫자)
//		가격 : 읽기/쓰기, 0 ~ 1000000원
//		저자 : 읽기/쓰기, 제한 없음
//		페이지수 : 읽기/쓰기, 1~무제한
//		출판사 : 쓰기 전용
//		발행년도 : 읽기 전용(2020년)
//		ISBN : 읽기/쓰기
		
		Book b1 = new Book();
		
		b1.setTitle("이것이 자바다");
		System.out.println(b1.getTitle());
		
		b1.setPrice(50000);
		System.out.println(b1.getPrice());
		
		b1.setAuthor("홍길동");
		System.out.println(b1.getAuthor());
		
		b1.setPage(800);
		System.out.println(b1.getPage());
		
		b1.setPublisher("정보문화사");
		
		System.out.println(b1.getPubYear());
		
		b1.setIsbn("BAC01010101");
		System.out.println(b1.getIsbn());
		
		
		
	}
	
}










