package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Ex15_Array_question_09 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("삭제 위치 : ");
		int delete = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[5];		
		
		for (int i=0; i<5; i++) {
			
			nums[i] = (int)(Math.random() * 10);
			
			if (i == 4) {
			
				System.out.printf("원본 : %s\n", Arrays.toString(nums));
				
			} 
						
		}
		
		for(int i=delete; i<nums.length-1; i++) {
			
			nums[i] = nums[i+1];

		}
		
		System.out.printf("결과 : %s", Arrays.toString(nums));
		
	}

}
