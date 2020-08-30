package com.test.collection;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class Ex36_ArrayList_test {
	
	private static Output output; //전역
	private static Scanner scan;
	private static ArrayList<Student> list;
	
	static { //멤버 초기화
		output = new Output();
		scan = new Scanner(System.in);
		list = new ArrayList<Student>();
	}
	
	public static void main(String[] args) {
		
		//학생 정보 관리 프로그램
		
		//학생 정보
		// - 이름
		// - 나이
		// - 주소
		// - 연락처
		// - 번호(1 ~ 순차적 할당)
				
		//기능
		// - 학생 추가
		// - 학생 목록
		// - 학생 삭제
		// - 학생 검색
		// - 학생 수정(X)
		
		//생각?
		//1. 학생 1명 정보 > 관리 > 클래스 선언 > Student
		//2. 학생 여러명 관리 > 집합 자료형 > 가변 > ArrayList<Student>
		
		//클래스 파일 추가
		//1. Student.java : 학생 정보
		//2. Output.java : 출력 코드 담당 클래스(업무 분산)
		
		//프로그램 흐름
		// -> (메뉴 출력 -> 항목 선택 -> 기능 실행) x 무한 반복
		
//		Output output = new Output();
		
		dummy();
		
		output.begin();
		
		
		boolean loop = true;
//		Scanner scan = new Scanner(System.in);
		
		
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
				//학생 검색(이름)
				search();
			} else if (sel.equals("5")) {
				//학생 검색(전화)
				search2();
			} else if (sel.equals("6")) {
				//학생 검색(이름)
				search3();
			} else {
				//프로그램 종료
				loop = false;
			}
			
			
		}
		
		
		
		output.end();
		
		
	}//main

	private static void dummy() {
		
		//테스트용 데이터 x 10명
		String[] temp1 = { "김", "이", "박", "최", "정" };
		String[] temp2 = { "유", "정", "석", "인", "지", "은", "형", "순", "성", "민" };
		String[] temp3 = { "서울시", "인천시", "부산시", "대전시", "광주시" };
		String[] temp4 = { "강남구", "강서구", "강북구", "강동구" };
		
		Random rnd = new Random();
		
		for (int i=0; i<10; i++) {
			
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
			String tel = "010-" + (rnd.nextInt(9000) + 1000)
						+ "-" + (rnd.nextInt(9000) + 1000);
			
			s.setName(name);
			s.setAge(age);
			s.setAddress(address);
			s.setTel(tel);
			
			list.add(s); //목록 추가
			
		}
		
	}//dummy
	
	private static void search3() {
		
		output.title(Title.SEARCH);
		
		System.out.print("검색(이름) : "); //토큰 검색 
		String word = scan.nextLine(); //김 이 박
		
		String[] wordList = word.split(" ");
		
		System.out.println("[번호]\t[이름]\t[나이]\t[연락처]\t[주소]");
		
		for (Student s : list) {
			
			if (isName(s.getName(), wordList)) {
			System.out.printf("%5d\t%s\t%5d\t%s\t%s\n"
								, s.getSeq()
								, s.getName()
								, s.getAge()
								, s.getTel()
								, s.getAddress());
			}
			
		}

		output.pause(scan);
			
	}//search3
	
	private static boolean isName(String name, String[] wordList) {
		
		boolean flag = false;
		
		for (String word : wordList) {
			
			
			if (name.contains(word.replace("-", "")) && !word.startsWith("-")) {
				
				flag = true;
				
			} else if (name.contains(word.replace("-", "")) && word.startsWith("-")) {
				
				flag = false;
				break;
				
			}
			
		}
		
		return flag;
		
	}//isName

	private static void search2() {
		
		output.title(Title.SEARCH);
		

		System.out.print("검색(전화) : ");
		String word = scan.nextLine();
		
		System.out.println("[번호]\t[이름]\t[나이]\t[연락처]\t[주소]");
		
		for (Student s : list) {
			
			if (s.getTel().replace("-", "").contains(word)) {
			System.out.printf("%5d\t%s\t%5d\t%s\t%s\n"
								, s.getSeq()
								, s.getName()
								, s.getAge()
								, s.getTel()
								, s.getAddress());
			}
			
		}

		output.pause(scan);
		
	}//search2

	private static void search() {
		
		output.title(Title.SEARCH);
		
		//검색?
		// -> list() 작업과 유사
		// 1. list() : 모든 데이터 출력
		// 2. search() : 일부 데이터 출력. 조건부 list()
		
		System.out.print("검색(학생명) : "); //홍길동 > 길동
		String word = scan.nextLine();
		
		System.out.println("[번호]\t[이름]\t[나이]\t[연락처]\t[주소]");
		
		for (Student s : list) {
			
//			if (s.getName().indexOf(word) > -1) {
//			if (s.getName().toUpperCase().contains(word.toUpperCase())) { //영문찾기 (대문자로)
			if (s.getName().contains(word)) {
			System.out.printf("%5d\t%s\t%5d\t%s\t%s\n"
								, s.getSeq()
								, s.getName()
								, s.getAge()
								, s.getTel()
								, s.getAddress());
			}
			
		}

		output.pause(scan);
		
	}//search

	private static void delete() {
		
		output.title(Title.DELETE);
		
		listName(); //목록을 먼저 출력
		
		System.out.print("삭제할 번호 : ");
		int seq = scan.nextInt();
		scan.skip("\r\n");
		
		//삭제? -> 배열(ArrayList) -> remove() -> 몇번째방? -> 배열 탐색 -> 각각 확인?
		
		for(int i=0; i<list.size(); i++) {
			
			if(list.get(i).getSeq() == seq) {
				list.remove(i); //학생 목록 제거
				break;
			}
			
		}
		
		output.pause(scan);
		
	}//delete

	private static void list() {
		
		output.title(Title.LIST);
		
		listName();
		
		output.pause(scan);		
		
	}

	private static void listName() {
		
		System.out.println("[번호]\t[이름]\t[나이]\t[연락처]\t[주소]");
		
		for (Student s : list) {
			
			System.out.printf("%5d\t%s\t%5d\t%s\t%s\n"
								, s.getSeq()
								, s.getName()
								, s.getAge()
								, s.getTel()
								, s.getAddress());			
		}
		
	}//list

	private static void add() {
		
		output.title(Title.ADD);
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		
		System.out.print("나이 : ");
		int age = scan.nextInt();	//nextInt() -> scan.skip() -> nextLine()
		scan.skip("\r\n"); 			//한줄이 생겨서 뒤에오는 nextLine을 못받는다
		
		System.out.print("주소 : ");
		String address = scan.nextLine();
		
		System.out.print("연락처 : ");
		String tel = scan.nextLine();
		
		//입력받은 정보 > Student 객페 포장
		Student s = new Student();
		
		Student.temp++; //일련 번호
		
		s.setSeq(Student.temp);
		s.setName(name);
		s.setAge(age);
		s.setAddress(address);
		s.setTel(tel);
		
		//학생 목록 추가 (******)
		list.add(s);
		
		//잠시 멈춤
		output.pause(scan);
		
		
	}//add

}//Ex36
