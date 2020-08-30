package com.test.datetime;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex09_Datetime_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		aniv();
		
	}

	private static void aniv() throws Exception {
		
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		Calendar c4 = Calendar.getInstance();
		Calendar c5 = Calendar.getInstance();
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("남자 이름 : ");
		String man = reader.readLine();
				
		System.out.print("여자 이름 : ");
		String woman = reader.readLine();
				
		System.out.print("만난날(년) : ");
		String year = reader.readLine();
		int year1 = Integer.parseInt(year);
		
		System.out.print("만난날(월) : ");
		String month = reader.readLine();
		int month1 = Integer.parseInt(month);
		
		System.out.print("만난날(일) : ");
		String date = reader.readLine();
		int date1 = Integer.parseInt(date);
		
		c1.set(year1, month1-1, date1);
		c1.add(Calendar.DATE, 100);
		
		c2.set(year1, month1-1, date1);
		c2.add(Calendar.DATE, 200);
		
		c3.set(year1, month1-1, date1);
		c3.add(Calendar.DATE, 300);
		
		c4.set(year1, month1-1, date1);
		c4.add(Calendar.DATE, 500);
		
		c5.set(year1, month1-1, date1);
		c5.add(Calendar.DATE, 1000);
		
		System.out.printf("\'%s\'과(와) \'%s\'의 기념일\n", man, woman);
		System.out.printf("%4d일 : %tF\n", 100, c1);
		System.out.printf("%4d일 : %tF\n", 200, c2);
		System.out.printf("%4d일 : %tF\n", 300, c3);
		System.out.printf("%4d일 : %tF\n", 500, c4);
		System.out.printf("%4d일 : %tF\n", 1000, c5);
		
		
		}

}
