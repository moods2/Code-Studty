package com.test.array;

public class Ex15_Array_question_05 {
	
	public static void main(String[] args) {
		
		m1();
		
	}

	private static void m1() {
		
		int[] nums = new int[20];
		int n = 0;
		String result = ""; 
		
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
		
		int max = nums[0];
		int min = nums[0];
		
		for (int i=0; i<nums.length; i++) {
			
			if (max < nums[i]) {
				
				max = nums[i];
				
			}
			
			if (min > nums[i]) {
				
				min = nums[i];
				
			}	
			
		}
		
		System.out.printf("최대값 : %d\n"
						+ "최소값 : %d", max, min);
		
	}

}
