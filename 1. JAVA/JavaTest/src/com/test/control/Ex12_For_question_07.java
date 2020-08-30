package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("아래에 입력하세요.");
		boolean loop = true;
		String result = "";
				
		for (;loop;) {

			String sentence = reader.readLine();
			
			result += sentence + "\n";
			
			if (sentence.equals("")) {
				
				break;
				
			}
			
		}
		
		System.out.print(result);
		System.out.print("프로그램을 종료합니다.");
		
	}

}
