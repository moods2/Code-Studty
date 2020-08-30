package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("국어 : ");
		String kor = reader.readLine();
		int kor1 = Integer.parseInt(kor);
		
		System.out.print("영어 : ");
		String eng = reader.readLine();
		int eng1 = Integer.parseInt(eng);
		
		System.out.print("수학 : ");
		String math = reader.readLine();
		int math1 = Integer.parseInt(math);
		
		test(kor1, eng1, math1);
				
	}

	public static String test(int kor1, int eng1, int math1) {
		
		String avg = (kor1 + eng1 + math1) / 3 < 60 | kor1 < 40 | eng1 < 40 | math1 < 40 ? "불합격" 
				: (kor1 + eng1 + math1) / 3 >= 60 ? "합격" : "";
		
		System.out.printf("%s입니다.", avg);
		
		return avg;
		
	}
	
}
