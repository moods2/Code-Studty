package com.test.datetime;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex09_Datetime_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		food();
		
	}

	private static void food() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.println("음식을 받기 원하는 시각");
		System.out.print("시 : ");
		String hour = reader.readLine();
		int hour1 = Integer.parseInt(hour);
		
		System.out.print("분 : ");
		String minute = reader.readLine();
		int minute1 = Integer.parseInt(minute);		
		
		minute1 += hour1 * 60;	//시간과 분 단위 통일 (통일 안하면 분이 -가 되도 시간 변화가 없음)
		hour1 = 0;				//초기화
		
		minute1 += -10;			//10분 뒤 도착
		
		hour1 += minute1 / 60;	//60분이 넘어갈 때마다 시간에 추가
		minute1 = minute1 % 60;	//60분을 넘겨주고 남은 값
		
		System.out.printf("짜장면 : %d시 %d분\n", hour1, minute1);
		
		minute1 += -8;			//18분 뒤 도착 ( 위에서 10분 먼저 뺌)
		
		
		System.out.printf("치킨 : %d시 %d분\n", hour1, minute1);
		
		minute1 += -7;			//25분 뒤 도착 ( 위에서 18분 먼저 뺌)
		
		System.out.printf("피자 : %d시 %d분\n", hour1, minute1);
		
				
		
	}

}
