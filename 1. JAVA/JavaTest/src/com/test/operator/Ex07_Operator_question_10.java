package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_10 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("섭씨(˚C) : ");
		
		String temp = reader.readLine();
		
		float temp1 = Float.parseFloat(temp);
		
		System.out.printf("섭씨 %.1f˚C는 화씨 %.1f˚F입니다.", temp1, temp1 * 1.8 + 32);
		
		
		
		
	}

}
