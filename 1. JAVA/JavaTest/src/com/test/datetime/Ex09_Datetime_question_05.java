package com.test.datetime;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex09_Datetime_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		live();
		
	}

	private static void live() throws Exception {
				
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("아빠 생일(년) : ");
		String dadyear = reader.readLine();
		int dadyear1 = Integer.parseInt(dadyear);
		
		System.out.print("아빠 생일(월) : ");
		String dadmonth = reader.readLine();
		int dadmonth1 = Integer.parseInt(dadmonth);
		
		System.out.print("아빠 생일(일) : ");
		String daddate = reader.readLine();
		int daddate1 = Integer.parseInt(daddate);
		
		System.out.print("딸 생일(년) : ");
		String dauyear = reader.readLine();
		int dauyear1 = Integer.parseInt(dauyear);
		
		System.out.print("딸 생일(월) : ");
		String daumonth = reader.readLine();
		int daumonth1 = Integer.parseInt(daumonth);
		
		System.out.print("딸 생일(일) : ");
		String daudate = reader.readLine();
		int daudate1 = Integer.parseInt(daudate);
		
		Calendar dad = Calendar.getInstance();
		dad.set(dadyear1, dadmonth1-1, daddate1);
		long dadTick = dad.getTimeInMillis();
		
		
		Calendar dau = Calendar.getInstance();
		dau.set(dauyear1, daumonth1-1, daudate1);
		long dauTick = dau.getTimeInMillis();
		
		System.out.printf("아빠는 딸보다 총 %,d일을 더 살았습니다."
							, (dauTick - dadTick) / 1000 / 60 / 60 / 24);
		
		
		
	}

}
