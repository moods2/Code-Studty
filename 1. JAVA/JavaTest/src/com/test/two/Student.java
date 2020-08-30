package com.test.two;

//Student 클래스의 역할 : 데이터 집합
public class Student {
	
	public static int temp;
	private int key;
	private int seq;			//학생번호
	private String name;		//이름
	private int age;			//나이
	private String address;		//주소
	private String gender;		//성별
	private String tel;			//연락처
	private int score;			//성적
	private String grade;		//등급
	private String job;			//취업여부
	private String pay;			//결재여부
	private String memo;		//메모
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	
	
	@Override
	public String toString() {
		return "Student [seq=" + seq + ", name=" + name + ", age=" + age + ", address=" + address + ", gender=" + gender
				+ ", tel=" + tel + ", score=" + score + ", grade=" + grade + ", job=" + job + ", pay=" + pay + ", memo="
				+ memo + "]\n";
	}
	
}
