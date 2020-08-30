package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자 : ");
		
		String num = reader.readLine();
		
		int a = Integer.parseInt(num);
		
		getNumber(a);
		
		
		}
	
	public static String getNumber(int a) throws Exception {
		
		String result = (a % 2 == 1) ? "홀수" : "짝수";
		
		System.out.printf("입력하신 숫자 \'%d\'는(은) \'%s\'입니다.", a, result);
		
		return result;
		
	}

}
