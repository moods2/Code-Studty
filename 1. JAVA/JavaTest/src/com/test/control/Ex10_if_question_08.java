package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_08 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("년도 입력 : ");
		int year = Integer.parseInt(reader.readLine());
		
		if (year % 4 == 0) { //4로 나누어 떨어지면 넘어감
			
			if (year % 100 == 0) { //100으로 나누어 떨어지면 넘어감
				
				if(year % 400 == 0) { //400으로 나누어 떨어지면 윤년
					
					System.out.printf("%d년은 \'윤년\'입니다.", year);
					
				} else { 
					
					System.out.printf("%d년은 \'평년\'입니다.", year);						
				}
				
			} else { 
				
				System.out.printf("%d년은 \'윤년\'입니다.", year);				
			}
			
		} else {
			
			System.out.printf("%d년은 \'평년\'입니다.", year);			
		}
		
	}

}
