package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_08 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("역의 개수 : ");
		String sub = reader.readLine();
		
		System.out.print("환승역의 횟수 : ");
		String change = reader.readLine();
		
		System.out.print("시간대(0 ~ 24) : ");
		String when = reader.readLine();
		
		int sub1 = Integer.parseInt(sub);
		
		int change1 = Integer.parseInt(change);
		
		int when1 = Integer.parseInt(when);
				
		getTime(sub1, change1, when1);
		
	}

	public static int getTime(int sub1, int change1, int when1) throws Exception {
		
		int time = !(when1 >= 7 && when1 <= 9) && !(when1 >= 17 && when1 <= 19) ? sub1 * 2 + change1 * 3 // 평상시
				: (when1 >= 7 && when1 <= 9) ? sub1 * 2 + change1 * 4 // 출근
				: (when1 >= 17 && when1 <= 19) ? sub1 * 2 + change1 * 5 : sub1 * 2 + change1 * 3 ; // 퇴근
		
		System.out.printf("총 소요 시간은 %d분입니다.", time);
		
		return time;
		
	}
	
	
}
