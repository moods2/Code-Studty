package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex15_Array_question_06 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		int[] nums = new int[20];
		int n = 0;
		String result = "";
		
		System.out.print("최대 범위 : ");
		int max = Integer.parseInt(reader.readLine());
		System.out.print("최소 범위 : ");
		int min = Integer.parseInt(reader.readLine());
		
		
		for (int i=0; i<nums.length; i++) {
		
		n = (int)(Math.random() * 20 + 1);
		
		nums[i] = n;
		
			if (i == nums.length-1) {
			
				result += nums[i];
			
			} else {
		
				result += nums[i] + ", ";
				
			}
		
		}
		
		System.out.printf("원본 : %s\n", result);
		
		result = "";
		
		for (int i=0; i<nums.length; i++) {
			
			if (nums[i] <= max && nums[i] >= min) {
				
				if(i == nums.length-1) {
					
					result += nums[i];
					
				} else {
					
					result += nums[i] + ", ";
					
				}
				
			} else {
				
				continue;
				
			}
			
		}
		
		System.out.printf("결과 : %s\n", result);
		
	}

}
