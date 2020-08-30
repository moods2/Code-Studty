package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex15_Array_question_03 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("학생 수 : ");
		int student = Integer.parseInt(reader.readLine());
		
		String[] list = new String[student];

		for (int i=0; i<list.length; i++) {
			
			System.out.print("학생명 : ");
			String name = reader.readLine();
			
			list[i] = name;
			
		}
		
		System.out.printf("입력한 학생은 총 %d명입니다.\n", student);
		
		for(int i=list.length-1; i>=0; i--) {
		
		System.out.printf("%d. %s\n", i, list[i]);
		
		}
		
	}

}
