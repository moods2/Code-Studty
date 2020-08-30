package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_11 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("금액(원) : ");
		String money = reader.readLine();
		
		System.out.print("일금 ");
		
		for (int i=0; i<money.length(); i++) {
			
			System.out.print(change(money.charAt(i), money.length()-i));
			//숫자를 문자형으로 변환해서 change메소드를 통해 한글로 변환, 단위
			
		}
		
		System.out.println("원");
			
	}

	private static String change(int kor, int unit) {
		
		String result = "";
		String won = "";
		String dan = "";
		
		switch (kor) { //'0' ~ '9' = '48' ~ '57'
		case 48 :
			won = ""; break;
		case 49 :
			won = "일"; break;
		case 50 :
			won = "이"; break;
		case 51 :
			won = "삼"; break;
		case 52 :
			won = "사"; break;
		case 53 :
			won = "오"; break;
		case 54 :
			won = "육"; break;
		case 55 :
			won = "칠"; break;
		case 56 :
			won = "팔"; break;
		case 57 :
			won = "구"; break;		
		}
		switch (unit) {
		case 5 :
			dan = "만"; break;
		case 4 :
			dan = "천"; break;
		case 3 :
			dan = "백"; break;
		case 2 :
			dan = "십"; break;
		case 1 :
			dan = ""; break;
	
		}
		
		result = won + dan;
		
		return result;
		
	}

}
