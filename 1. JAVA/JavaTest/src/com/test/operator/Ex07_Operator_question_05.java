package com.test.operator;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex07_Operator_question_05 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("한달 수입 금액(원) : ");
		
		String money = reader.readLine();
		
		int money1 = Integer.parseInt(money);
		
		System.out.printf("세후 금액(원) : %,.0f원\n", money1 - money1 * 0.033);
		
		System.out.printf("세금(원) : %,.0f원", money1 * 0.033);
		
		
		
	}

}
