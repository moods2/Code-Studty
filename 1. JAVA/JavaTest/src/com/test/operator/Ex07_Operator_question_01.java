package com.test.operator;
import java.io.*;

public class Ex07_Operator_question_01 {

	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("태어난 년도 : ");
		
		String year = reader.readLine();
		
		int year1 = Integer.parseInt(year);
		
		System.out.printf("나이 : %d세", 2019 - year1 + 1);
				
		
		
	}
	
}
