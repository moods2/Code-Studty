package com.test.method;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08_Method_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("이름 : ");
		
		String name = reader.readLine();
		
		name = getName(name);
		
		System.out.printf("고객 : %s\n", name);
		
	}

	public static String getName(String a) throws Exception {
		
		String result = a + "님";
		
		return result;
		
	}
	
}
