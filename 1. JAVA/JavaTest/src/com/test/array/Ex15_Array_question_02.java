package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex15_Array_question_02 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int[] nums = new int[5];
		
		for (int i=0; i<5; i++) {
		
		System.out.print("숫자 : ");
		int number = Integer.parseInt(reader.readLine());
		nums[i] = number;
		 
		
		
		}
		
		for (int i=4; i>=0; i--) {
			
			System.out.printf("nums[%d] = %d\n", i, nums[i]);
		}
		
	}

}
