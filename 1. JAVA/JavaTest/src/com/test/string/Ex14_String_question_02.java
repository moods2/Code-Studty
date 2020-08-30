package com.test.string;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex14_String_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("이메일 : ");
		String mail = reader.readLine();
		
		int index = mail.lastIndexOf("@");
		String domain = mail.substring(index+1);
		String id = mail.substring(0, index);
		
		System.out.printf("아이디 : %s\n", id);
		System.out.printf("도메인 : %s", domain);
		
	}

}
