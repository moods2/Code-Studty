package com.test.datetime;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Calendar;

public class Ex09_DateTime_use_01 {
	
	public static void main(String[] args) throws Exception {
		
		//m1();
		//m2();
		//m3();
		//m4();
		m5();
		
	}

	private static void m5() {
		
		//시각 - 시각 //tick
		//시각 + 시간 //add()
		//시각 - 시간 //add()
		//시간 + 시간 //+
		//시간 - 시간 //-
		
		//시간의 최대 자릿수 : 시간(일)
		
		//2시간 30분
		int hour = 2;
		int min = 30;
		
		//2시간 30분 + 40분 -> 3시간 10분
		min += 40;
		
		//자릿수 재정비(****)
		hour += min / 60;
		min = min % 60;
		
		System.out.printf("%d시간 %d분\n", hour, min);
		
		
	}

	private static void m4() {
		
		//시각 - 시각 = 시간
		
		//현재 시각의 tick
		// - 1970.01.01 00:00:00 ~ 현재 시각 -> 밀리초
		Calendar now = Calendar.getInstance();
		System.out.println(now.getTimeInMillis()); //1586847767689
		
		Calendar birth = Calendar.getInstance();
		birth.set(1995, 5, 10); //생일
		
		long nowTick = now.getTimeInMillis();
		long birthTick = birth.getTimeInMillis();
		
		System.out.printf("내가 태어난지 %,d일이 지났습니다.\n"
							, (nowTick - birthTick) / 1000 / 60 / 60 / 24);
		
		//올해 크리스마스 며칠 남았는지??
		Calendar christmas = Calendar.getInstance();
		christmas.set(2020, 11, 25);
		
		long christmasTick = christmas.getTimeInMillis();
		
		System.out.printf("올해 크리스마스는 %,d일 남았습니다.\n"
							, (christmasTick - nowTick) / 1000 / 60 / 60 / 24);
		
				
	}

	private static void m3() {
		
		//시각 + 시간
		//시각 - 시간
		// - void add(int, int)
		
		Calendar c1 = Calendar.getInstance();
		
//		c1.add(Calendar.HOUR, 5);
//		c1.add(Calendar.HOUR, 2);
//		c1.add(Calendar.DATE, 100);
//		c1.add(Calendar.MONTH, -1);
		c1.add(Calendar.MINUTE, -40);
		
		System.out.printf("%tF %tT\n", c1, c1);
				
		
	}

	private static void m2() {
		
		
		//시각
		//1. 현재 시각
		//2. 특정 시각
		//	a. void set(int, int)
		//	b. void set(int, int, int)
		//	c. void set(int, int, int, int, int)
		//	d. void set(int, int, int, int, int, int)
		
		//내 생일 -> 1995, 4, 30
		Calendar birthday = Calendar.getInstance();
		
		birthday.set(Calendar.YEAR, 1995);
		birthday.set(Calendar.MONTH, 3);	//**** month가 (0~11)이기 때문에 4월이지만 입력할 때는 -1
		birthday.set(Calendar.DATE, 30);
		birthday.set(Calendar.HOUR, 2);
		
		birthday.set(1996, 2, 15);
		birthday.set(1996, 2, 15, 2, 30);
		birthday.set(1996, 2, 15, 2, 30, 50);
		
		System.out.printf("%tF %tT\n", birthday, birthday);
		
		
	}

	private static void m1() throws Exception{
		
		Calendar c1 = Calendar.getInstance();	//이 때 시각(***)
		System.out.printf("%tT\n", c1);			//재사용
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("이름 : ");
		String name = reader.readLine();
		System.out.println(name);
		
		System.out.printf("%tT\n", c1);			//재사용
		
		
	}

}
