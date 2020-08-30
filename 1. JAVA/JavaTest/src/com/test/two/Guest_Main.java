package com.test.two;

import java.util.Scanner;

public class Guest_Main {
	
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
			
			output.guestMenu();
			
			String sel = scan.nextLine();
			
			if (sel.equals("1")) {
				//교육과정 조회
//				seeCurriculum();
				
				output.guestCurriculum();
				
				String sel1 = scan.nextLine();
				
				if (sel1.equals("1")) {
					//교육과정 검색
//					searchCurriculum();					
				} else if (sel1.equals("2")) {
					//이전 화면
					
				} else {
					//프로그램 종료
					loop = false;
				}
				
			} else if (sel.equals("2")) {
				//1대1 문의
//				question();
			} else if (sel.equals("3")) {
				//로그아웃
				
			} else {
				//프로그램 종료
				loop = false;
			}
			
		}		
		
		output.end();
		
		
		
	}

}
