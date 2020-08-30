package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_12 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		boolean loop = true;
		String kor = "";
		
		for (;loop;) {
		
		System.out.print("숫자 : ");
		int num = Integer.parseInt(reader.readLine());
		
			if (num >= 10){
				
				break;
		
			} else if (num == 1) {
				
				kor += "일";
			} else if (num ==2) {
				
				kor += "이";
			} else if (num ==3) {
				
				kor += "삼";
			} else if (num ==4) {
			
				kor += "사";
			} else if (num ==5) {
		
				kor += "오";
			} else if (num ==6) {
	
				kor += "육";
			} else if (num ==7) {
	
				kor += "칠";
			} else if (num ==8) {
	
				kor += "팔";
			} else if (num ==9) {
	
				kor += "구";
			} else if (num ==0) {
	
				kor += "영";
			}
		
		}
		
		System.out.printf("%s", kor);
		
	}

}
