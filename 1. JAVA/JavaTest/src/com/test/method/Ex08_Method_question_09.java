package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("맑은 날 : ");
		String sunny = reader.readLine();
		
		System.out.print("흐린 날 : ");
		String cloudy = reader.readLine();
		
		int sunnyd = Integer.parseInt(sunny);
		
		int cloudyd = Integer.parseInt(cloudy);
		
		getApple(sunnyd, cloudyd);
		
	}

	public static int getApple(int sunnyd, int cloudyd) {
		
		int apple = (sunnyd * 5 + cloudyd * 2 - 100) / 10;
				
		System.out.printf("사과가 총 %d개 열렸습니다.", apple);
		
		return apple;
		
	}
	
}
