package com.test.array;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Ex15_Array_question_08 {
	
	public static void main(String[] args) throws Exception {
		
		m1();
		
	}

	private static void m1() throws Exception {
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("삽입 위치 : ");
		int input = Integer.parseInt(reader.readLine());
		System.out.print("값 : ");
		int amount = Integer.parseInt(reader.readLine());
		
		int[] nums = new int[10];
		
		for(int i=0; i<10; i++) {
			
			nums[i] = (int)(Math.random() * 10);
			
			if (i == 9) {
				
				System.out.println(Arrays.toString(nums));
				
			}
			
		}
		
		for (int j=nums.length-1; j>1; j--) {
		
			nums[j] = nums[j-1];
			
			
			
			if (j == input) {
				
				nums[input] = amount;
				break;
				
			}	
			
		}
		
		System.out.println(Arrays.toString(nums));
	}

}
