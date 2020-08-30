package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;


public class Ex15_Array_question_04 {
	
	public static void main(String[] args) throws Exception {
		
		m1();	
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("배열의 길이 : ");
		int len = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[len];
		int[] nums2 = new int[len/2];
		String result = "";
		
		
		for (int i=0; i<nums.length; i++) {
			
			int n = (int)(Math.random() * 10 + 1);
			
			nums[i] = n;
			
			if (i == nums.length -1) {
				
				result += nums[i];
				
			} else {
			
			result += nums[i] + ", ";
			
			}
			
		}
		
		System.out.printf("nums = [%s]\n", result);
		
		result = "";
		
		//nums = [5, 6, 3, 10, 2, 10, 4, 4, 5, 5]
		for (int i=0; i<nums.length; i++) {
			
			//0, 1
			if (i == 0) {
				
				result += nums[i] + nums[i+1] + ", ";
				
			//2, 3	
			} else if (i == 2) {
				
				result += nums[i] + nums[i+1] + ", ";
				
			//4, 5
			} else if (i == 4) {
				
				result += nums[i] + nums[i+1] + ", ";
				
			} else if (i == 6) {
				
				result += nums[i] + nums[i+1] + ", ";
				
			} else if (i == 8) {
				
				result += nums[i] + nums[i+1];
				
			}
			
		}

		System.out.printf("nums2 = [%s]", result);
			
		
		
		
	}

}
