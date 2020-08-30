package com.test.object;

public class Ex24_Constructor_question_01 {
	
	public static void main(String[] args) {
		
		//학생 1
		Student3 s1 = new Student3(); //기본 생성자 호출
		System.out.println(s1.info());

		//학생 2
		Student3 s2= new Student3("홍길동", 13); //오버로딩 생성자 호출
		System.out.println(s2.info());

		//학생 3
		Student3 s3= new Student3(3, 10, 30); //오버로딩 생성자 호출
		System.out.println(s3.info());

		//학생 4
		Student3 s4= new Student3("아무개", 12, 1, 5, 11); //오버로딩 생성자 호출
		System.out.println(s4.info());
		
	}

}

class Student3 {
	
	private String name;
	private int age;
	private int grade;
	private int classNumber;
	private int number;
	private static String school;
	
	
	public Student3() {
		
//		this.name = "미정";
//		this.age = 0;
//		this.setGrade(0);
//		this.setClassNumber(0);
//		this.setnumber(0);

		this("미정", 0, 0, 0, 0);
		
		
	}
	
	public Student3(String name, int age, int grade, int classNumber, int number) {
		
		this.name = name;
		this.age = age;
		this.setGrade(grade);
		this.setClassNumber(classNumber);
		this.setNumber(number);
		
	}
	
	public Student3(String name, int age) {
		
//		this.name = name;
//		this.age = age;
//		this.setGrade(0);
//		this.setClassNumber(0);
//		this.setnumber(0);
		
		this(name, age, 0, 0, 0);
		
	}
	
	public Student3(int grade, int classNumber, int number) {
		
//		this.name = "미정";
//		this.age = 0;
//		this.setGrade(grade);
//		this.setClassNumber(classNumber);
//		this.setNumber(number);
		
		this("미정", 0, grade, classNumber, number);
		
	}
	
	static {
		
		Student3.school = "역삼 중학교";
		
	}
	
	public String info() {
		
		String result = "";
		result += name + "(" + "나이 : " + age + "세, 학년 : " + grade 
				+ ", 반 : " + classNumber +  ", 번호 : " + number + ")";
		
		return result;
		
	}

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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getClassNumber() {
		return classNumber;
	}

	public void setClassNumber(int classNumber) {
		this.classNumber = classNumber;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

}