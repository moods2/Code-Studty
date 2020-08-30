package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("점수 : ");
		int score = Integer.parseInt(reader.readLine());
		
		if (score <= 100 && score >= 0) {
		
			if (score <= 100 && score >= 90) {
			
				System.out.printf("입력한 %d점은 성적 A입니다.", score);
			
				} else if (score <= 89 && score >= 80) {
			
					System.out.printf("입력한 %d점은 성적 B입니다.", score);
		
				} else if (score <= 79 && score >= 70) {
				
					System.out.printf("입력한 %d점은 성적 C입니다.", score);
					
				} else if (score <= 69 && score >= 60) {
						
					System.out.printf("입력한 %d점은 성적 D입니다.", score);
					
				} else if (score <= 59 && score >= 0) {
						
					System.out.printf("입력한 %d점은 성적 F입니다.", score);
						
				}
		} else {
			
			System.out.println("올바른 점수를 입력하세요.");
			
		}
					
	}

}
