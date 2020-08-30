package com.test.object;

public class Ex21_Class_basic {
	
	public static void main(String[] args) {
		
		//static 키워드
		// - 클래스 멤버에 붙이는 키워드(멤버 변수, 멤버 메소드)
		
		//변수의 종류
		//1. 멤버 변수
		//	a. 객체 멤버 변수 : 여태껏 선언한 변수
		//	b. 정적 멤버 변수 : static 키워드 작성한 변수
		//2. 지역 변수
		//	a. 메소드내에서
		//	b. 제어문내에서
		//	c. 매개변수
		
		
		//객체 메소드
		// - 개인 데이터(객체 변수) 읽기/쓰기
		// - 공용 데이터(정적 변수) 읽기/쓰기
		
		//정적 메소드
		// - 공용 데이터(정적 변수) 읽기/쓰기
		// - 개인 데이터(객체 변수) 접근 불가능		
		
		
		
		//학생 객체 x 3명
		
		Student s1 = new Student();
		s1.setName("홍길동");
		s1.setAge(14);
//		s1.setSchool("역삼 중학교");
		Student.setSchool("역삼 중학교");
		
		Student s2 = new Student();
		s2.setName("아무개");
		s2.setAge(14);
//		s2.setSchool("역삼 중학교");
	
		Student s3 = new Student();
		s3.setName("하하하");
		s3.setAge(15);
//		s3.setSchool("역삼 중학교");
	
		
		s1.hello2(); //개인
		s2.hello2();
		s3.hello2();
		
		Student.hello2(); //공용
		
		
				
	}//main

}//Ex21

//학생 클래스
// - 학생 정보를 저장하는 객체
// - 역삼 중학교(*****)
class Student {
	
	private String name;
	private int age;
//	private String school;
	private static String school;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public static String getSchool() {
		return school;
	}
	public static void setSchool(String school) {
		Student.school = school;
	}
	
	//자기소개를 하는 메소드
	//1. 객체마다 다른 행동 요구 > 객체 메소드
	//2. 객체마다 동일 행동 요구 > 정적 메소드
	public void hello() {
		
		System.out.printf("안녕하세요. 저는 %s입니다.\n"
							, this.name);
		
	}
	
	public static void hello2() {
		
		System.out.printf("저는 %s에 다닙니다.\n"
							, Student.school);
		
	}
	
	
}