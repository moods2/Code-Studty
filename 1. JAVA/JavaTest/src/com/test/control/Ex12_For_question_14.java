package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_14 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		boolean loop = true;
		
		for (;loop;) {
			
			System.out.println("========================");
			System.out.println("         자판기         ");
			System.out.println("========================");
			System.out.println("1. 콜라          : 700원");
			System.out.println("2. 사이다        : 600원");
			System.out.println("3. 비타500       : 500원");
			System.out.println("------------------------");
			System.out.print("금액 투입(원) : ");
			int money = Integer.parseInt(reader.readLine());
			System.out.println("------------------------");
			System.out.print("음료 선택(번호) : ");
			String num = reader.readLine();
			
			if(num.equals("1")) {
			
				System.out.println("+ 콜라를 제공합니다.");
				System.out.printf("+ 잔돈 %d원을 제공합니다.\n\n", money - 700);
				pause();
								
			} else if(num.equals("2")) {

				System.out.println("+ 사이다를 제공합니다.");
				System.out.printf("+ 잔돈 %d원을 제공합니다.\n\n", money - 600);
				pause();

			} else if(num.equals("3")) {
				
				System.out.println("+ 비타500을 제공합니다.");
				System.out.printf("+ 잔돈 %d원을 제공합니다.\n\n", money - 500);
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
