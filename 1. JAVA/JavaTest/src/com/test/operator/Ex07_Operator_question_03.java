package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_03 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("너비(cm) : ");
		
		String width = reader.readLine();
		
		System.out.print("높이(cm) : ");
		
		String height = reader.readLine();
		
		int width1 = Integer.parseInt(width);
		
		int height1 = Integer.parseInt(height);
				
		System.out.printf("사각형의 넓이는 %dcm^2 입니다.\n", width1 * height1);
		
		System.out.printf("사각형의 둘레는 %dcm 입니다.\n", width1 * 2 + height1 * 2);
		
		
	}

}
