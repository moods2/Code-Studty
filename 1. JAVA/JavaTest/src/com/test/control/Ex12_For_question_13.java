package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex12_For_question_13 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("컴퓨터가 1~10 사이의 숫자를 1개 생각했습니다.");
		boolean loop = true;
		double num = Math.random();
		int answer = ((int)(num * 10) + 1);
		int count = 1;
		
		for (;loop;) {
			
			System.out.print("숫자 : ");
			int num1 = Integer.parseInt(reader.readLine());
			
			if (num1 != answer) {
				
				System.out.print("틀렸습니다.\n");
				count++;
				
			} else if (num1 == answer){
								
				break;
				
			}
			
		}
		
		System.out.printf("컴퓨터가 생각한 숫자는 %d입니다."
				+ "정답을 맞추는데 시도한 횟수는 %d회입니다.", answer, count);
		
	}

}
