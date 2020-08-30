package com.test.control;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex10_if_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("년 : ");
		int year = Integer.parseInt(reader.readLine());		
		System.out.print("월 : ");
		int month = Integer.parseInt(reader.readLine());		
		System.out.print("일 : ");
		int date = Integer.parseInt(reader.readLine());
		
		Calendar c1 = Calendar.getInstance(); //시간 불러오기
		
		c1.set(year, month -1, date); //시간 세팅
		
		
		if(c1.get(Calendar.DAY_OF_WEEK) == 1 || c1.get(Calendar.DAY_OF_WEEK) == 7) { // 1(일요일), 7(토요일)
			
			System.out.println("입력하신 날짜는 \'휴일\'입니다.\n"
					+ "결과가 없습니다.");
			
		} else if(c1.get(Calendar.DAY_OF_WEEK) == 2) { 
			
			c1.add(Calendar.DAY_OF_WEEK, 5); // 2(월요일) 일때 5를 추가해서 토요일로 맞춤
			
			System.out.printf("입력하신 날짜는 \'평일\'입니다.\n"
					+ "해당 주의 토요일로 이동합니다.\n"
					+ "이동한 날짜는 \'%tF\'입니다.", c1);
			
		} else if(c1.get(Calendar.DAY_OF_WEEK) == 3) {
			
			c1.add(Calendar.DAY_OF_WEEK, 4); // 3(화요일) 일때 4를 추가해서 토요일로 맞춤
			
			System.out.printf("입력하신 날짜는 \'평일\'입니다.\n"
					+ "해당 주의 토요일로 이동합니다.\n"
					+ "이동한 날짜는 \'%tF\'입니다.", c1);
			
		} else if(c1.get(Calendar.DAY_OF_WEEK) == 4) {
			
			c1.add(Calendar.DAY_OF_WEEK, 3); // 4(수요일) 일때 3를 추가해서 토요일로 맞춤
			
			System.out.printf("입력하신 날짜는 \'평일\'입니다.\n"
					+ "해당 주의 토요일로 이동합니다.\n"
					+ "이동한 날짜는 \'%tF\'입니다.", c1);
			
		} else if(c1.get(Calendar.DAY_OF_WEEK) == 5) {
			
			c1.add(Calendar.DAY_OF_WEEK, 2); // 5(목요일) 일때 2를 추가해서 토요일로 맞춤
			
			System.out.printf("입력하신 날짜는 \'평일\'입니다.\n"
					+ "해당 주의 토요일로 이동합니다.\n"
					+ "이동한 날짜는 \'%tF\'입니다.", c1);
			
		} else if(c1.get(Calendar.DAY_OF_WEEK) == 6) {
			
			c1.add(Calendar.DAY_OF_WEEK, 1); // 6(금요일) 일때 1를 추가해서 토요일로 맞춤
			
			System.out.printf("입력하신 날짜는 \'평일\'입니다.\n"
					+ "해당 주의 토요일로 이동합니다.\n"
					+ "이동한 날짜는 \'%tF\'입니다.", c1);
			
		}
				
		
	}

}
