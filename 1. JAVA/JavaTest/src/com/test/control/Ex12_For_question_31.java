package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_31 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		boolean loop = true;
		int money = 100000;
		
		for (;loop;) {
			
			System.out.println("     My Bank를 시작합니다.     ");
			System.out.println("===============================");
			System.out.println("            My Bank            ");
			System.out.println("===============================");
			System.out.println("         1. 계좌 입금         ");
			System.out.println("         2. 계좌 출금         ");
			System.out.println("         3. 잔액 조회         ");
			System.out.println("         4. 종료              ");
			System.out.println("===============================");
			System.out.print(" 선택(번호) : ");
			String num = reader.readLine();
			
			if(num.equals("1")) {
				
				System.out.println("===============================");
				System.out.println("           계좌 입금           ");
				System.out.println("===============================");
				System.out.print(" 계좌 비밀번호 : ");
				String pw = reader.readLine();
				
				if(pw.equals("1234")) {
					
					System.out.print(" 입금액 : ");
					int moneyin = Integer.parseInt(reader.readLine());
					
					System.out.printf("%,d원이 입금되었습니다.\n", moneyin);
					money += moneyin;
					pause();
					
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
					pause();
				}
				
			} else if(num.equals("2")) {
				
				System.out.println("===============================");
				System.out.println("           계좌 출금           ");
				System.out.println("===============================");
				System.out.print(" 계좌 비밀번호 : ");
				String pw = reader.readLine();
				
				if(pw.equals("1234")) {
					
					System.out.print(" 출금액 : ");
					int moneyout = Integer.parseInt(reader.readLine());
					
					System.out.printf("%,d원이 출금되었습니다.\n", moneyout);
					money -= moneyout;
					pause();
					
				} else {
					System.out.println("비밀번호가 틀렸습니다.");
					pause();
				}
				
			} else if(num.equals("3")) {
				
				System.out.println("===============================");
				System.out.println("           잔액 조회           ");
				System.out.println("===============================");
				System.out.printf(" 현재 잔액 : %,d원\n", money);
				pause();
				
			} else {
				
				loop = false;
			}	
		
		}
		
	}

	private static void pause() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("계속하시려면 엔터를 입력하세요.");
		
		reader.readLine();
		
	}

}

