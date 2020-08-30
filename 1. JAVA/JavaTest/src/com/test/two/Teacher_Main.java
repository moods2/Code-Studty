package com.test.two;

import java.util.Scanner;

public class Teacher_Main {
	
	private static Output output; //전역
	private static Scanner scan;
	
	static {
		
		output = new Output();
		scan = new Scanner(System.in);
		
	}
	
	public static void main(String[] args) {
		
		output.begin();
		
		boolean loop = true;
		
		while (loop) {
			
			output.teacherMainMenu();
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) {
				//회원 정보
				teacherData();
			} else if (sel.equals("2")) {
				//수강생 관리
				studentManage();
				
				output.teacherGradeMenu();
				
				String sel1 = scan.nextLine();
				
				if (sel1.equals("1")) {
					//수강생 성적 추가
//					addScore;
				} else if (sel1.equals("2")) {
					//수강생 성적 수정
//					correctScore;
				} else if (sel1.equals("3")) {
					//수강생 성적 삭제
//					deleteScore;
				} else if (sel1.equals("4")) {
					//수강생 성적 검색
//					searchScore;
				} else {
					//프로그램 종료
					loop = false;
				}
						
			} else if (sel.equals("3")) {
				//수업 자료 확인
				fileCheck();
				
				output.teacherClassFile();
				
				String sel2 = scan.nextLine();
				
				if (sel2.equals("1")) {
					//수업 자료 업로드
//					fileUpload();
				} else if (sel2.equals("2")) {
					//수업 자료 수정
//					fileCorrect();
				} else if (sel2.equals("3")) {
					//수업 자료 삭제
//					fileDelete();
				} else if (sel2.equals("4")) {
					//수업 자료 검색
//					fileSearch();
				} else if (sel2.equals("5")) {
					//로그아웃
					
				} else {
					//프로그램 종료
					loop = false;
				}
				
			} else if (sel.equals("4")) {
				//로그아웃
				
			} else {
				//프로그램 종료
				loop = false;
			}
			
		}		
		
		output.end();
		
		
	}

	private static void fileCheck() { //수업 자료 업로드
		
		
	}

	private static void studentManage() { //수강생 관리
		
		
	}

	private static void teacherData() { //회원 정보
		
		
		
	}

}
