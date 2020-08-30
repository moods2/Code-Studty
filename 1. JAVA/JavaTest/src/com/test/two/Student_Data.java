package com.test.two;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.Scanner;

public class Student_Data {
	
	private static Output output; //전역
	private static Scanner scan;
	private static ArrayList<Student> list;
	
	static {
		
		output = new Output();
		scan = new Scanner(System.in);
		list = new ArrayList<Student>();
		
	}
	
	public static void main(String[] args) throws Exception {
		
		studentDummy(); 
			
		output.begin();
		
		boolean loop = true;
		
		while (loop) {
			
			output.menu();
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) {
				//학생 추가
				add();
			} else if (sel.equals("2")) {
				//학생 목록
				list();
			} else if (sel.equals("3")) {
				//학생 삭제
				delete();
			} else if (sel.equals("4")) {
				//학생 검색
				search();
			} else if (sel.equals("5")) {
				//학생 수정
				correct();
			} else {
				//프로그램 종료
				loop = false;
			}
			
		}		
		
		output.end();
				

	}//main

	private static void correct() {
		
		output.title(Title.CORRECT);
		
		System.out.println("[번호]\t[이름]\t[나이]\t[성별]\t[전화번호]\t[주소]\t\t[성적]\t[등급]\t[취업]\t[결재]\t[메모]");
		
		for (Student s : list) {			

				System.out.printf("%5d\t%s\t  %d\t  %s\t%s\t%s\t%4d\t%4s\t%4s\t%4s\t%s\n"
						, s.getSeq()
						, s.getName()
						, s.getAge()
						, s.getGender()
						, s.getTel()
						, s.getAddress()
						, s.getScore()
						, s.getGrade()
						, s.getJob()
						, s.getPay()
						, s.getMemo());
			
		}
		
		System.out.print("수정(학생명) : ");
		String word = scan.nextLine();
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		System.out.print("나이 : ");
		int age = scan.nextInt();	
		scan.skip("\r\n");
		
		System.out.print("성별 : ");
		String gender = scan.nextLine();
		
		System.out.print("연락처 : ");
		String tel = scan.nextLine();
		
		System.out.print("주소 : ");
		String address = scan.nextLine();
		
		System.out.print("취업여부 : ");
		String job = scan.nextLine();
		
		System.out.print("결재여부 : ");
		String pay = scan.nextLine();	
		
		
		
		
		System.out.println("[번호]\t[이름]\t[나이]\t[성별]\t[전화번호]\t[주소]\t\t[성적]\t[등급]\t[취업]\t[결재]\t[메모]");
		
		for (Student s : list) {
		
			
			if (s.getName().contains(word)) {
				
				s.setName(name);
				s.setAge(age);
				s.setGender(gender);
				s.setTel(tel);
				s.setAddress(address);
				s.setJob(job);
				s.setPay(pay);
				
				System.out.printf("%5d\t%s\t  %d\t  %s\t%s\t%s\t%4d\t%4s\t%4s\t%4s\t%s\n"
						, s.getSeq()
						, s.getName()
						, s.getAge()
						, s.getGender()
						, s.getTel()
						, s.getAddress()
						, s.getScore()
						, s.getGrade()
						, s.getJob()
						, s.getPay()
						, s.getMemo());
			}
			
		}
		
		output.pause(scan);
		
	}

	private static void search() {
		
		output.title(Title.SEARCH);
		
		System.out.print("검색(학생명) : ");
		String word = scan.nextLine();
		
		System.out.println("[번호]\t[이름]\t[나이]\t[성별]\t[전화번호]\t[주소]\t\t[성적]\t[등급]\t[취업]\t[결재]\t[메모]");
		
		for (Student s : list) {			
			
			if (s.getName().contains(word)) {
				System.out.printf("%5d\t%s\t  %d\t  %s\t%s\t%s\t%4d\t%4s\t%4s\t%4s\t%s\n"
						, s.getSeq()
						, s.getName()
						, s.getAge()
						, s.getGender()
						, s.getTel()
						, s.getAddress()
						, s.getScore()
						, s.getGrade()
						, s.getJob()
						, s.getPay()
						, s.getMemo());
			}
			
		}
		
		output.pause(scan);
		
	}

	private static void delete() {
		
		output.title(Title.DELETE);
		
		listName();
		
		System.out.print("삭제할 번호 : ");
		int seq = scan.nextInt();
		scan.skip("\r\n");
		
		for(int i=0; i<list.size(); i++) {
			
			if(list.get(i).getSeq() == seq) {
				list.remove(i);
				break;
			}
			
		}		
		
		output.pause(scan);
		
	}

	private static void list() {
		
		output.title(Title.LIST);
		
		listName();
		
		output.pause(scan);
		
	}

	private static void listName() {
		
		System.out.println("[번호]\t[이름]\t[나이]\t[성별]\t[전화번호]\t[주소]\t\t[성적]\t[등급]\t[취업]\t[결재]\t[메모]");
		
		for (Student s : list) {
			
			System.out.printf("%5d\t%s\t  %d\t  %s\t%s\t%s\t%4d\t%4s\t%4s\t%4s\t%s\n"
								, s.getSeq()
								, s.getName()
								, s.getAge()
								, s.getGender()
								, s.getTel()
								, s.getAddress()
								, s.getScore()
								, s.getGrade()
								, s.getJob()
								, s.getPay()
								, s.getMemo());		
			
		}
		
		
	}

	private static void add() {
		
		output.title(Title.ADD);
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		System.out.print("나이 : ");
		int age = scan.nextInt();	
		scan.skip("\r\n");
		
		System.out.print("성별 : ");
		String gender = scan.nextLine();
		
		System.out.print("연락처 : ");
		String tel = scan.nextLine();
		
		System.out.print("주소 : ");
		String address = scan.nextLine();
		
		System.out.print("성적 : ");
		int score = scan.nextInt();
		scan.skip("\r\n");
		
		String grade = "";
		if (score <= 100 && score > 90) {
			grade = "A";
		} else if (score <= 90 && score > 80) {
			grade = "B";
		} else if (score <= 80 && score > 70) {
			grade = "C";
		} else if (score <= 70 && score > 60) {
			grade = "D";
		} else {
			grade = "F";
		}
		
		System.out.print("취업여부 : ");
		String job = scan.nextLine();
		
		System.out.print("결재여부 : ");
		String pay = scan.nextLine();
		
		String memo = "";
		
		
		//입력받은 정보 > Student 객페 포장
		Student s = new Student();
		
		Student.temp++; //일련 번호
		
		s.setSeq(Student.temp);
		s.setName(name);
		s.setAge(age);
		s.setAddress(address);
		s.setTel(tel);
		s.setGender(gender);
		s.setScore(score);
		s.setGrade(grade);
		s.setJob(job);
		s.setPay(pay);
		s.setMemo(memo);
		
		//학생 목록 추가 (******)
		list.add(s);
		
		//잠시 멈춤
		output.pause(scan);		
		
	}

	private static void studentDummy() throws Exception {
		
		FileWriter writer = new FileWriter("C:\\Users\\user\\Desktop\\수강생.txt");
	
		String[] temp1 = { "김", "이", "박", "최", "정", "백", "장", "구", "주", "홍", "신", "안"
				, "오", "윤", "조", "한", "고", "남", "양", "서", "송", "천", "차", "문", "천"};
		String[] temp2 = { "유", "정", "석", "인", "지", "은", "형", "순", "성", "민", "정"
				, "민", "우", "동", "준", "진", "표", "현", "연", "시", "호", "태", "수", "나"
				, "승", "환", "윤", "종", "하", "혁", "원", "성", "희", "규", "경", "서", "채"
				, "혁", "효", "강", "경", "선", "소", "찬", "영", "호", "훈", "주", "재", "철" };
		String[] temp3 = { "서울시", "인천시", "부산시", "대전시", "광주시", "대구시", "목포시"
				, "창원시", "울산시", "제주시", "성남시", "남양주시", "김포시", "구리시", "강릉시"
				, "천안시", "전주시", "여수시", "나주시", "포항시", "사천시", "거제시" };
		String[] temp4 = { "강남구", "강서구", "강북구", "강동구", "종로구", "중구", "용산구"
				, "성동구", "동대문구", "성북구", "도봉구", "금천구", "동작구", "관악구", "서초구"
				, "동구", "서구", "남구", "북구", "수성구", "송파구", "사하구", "연제구", "달서구" };
		String[] temp5 = { "남", "여" };
//		String[] temp6 = { "자바", "자바스크립트", "파이썬", "유니티", "C" };
//		String[] temp7 = { "A", "B", "C", "D", "F" };
		String[] temp8 = { "O", "X" };
		String[] temp9 = { "" };
		
		writer.write("번호,이름,나이,성별,전화번호,주소,성적,등급,취업,결재,메모\n");
		
		Random rnd = new Random();
		
		for (int i=0; i<300; i++) {
			
			Student s = new Student();
			Student.temp++;
			s.setSeq(Student.temp);
						
			String name = temp1[rnd.nextInt(temp1.length)]
						+ temp2[rnd.nextInt(temp2.length)]
						+ temp2[rnd.nextInt(temp2.length)];
			int age = rnd.nextInt(10) + 20;
			String address = temp3[rnd.nextInt(temp3.length)]
						+ " "
						+ temp4[rnd.nextInt(temp4.length)];
			String gender = temp5[rnd.nextInt(temp5.length)];
//			String subject = temp6[rnd.nextInt(temp6.length)];
			String tel = "010-" + (rnd.nextInt(9000) + 1000)
						+ "-" + (rnd.nextInt(9000) + 1000);
			int score = rnd.nextInt(50) + 50;
			String grade = "";

			if (score <= 100 && score > 90) {
				grade = "A";
			} else if (score <= 90 && score > 80) {
				grade = "B";
			} else if (score <= 80 && score > 70) {
				grade = "C";
			} else if (score <= 70 && score > 60) {
				grade = "D";
			} else {
				grade = "F";
			}
			
			String job = temp8[rnd.nextInt(temp8.length)];
			String pay = temp8[rnd.nextInt(temp8.length)];
			String memo = temp9[0];
			
			s.setName(name);
			s.setAge(age);
			s.setAddress(address);
			s.setGender(gender);
			s.setTel(tel);
			s.setScore(score);
			s.setGrade(grade);
			s.setJob(job);
			s.setPay(pay);
			s.setMemo(memo);
			
			list.add(s);
			
			writer.write(s.getSeq() + "," + name + "," + age + "," + gender + "," + tel + "," 
			+ address + "," + score + "," + grade + "," + job + "," + pay + "," + memo + "\r\n");
			
		}
		System.out.println(list);
		writer.close();
	}
}
