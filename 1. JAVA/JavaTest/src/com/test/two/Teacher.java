package com.test.two;

public class Teacher {
	public static int temp;
	private int seq;		//강사번호
	private int key;
	private String name; 	//강사 이름
	private int age; 		//강사 나이
	private String address; //강사 주소
	private String tel; 	//강사 연락처
	private String subject;
	
	public static void setTemp(int temp) {
		Teacher.temp = temp;
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	

}
