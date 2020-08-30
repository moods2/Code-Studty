package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex10_if_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("[들어온 시간]");
		System.out.print("시 : ");
		int hour1 = Integer.parseInt(reader.readLine());
		System.out.print("분 : ");
		int minute1 = Integer.parseInt(reader.readLine());
		
		System.out.println("[나간 시간]");
		System.out.print("시 : ");
		int hour2 = Integer.parseInt(reader.readLine());
		System.out.print("분 : ");
		int minute2 = Integer.parseInt(reader.readLine());
		
		minute1 += hour1 * 60;	//시를 분으로 치환
		hour1 = 0; //시 초기화

		
		minute2 += hour2 * 60;	
		hour2 = 0;

		
		int minute = minute2 - minute1; //나간시간 - 들어온시간
		int money = 0; 
		
		if (minute > 30) { //30분 넘어갈 때
			
			money = (minute - 30) / 10 * 2000;
			
			System.out.printf("주차 요금은 %,d원입니다.", money);
			
		} else {
			
			System.out.println("무료입니다.");
			
		}
		
		
		
	}

}
