package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Ex15_Array_question_07 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("숫자의 개수 : ");
		int len = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[len];
		
		
		for (int i=0; i<len; i++) {
			
			nums[i] = (int)(Math.random() * 10) + 1;
			
			for (int j=0; j<i; j++) {
				
				if (nums[i] == 10) {
					
					i--;
					
			
				} else if (nums[i] == nums[j]) {
					
					i--;
					
				}
				
			}			
			
		}
		
		System.out.println(Arrays.toString(nums));

	}

}
